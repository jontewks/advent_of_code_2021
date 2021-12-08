defmodule AOC.Day7 do
  def part_1(args) do
    args
    |> prep_input()
    |> find_min_fuel()
  end

  def part_2(args) do
    args
    |> prep_input()
    |> find_min_fuel(exponential_fuel: true)
  end

  def find_min_fuel(positions, opts \\ []) do
    totals =
      for dest <- 1..Enum.max(positions) do
        get_total_to_dest(positions, dest, opts)
      end

    Enum.min(totals)
  end

  def get_total_to_dest(positions, dest, opts) do
    Enum.reduce(positions, 0, fn position, total ->
      diff =
        if Keyword.get(opts, :exponential_fuel) do
          Enum.sum(1..abs(position - dest))
        else
          abs(position - dest)
        end

      total + diff
    end)
  end

  def prep_input(args) do
    args
    |> String.split(",", trim: true)
    |> Enum.map(&String.to_integer/1)
  end
end
