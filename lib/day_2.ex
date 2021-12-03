defmodule AOC.Day2 do
  def part_1(input) do
    input
    |> prep_input()
    |> Enum.reduce([0, 0], fn [dir, dist], [x, y] ->
      case dir do
        "up" -> [x - dist, y]
        "down" -> [x + dist, y]
        "forward" -> [x, y + dist]
        _ -> IO.inspect([dir, dist])
      end
    end)
    |> Enum.product()
  end

  def part_2(args) do
    args
    |> prep_input()
    |> Enum.reduce([0, 0, 0], fn [dir, dist], [x, y, z] ->
      case dir do
        "down" -> [x, y, z + dist]
        "up" -> [x, y, z - dist]
        "forward" -> [x + dist, y + z * dist, z]
      end
    end)
    |> Enum.take(2)
    |> Enum.product()
  end

  def prep_input(args) do
    args
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split/1)
    |> Enum.map(fn [dir, dist] -> [dir, String.to_integer(dist)] end)
  end
end
