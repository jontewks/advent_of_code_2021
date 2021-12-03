defmodule AOC.Day2Test do
  use ExUnit.Case

  import AOC.Day2

  test "part 1 - example" do
    input = File.read!("input/2_example.txt")
    assert part_1(input) == 150
  end

  test "part 1" do
    input = File.read!("input/2.txt")
    assert part_1(input) == 2_036_120
  end

  test "part 2 - example" do
    input = File.read!("input/2_example.txt")
    assert part_2(input) == 900
  end

  test "part 2" do
    input = File.read!("input/2.txt")
    assert part_2(input) == 2_015_547_716
  end
end
