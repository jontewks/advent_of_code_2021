defmodule AOC.Day10 do
  @bracket_map %{
    "[" => "]",
    "(" => ")",
    "{" => "}",
    "<" => ">"
  }

  def part_1(args) do
    args
    |> prep_input()
    |> first_corrupted_brackets()
    |> calculate_corrupt_points()
  end

  def part_2(args) do
    args
    |> prep_input()
    |> incomplete_lines()
    |> complete_brackets()
    |> calculate_incomplete_points()
  end

  def first_corrupted_brackets(input) do
    input
    |> Enum.map(&String.split(&1, "", trim: true))
    |> Enum.map(&first_unmatched_bracket/1)
    |> Enum.reject(&is_nil/1)
  end

  def unmatched_bracket_or_remaining_incomplete(line) do
    Enum.reduce_while(line, [], fn bracket, acc ->
      if Map.get(@bracket_map, bracket) do
        {:cont, acc ++ [bracket]}
      else
        {last_opening_bracket, new_acc} = List.pop_at(acc, -1)

        if Map.get(@bracket_map, last_opening_bracket) == bracket do
          {:cont, new_acc}
        else
          {:halt, bracket}
        end
      end
    end)
  end

  def first_unmatched_bracket(line) do
    output = unmatched_bracket_or_remaining_incomplete(line)
    if is_list(output), do: nil, else: output
  end

  def calculate_corrupt_points(brackets) do
    points_map = %{
      ")" => 3,
      "]" => 57,
      "}" => 1197,
      ">" => 25137
    }

    brackets
    |> Enum.map(fn bracket -> Map.get(points_map, bracket) end)
    |> Enum.sum()
  end

  def incomplete_lines(input) do
    input
    |> Enum.map(&String.split(&1, "", trim: true))
    |> Enum.map(&remaining_incomplete/1)
    |> Enum.reject(&is_nil/1)
  end

  def remaining_incomplete(line) do
    output = unmatched_bracket_or_remaining_incomplete(line)
    if is_list(output), do: output, else: nil
  end

  def complete_brackets(incomplete_lines) do
    incomplete_lines
    |> Enum.map(fn line ->
      line
      |> Enum.map(&Map.get(@bracket_map, &1))
      |> Enum.reverse()
    end)
  end

  def calculate_incomplete_points(completed_lines) do
    points_map = %{
      ")" => 1,
      "]" => 2,
      "}" => 3,
      ">" => 4
    }

    scores =
      completed_lines
      |> Enum.map(fn line ->
        Enum.reduce(line, 0, fn bracket, acc ->
          acc * 5 + Map.get(points_map, bracket)
        end)
      end)
      |> Enum.sort()

    Enum.at(scores, scores |> length |> div(2))
  end

  def prep_input(args) do
    args
    |> String.split("\n", trim: true)
  end
end
