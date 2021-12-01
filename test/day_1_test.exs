defmodule AOC.Day1Test do
  use ExUnit.Case

  import AOC.Day1

  test "part 1 - example" do
    input = File.read!("input/1_example.txt")
    assert part_1(input) == 7
  end

  test "part 1" do
    input = File.read!("input/1.txt")
    assert part_1(input) == 1676
  end

  test "part 2 - example" do
    input = File.read!("input/1_example.txt")
    assert part_2(input) == 5
  end

  test "part 2" do
    input = File.read!("input/1.txt")
    assert part_2(input) == 1706
  end
end
