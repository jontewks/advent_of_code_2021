defmodule AOC.Day4Test do
  use ExUnit.Case

  import AOC.Day4

  test "part 1 - example" do
    input = File.read!("input/4_example.txt")
    assert part_1(input) == 4512
  end

  test "part 1" do
    input = File.read!("input/4.txt")
    assert part_1(input) == 32844
  end

  test "part 2 - example" do
    input = File.read!("input/4_example.txt")
    assert part_2(input) == 1924
  end

  test "part 2" do
    input = File.read!("input/4.txt")
    assert part_2(input) == 4920
  end
end
