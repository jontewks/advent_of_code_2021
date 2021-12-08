defmodule AOC.Day5Test do
  use ExUnit.Case

  import AOC.Day5

  # @tag :skip
  test "part 1 - example" do
    input = File.read!("input/5_example.txt")
    assert part_1(input) == 5
  end

  # @tag :skip
  test "part 1" do
    input = File.read!("input/5.txt")
    assert part_1(input) == 6710
  end

  # @tag :skip
  test "part 2 - example" do
    input = File.read!("input/5_example.txt")
    assert part_2(input) == 12
  end

  # @tag :skip
  test "part 2" do
    input = File.read!("input/5.txt")
    assert part_2(input) == 20121
  end
end
