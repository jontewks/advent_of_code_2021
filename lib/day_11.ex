defmodule AOC.Day11 do
  def part_1(args) do
    args
    |> prep_input()
    |> simulate(100)
  end

  def part_2(args) do
    args
    |> prep_input()
    |> find_first_simultaneous_flash()
  end

  def simulate(matrix, times, flash_count \\ 0)

  def simulate(_matrix, 0, flash_count) do
    flash_count
  end

  def simulate(matrix, times, flash_count) do
    {updated_matrix, flashes} = step(matrix)
    simulate(updated_matrix, times - 1, flash_count + flashes)
  end

  def step(matrix) do
    matrix
    |> energy_up()
    |> fire_flashes()
    |> count_and_reset_flashers()
  end

  def energy_up(matrix) do
    matrix
    |> Enum.map(fn row ->
      Enum.map(row, fn num -> num + 1 end)
    end)
  end

  def fire_flashes(matrix) do
    matrix
    |> Enum.with_index()
    |> Enum.reduce_while(matrix, fn {row, row_index}, acc ->
      if col_index = Enum.find_index(row, fn val -> val > 9 end) do
        octopus = [row_index, col_index]
        updated = flash(octopus, acc)
        {:halt, fire_flashes(updated)}
      else
        {:cont, acc}
      end
    end)
  end

  def flash([row_index, col_index] = coords, matrix) do
    row_with_flashed =
      matrix
      |> Enum.at(row_index)
      |> List.replace_at(col_index, -9999)

    matrix_with_flashed = List.replace_at(matrix, row_index, row_with_flashed)

    coords_to_increase =
      [
        up(coords),
        down(coords),
        left(coords),
        right(coords),
        coords |> up() |> left(),
        coords |> up() |> right(),
        coords |> down() |> left(),
        coords |> down() |> right()
      ]
      |> Enum.filter(&coords_inbounds?/1)

    Enum.reduce(coords_to_increase, matrix_with_flashed, fn [row_index, col_index], acc ->
      if row = Enum.at(acc, row_index) do
        updated = List.update_at(row, col_index, fn num -> num + 1 end)
        List.replace_at(acc, row_index, updated)
      else
        acc
      end
    end)
  end

  def up([row_index, col_index]) do
    [row_index + 1, col_index]
  end

  def down([row_index, col_index]) do
    [row_index - 1, col_index]
  end

  def left([row_index, col_index]) do
    [row_index, col_index - 1]
  end

  def right([row_index, col_index]) do
    [row_index, col_index + 1]
  end

  def coords_inbounds?([row_index, col_index]) do
    if row_index < 0 || col_index < 0 do
      false
    else
      true
    end
  end

  def count_and_reset_flashers(matrix) do
    flash_count =
      matrix
      |> List.flatten()
      |> Enum.count(&(&1 < 0))

    updated_matrix =
      matrix
      |> Enum.map(fn row ->
        Enum.map(row, fn num ->
          if num < 0 do
            0
          else
            num
          end
        end)
      end)

    {updated_matrix, flash_count}
  end

  def find_first_simultaneous_flash(matrix, step \\ 1) do
    {updated_matrix, flashes} = step(matrix)
    total_octopi = matrix |> List.flatten() |> length()

    if total_octopi == flashes do
      step
    else
      find_first_simultaneous_flash(updated_matrix, step + 1)
    end
  end

  def prep_input(args) do
    args
    |> String.split("\n", trim: true)
    |> Enum.map(fn row ->
      row
      |> String.split("", trim: true)
      |> Enum.map(&String.to_integer/1)
    end)
  end
end
