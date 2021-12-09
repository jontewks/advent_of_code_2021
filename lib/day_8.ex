defmodule AOC.Day8 do
  def part_1(args) do
    args
    |> prep_input()
    |> get_outputs()
    |> count_easy_lengths()
  end

  def part_2(args) do
    args
    |> prep_input()
  end

  def get_outputs(input) do
    input
    |> Enum.map(fn line ->
      line |> String.split(" | ") |> Enum.at(1)
    end)
  end

  def count_easy_lengths(outputs) do
    outputs
    |> Enum.map(&String.split/1)
    |> List.flatten()
    |> Enum.map(&String.length/1)
    |> Enum.filter(&Enum.member?([2, 3, 4, 7], &1))
    |> length()
  end

  def prep_input(args) do
    args
    |> String.split("\n", trim: true)
  end
end
