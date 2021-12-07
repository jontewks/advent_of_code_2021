defmodule AOC.Day3 do
  def part_1(args) do
    prepped_input = prep_input(args)
    input_length = prepped_input |> length()

    gamma_rate =
      prepped_input
      |> bit_sums()
      |> Enum.map(fn total ->
        if total >= input_length / 2 do
          1
        else
          0
        end
      end)

    binary_as_list_to_decimal(gamma_rate) *
      (gamma_rate
       |> epsilon_rate_from_gamma()
       |> binary_as_list_to_decimal())
  end

  def part_2(args) do
    prepped_input = prep_input(args)
    input_length = prepped_input |> length()
  end

  def prep_input(args) do
    args
    |> String.split("\n", trim: true)
    |> Enum.map(fn bit_string ->
      bit_string
      |> String.split("", trim: true)
      |> Enum.map(&String.to_integer/1)
    end)
  end

  def bit_sums(list) do
    list
    |> Enum.zip()
    |> Enum.map(fn zipped ->
      zipped
      |> Tuple.to_list()
      |> Enum.sum()
    end)
  end

  def epsilon_rate_from_gamma(gamma_rate) do
    Enum.map(gamma_rate, fn x ->
      case x do
        1 -> 0
        0 -> 1
      end
    end)
  end

  def binary_as_list_to_decimal(list) do
    list
    |> Enum.join()
    |> Integer.parse(2)
    |> elem(0)
  end
end
