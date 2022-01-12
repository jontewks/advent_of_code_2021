defmodule AOC.Day14 do
  def part_1(args) do
    args
    |> prep_input()
    |> add_to_polymer(10)
    |> most_minus_least()
  end

  def part_2(args) do
    args
    |> prep_input()
    |> add_to_polymer(40)
    |> most_minus_least()
  end

  def add_to_polymer({polymer, _rules}, 0) do
    polymer
  end

  def add_to_polymer({polymer, rules}, times) do
    new_polymer =
      polymer
      |> String.split("", trim: true)
      |> Enum.chunk_every(2, 1, :discard)
      |> Enum.reduce("", fn [letter_1, letter_2], acc ->
        if tweener = Map.get(rules, "#{letter_1}#{letter_2}") do
          acc <> letter_1 <> tweener
        else
          acc
        end
      end)
      |> Kernel.<>(String.at(polymer, -1))

    add_to_polymer({new_polymer, rules}, times - 1)
  end

  def most_minus_least(polymer) do
    polymer
    |> String.graphemes()
    |> Enum.frequencies()
    |> then(fn freq_map ->
      {_letter, max_count} = Enum.max_by(freq_map, fn {_letter, count} -> count end)
      {_letter, min_count} = Enum.min_by(freq_map, fn {_letter, count} -> count end)
      max_count - min_count
    end)
  end

  def prep_input(args) do
    args
    |> String.split("\n\n", trim: true)
    |> then(fn input ->
      [polymer, rules] = input

      {polymer,
       rules
       |> String.split("\n")
       |> Enum.map(&String.split(&1, " -> "))
       |> Enum.map(&List.to_tuple/1)
       |> Map.new()}
    end)
  end
end

# Updated but not really working
# defmodule AOC.Day14 do
#   def part_1(args) do
#     args
#     |> prep_input()
#     |> polymer_counts(10)
#     |> most_minus_least()
#   end

#   def part_2(args) do
#     args
#     |> prep_input()
#     |> polymer_counts(40)
#     |> most_minus_least()
#   end

#   def polymer_counts({polymer, rules}, times) do
#     polymer
#     |> String.split("", trim: true)
#     |> Enum.chunk_every(2, 1, :discard)
#     |> Enum.reduce(%{}, fn chunk, acc ->
#       chunk_as_string = Enum.join(chunk, "")
#       chunk_counts = counts_for_chunk(chunk_as_string, rules, times)
#       combine_counts(chunk_counts, acc)
#     end)
#   end

#   def counts_for_chunk(chunk, _rules, 0) do
#     letter_frequencies(chunk)
#   end

#   def counts_for_chunk(chunk, rules, times) do
#     chunk
#     |> String.split("", trim: true)
#     |> Enum.chunk_every(2, 1)
#     |> Enum.reduce("", fn chunk, acc ->
#       if length(chunk) == 1 do
#         acc <> List.first(chunk)
#       else
#         letter_1 = Enum.at(chunk, 0)
#         letter_2 = Enum.at(chunk, 1)

#         if tweener = Map.get(rules, "#{letter_1}#{letter_2}") do
#           acc <> letter_1 <> tweener
#         else
#           acc
#         end
#       end
#     end)
#     |> counts_for_chunk(rules, times - 1)
#   end

#   def combine_counts(map1, map2) do
#     Map.merge(map1, map2, fn _key, val_1, val_2 -> val_1 + val_2 end)
#   end

#   def letter_frequencies(polymer) do
#     polymer
#     |> String.graphemes()
#     |> Enum.frequencies()
#   end

#   def most_minus_least(counts) do
#     {_letter, max_count} = Enum.max_by(counts, fn {_letter, count} -> count end)
#     {_letter, min_count} = Enum.min_by(counts, fn {_letter, count} -> count end)
#     max_count - min_count
#   end

#   def prep_input(args) do
#     args
#     |> String.split("\n\n", trim: true)
#     |> then(fn input ->
#       [polymer, rules] = input

#       {polymer,
#        rules
#        |> String.split("\n")
#        |> Enum.map(&String.split(&1, " -> "))
#        |> Enum.map(&List.to_tuple/1)
#        |> Map.new()}
#     end)
#   end
# end
