defmodule AOC.Day6Test do
  use ExUnit.Case

  import AOC.Day6

  # @tag :skip
  test "part 1 - example" do
    input = File.read!("input/6_example.txt")
    assert part_1(input) == 5934
  end

  # @tag :skip
  test "part 1" do
    input = File.read!("input/6.txt")
    assert part_1(input) == 362_666
  end

  # @tag :skip
  test "part 2 - example" do
    input = File.read!("input/6_example.txt")
    assert part_2(input) == 26_984_457_539
  end

  # @tag :skip
  test "part 2" do
    input = File.read!("input/6.txt")
    assert part_2(input) == 1_640_526_601_595
  end
end
