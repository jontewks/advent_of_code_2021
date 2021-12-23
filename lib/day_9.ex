defmodule AOC.Day9 do
  def part_1(args) do
    args
    |> prep_input()
    |> count_lows()
  end

  def part_2(args) do
    args
    |> prep_input()
  end

  def count_lows(matrix) do
    points =
      for x <- 0..(length(List.first(matrix)) - 1), y <- 0..(length(matrix) - 1), do: [x, y]

    Enum.reduce(points, 0, fn [x, y], acc ->
      item = get_at([x, y], matrix)
      above = [x, y] |> up() |> get_at(matrix)
      below = [x, y] |> down() |> get_at(matrix)
      before = [x, y] |> left() |> get_at(matrix)
      next = [x, y] |> right() |> get_at(matrix)

      if item < above && item < below && item < before && item < next do
        acc + item + 1
      else
        acc
      end
    end)
  end

  def up([x, y]) do
    [x, y + 1]
  end

  def down([x, y]) do
    [x, y - 1]
  end

  def left([x, y]) do
    [x - 1, y]
  end

  def right([x, y]) do
    [x + 1, y]
  end

  def get_at([x, y], matrix) do
    row = Enum.at(matrix, y, [])
    Enum.at(row, x, :infinity)
  end

  def prep_input(args) do
    args
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split(&1, "", trim: true))
    |> Enum.map(fn string_list ->
      Enum.map(string_list, &String.to_integer/1)
    end)
  end
end
