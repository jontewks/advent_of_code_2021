defmodule AOC.Day6 do
  def part_1(args) do
    args
    |> prep_input()
    |> simulate_days(80)
    |> count_fish()
  end

  def part_2(args) do
    args
    |> prep_input()
    |> simulate_days(256)
    |> count_fish()
  end

  def simulate_days(fish_map, 0), do: fish_map

  def simulate_days(fish_map, days) do
    fish_map |> simulate_day() |> simulate_days(days - 1)
  end

  def simulate_day(fish_map) do
    %{
      0 => Map.get(fish_map, 1, 0),
      1 => Map.get(fish_map, 2, 0),
      2 => Map.get(fish_map, 3, 0),
      3 => Map.get(fish_map, 4, 0),
      4 => Map.get(fish_map, 5, 0),
      5 => Map.get(fish_map, 6, 0),
      6 => Map.get(fish_map, 7, 0) + Map.get(fish_map, 0, 0),
      7 => Map.get(fish_map, 8, 0),
      8 => Map.get(fish_map, 0, 0)
    }
  end

  def count_fish(fish_map) do
    fish_map
    |> Map.values()
    |> Enum.sum()
  end

  def prep_input(args) do
    args
    |> String.split(",", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.frequencies()
  end
end
