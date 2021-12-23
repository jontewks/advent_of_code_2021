defmodule AOC.Day9Test do
  use ExUnit.Case

  import AOC.Day9

  # @tag :skip
  test "part 1 - example" do
    input = File.read!("input/9_example.txt")
    assert part_1(input) == 15
  end

  # @tag :skip
  test "part 1" do
    input = File.read!("input/9.txt")
    assert part_1(input) == 577
  end

  @tag :skip
  test "part 2 - example" do
    input = File.read!("input/7_example.txt")
    assert part_2(input) == 168
  end

  @tag :skip
  test "part 2" do
    input = File.read!("input/7.txt")
    assert part_2(input) == 98_039_527
  end
end
