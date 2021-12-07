defmodule AOC.Day4Test do
  use ExUnit.Case

  import AOC.Day4

  test "part 1 - example" do
    input = File.read!("input/4_example.txt")
    assert part_1(input) == 198
  end

  @tag :skip
  test "part 1" do
    input = File.read!("input/3.txt")
    assert part_1(input) == 3_985_686
  end

  @tag :skip
  test "part 2 - example" do
    input = File.read!("input/3_example.txt")
    assert part_2(input) == 230
  end

  @tag :skip
  test "part 2" do
    input = File.read!("input/2.txt")
    assert part_2(input) == 2_015_547_716
  end
end
