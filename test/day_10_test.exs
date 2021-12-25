defmodule AOC.Day10Test do
  use ExUnit.Case

  import AOC.Day10

  # @tag :skip
  test "part 1 - example" do
    input = File.read!("input/10_example.txt")
    assert part_1(input) == 26397
  end

  # @tag :skip
  test "part 1" do
    input = File.read!("input/10.txt")
    assert part_1(input) == 318_099
  end

  # @tag :skip
  test "part 2 - example" do
    input = File.read!("input/10_example.txt")
    assert part_2(input) == 288_957
  end

  # @tag :skip
  test "part 2" do
    input = File.read!("input/10.txt")
    assert part_2(input) == 2_389_738_699
  end
end
