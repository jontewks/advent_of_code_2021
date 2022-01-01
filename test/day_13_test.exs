defmodule AOC.Day13Test do
  use ExUnit.Case

  import AOC.Day13

  # @tag :skip
  test "part 1 - example" do
    input = File.read!("input/13_example.txt")
    assert part_1(input) == 17
  end

  # @tag :skip
  test "part 1" do
    input = File.read!("input/13.txt")
    assert part_1(input) == 610
  end

  @tag :skip
  test "part 2" do
    input = File.read!("input/13.txt")
    assert part_2(input) == :ok
  end
end
