defmodule AOC.Day6 do
  def part_1(args) do
    args
    |> prep_input()
    |> initial_fish_count_map()
    |> simulate_days(80)
    |> count_fish()
  end

  def part_2(args) do
    args
    |> prep_input()
    |> initial_fish_count_map()
    |> simulate_days(256)
    |> count_fish()
  end

  def initial_fish_count_map(starting_fish) do
    fish_counts = %{
      0 => 0,
      1 => 0,
      2 => 0,
      3 => 0,
      4 => 0,
      5 => 0,
      6 => 0,
      7 => 0,
      8 => 0,
      "prev" => 0
    }

    Enum.reduce(starting_fish, fish_counts, fn x, acc ->
      {_, updated_fish_counts} =
        Map.get_and_update(acc, x, fn current_value ->
          if current_value > 0 do
            {current_value, current_value + 1}
          else
            {current_value, 1}
          end
        end)

      updated_fish_counts
    end)
  end

  def simulate_days(fish_map, days) do
    if days == 0 do
      fish_map
    else
      fish_map |> simulate_day() |> simulate_days(days - 1)
    end
  end

  def simulate_day(fish_map) do
    Enum.reduce(8..0, fish_map, fn x, acc ->
      case x do
        8 ->
          %{acc | "prev" => acc[8], 8 => 0}

        0 ->
          %{acc | 8 => acc[0], 6 => acc[6] + acc[0], 0 => acc["prev"]}

        _ ->
          new_val = acc["prev"]
          %{acc | "prev" => acc[x], x => new_val}
      end
    end)
  end

  def count_fish(fish_map) do
    fish_map
    |> Map.delete("prev")
    |> Map.values()
    |> Enum.sum()
  end

  def prep_input(args) do
    args
    |> String.split(",", trim: true)
    |> Enum.map(&String.to_integer/1)
  end
end
