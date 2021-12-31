defmodule AOC.Day12 do
  def part_1(args) do
    args
    |> prep_input()
  end

  def part_2(args) do
    args
    |> prep_input()
  end

  def prep_input(args) do
    args
    |> String.split("\n", trim: true)
  end
end
