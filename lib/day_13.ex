defmodule AOC.Day13 do
  def part_1(args) do
    args
    |> prep_input()
    |> place_dots()
    |> fold(1)
    |> count_dots()
  end

  def part_2(args) do
    args
    |> prep_input()
    |> place_dots()
    |> fold()
    |> pretty_print()
  end

  def place_dots([coords, folds]) do
    num_cols =
      coords
      |> Enum.max_by(fn [x, _y] -> x end)
      |> Enum.at(0)
      |> Kernel.+(1)

    num_rows =
      coords
      |> Enum.max_by(fn [_x, y] -> y end)
      |> Enum.at(1)
      |> Kernel.+(1)

    empty_row = List.duplicate(nil, num_cols)
    matrix = List.duplicate(empty_row, num_rows)

    with_dots =
      Enum.reduce(coords, matrix, fn [x, y], acc ->
        updated_row =
          acc
          |> Enum.at(y)
          |> List.replace_at(x, true)

        List.replace_at(acc, y, updated_row)
      end)

    [with_dots, folds]
  end

  def fold([matrix, folds], times \\ nil) do
    folds =
      if times != nil do
        Enum.take(folds, times)
      else
        folds
      end

    Enum.reduce(folds, matrix, fn fold, acc ->
      [dir, index] = String.split(fold, "=")
      index_int = String.to_integer(index)

      if dir == "y" do
        fold_up(acc, index_int)
      else
        fold_left(acc, index_int)
      end
    end)
  end

  def fold_up(matrix, index) do
    {top, bottom} = matrix |> List.delete_at(index) |> Enum.split(index)

    bottom
    |> Enum.reverse()
    |> Enum.with_index()
    |> Enum.reduce([], fn {bottom_section_row, row_index}, acc ->
      top_section_row = Enum.at(top, row_index)

      merged_row =
        bottom_section_row
        |> Enum.with_index()
        |> Enum.reduce([], fn {item, col_index}, acc ->
          if item == true || Enum.at(top_section_row, col_index) == true do
            [true | acc]
          else
            [false | acc]
          end
        end)
        |> Enum.reverse()

      [merged_row | acc]
    end)
    |> Enum.reverse()
  end

  def fold_left(matrix, index) do
    matrix
    |> transpose()
    |> fold_up(index)
    |> transpose()
    |> transpose()
    |> transpose()
  end

  def transpose(matrix) do
    matrix
    |> List.zip()
    |> Enum.map(&Tuple.to_list/1)
  end

  def count_dots(matrix) do
    matrix
    |> List.flatten()
    |> Enum.filter(fn x -> x == true end)
    |> length()
  end

  def pretty_print(matrix) do
    # Adds line break between the output and the test status dots
    IO.puts("")

    Enum.each(matrix, fn row ->
      row
      |> Enum.map(fn item ->
        if item == false do
          " "
        else
          "X"
        end
      end)
      |> Enum.join()
      |> IO.inspect(width: :infinity)
    end)
  end

  def prep_input(args) do
    args
    |> String.split("\n\n", trim: true)
    |> Enum.map(&String.split(&1, "\n", trim: true))
    |> then(fn [coords, folds] ->
      [
        coords
        |> Enum.map(&String.split(&1, ","))
        |> Enum.map(fn coord -> Enum.map(coord, &String.to_integer/1) end),
        folds
        |> Enum.map(&String.split(&1, "fold along ", trim: true))
        |> List.flatten()
      ]
    end)
  end
end
