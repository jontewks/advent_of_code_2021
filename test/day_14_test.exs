defmodule AOC.Day14Test do
  use ExUnit.Case

  import AOC.Day14

  # @tag :skip
  test "part 1 - example" do
    input = File.read!("input/14_example.txt")
    assert part_1(input) == 1588
  end

  # @tag :skip
  test "part 1" do
    input = File.read!("input/14.txt")
    assert part_1(input) == 2375
  end

  @tag :skip
  test "part 2 - example" do
    input = File.read!("input/14_example.txt")
    assert part_2(input) == 2_188_189_693_529
  end

  @tag :skip
  test "part 2" do
    input = File.read!("input/14.txt")
    assert part_2(input) == :ok
  end
end
