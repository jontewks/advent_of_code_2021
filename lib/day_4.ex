defmodule AOC.Day4 do
  def part_1(args) do
    args
    |> prep_input()
    |> find_winner()
    |> calculate_score()
  end

  def part_2(args) do
    args
    |> prep_input()
    |> find_loser()
    |> calculate_score()
  end

  def find_winner({[number | remaining_numbers], boards}) do
    marked_boards = boards |> Enum.map(&mark_board(&1, number))
    winner = marked_boards |> Enum.find(&thats_a_bingo/1)

    if winner do
      {winner, number}
    else
      find_winner({remaining_numbers, marked_boards})
    end
  end

  def find_loser({[number | remaining_numbers], boards}) do
    marked_boards = boards |> Enum.map(&mark_board(&1, number))
    without_winners = marked_boards |> Enum.reject(&thats_a_bingo/1)

    if Enum.empty?(without_winners) do
      {List.first(marked_boards), number}
    else
      find_loser({remaining_numbers, without_winners})
    end
  end

  def mark_board(board, number) do
    board |> Enum.map(&mark_row(&1, number))
  end

  def mark_row(row, number) do
    row
    |> Enum.reduce([], fn row_item, acc ->
      case row_item == number do
        true -> acc ++ ["X"]
        false -> acc ++ [row_item]
      end
    end)
  end

  def thats_a_bingo(board) do
    row_bingo = board |> Enum.any?(fn row -> Enum.all?(row, &(&1 == "X")) end)

    column_bingo =
      board
      |> Enum.zip_with(& &1)
      |> Enum.any?(fn col -> Enum.all?(col, &(&1 == "X")) end)

    row_bingo || column_bingo
  end

  def calculate_score({board, final_number}) do
    board
    |> List.flatten()
    |> Enum.filter(&(&1 != "X"))
    |> Enum.sum()
    |> then(&(&1 * final_number))
  end

  def prep_input(args) do
    [numbers | boards] =
      args
      |> String.split("\n", trim: true)

    {
      numbers
      |> String.split(",")
      |> Enum.map(&String.to_integer/1),
      boards
      |> Enum.map(fn board ->
        board
        |> String.split()
        |> Enum.map(&String.to_integer/1)
      end)
      |> Enum.chunk_every(5)
    }
  end
end
