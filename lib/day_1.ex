defmodule AOC.Day1 do
  def part_1(input) do
    input
    |> prep_input()
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.reduce(0, fn [curr, next], acc ->
      cond do
        curr < next -> acc + 1
        true -> acc
      end
    end)
  end

  def part_2(args) do
    args
    |> prep_input()
    |> Enum.chunk_every(3, 1, :discard)
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.reduce(0, fn [curr, next], acc ->
      cond do
        Enum.sum(curr) < Enum.sum(next) -> acc + 1
        true -> acc
      end
    end)
  end

  def prep_input(args) do
    args
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
  end
end
