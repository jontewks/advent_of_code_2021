defmodule AOC.Day8Test do
  use ExUnit.Case

  import AOC.Day8

  # @tag :skip
  test "part 1 - example" do
    input = File.read!("input/8_example.txt")
    assert part_1(input) == 26
  end

  # @tag :skip
  test "part 1" do
    input = File.read!("input/8.txt")
    assert part_1(input) == 278
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
