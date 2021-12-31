defmodule AOC.Day12Test do
  use ExUnit.Case

  import AOC.Day12

  @tag :skip
  test "part 1 - example" do
    input = File.read!("input/12_example.txt")
    assert part_1(input) == 1656
  end

  @tag :skip
  test "part 1" do
    input = File.read!("input/12.txt")
    assert part_1(input) == 1632
  end

  @tag :skip
  test "part 2 - example" do
    input = File.read!("input/12_example.txt")
    assert part_2(input) == 195
  end

  @tag :skip
  test "part 2" do
    input = File.read!("input/12.txt")
    assert part_2(input) == 303
  end
end
