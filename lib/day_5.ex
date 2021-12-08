defmodule AOC.Day5 do
  def part_1(args) do
    args
    |> prep_input()
    |> generate_map()
    |> calculate_danger()
  end

  def part_2(args) do
    args
    |> prep_input()
    |> generate_map_with_diag()
    |> calculate_danger()
  end

  def generate_map([coords | remaining_coords], map \\ %{}) do
    [[x1, y1], [x2, y2]] = coords

    updated_map =
      cond do
        x1 == x2 -> update_map_values(x1, [y1, y2], map)
        y1 == y2 -> update_map_values([x1, x2], y1, map)
        true -> map
      end

    if !Enum.empty?(remaining_coords) do
      generate_map(remaining_coords, updated_map)
    else
      updated_map
    end
  end

  def generate_map_with_diag([coords | remaining_coords], map \\ %{}) do
    [[x1, y1], [x2, y2]] = coords

    updated_map =
      cond do
        x1 == x2 ->
          update_map_values(x1, [y1, y2], map)

        y1 == y2 ->
          update_map_values([x1, x2], y1, map)

        true ->
          range = Enum.zip_with([x1..x2, y1..y2], & &1)
          update_map_values(range, map)
      end

    if !Enum.empty?(remaining_coords) do
      generate_map_with_diag(remaining_coords, updated_map)
    else
      updated_map
    end
  end

  def update_map_values(x, [y1, y2], map) do
    Enum.reduce(y1..y2, map, fn y, acc ->
      {_, updated_map} = Map.get_and_update(acc, [x, y], &update_current_value/1)
      updated_map
    end)
  end

  def update_map_values([x1, x2], y, map) do
    Enum.reduce(x1..x2, map, fn x, acc ->
      {_, updated_map} = Map.get_and_update(acc, [x, y], &update_current_value/1)
      updated_map
    end)
  end

  def update_map_values(range, map) do
    Enum.reduce(range, map, fn [x, y], acc ->
      {_, updated_map} = Map.get_and_update(acc, [x, y], &update_current_value/1)
      updated_map
    end)
  end

  def update_current_value(current_value) do
    if current_value do
      {current_value, current_value + 1}
    else
      {current_value, 1}
    end
  end

  def calculate_danger(map) do
    map |> Map.values() |> Enum.filter(&(&1 > 1)) |> length()
  end

  def prep_input(args) do
    args
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      line
      |> String.split(" -> ")
      |> Enum.map(&String.split(&1, ","))
      |> then(fn [a, b] -> [map_to_int(a), map_to_int(b)] end)
    end)
  end

  def map_to_int(list), do: Enum.map(list, &String.to_integer/1)
end
