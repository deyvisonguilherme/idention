defmodule Idention do
  @moduledoc """
  Documentation for Idention.
  """

  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
    |> filter_odd_squares
  end

  def filter_odd_squares(%Idention.Image{grid: grid} = image) do
    Enum.filter(grid, fn(square) -> end)
  end

  def build_grid(%Idention.Image{hex: hex} = image) do
    grid = 
      hex
      |> Enum.chunk(3)
      |> Enum.map(&mirror_row/1)
      |> List.flatten
      |> Enum.with_index

    %Idention.Image{image | grid: grid}
  end

  def mirror_row(row) do
    [first, second | _tail] = row
    row ++ [first, second]
  end

  def pick_color(%Idention.Image{hex: [r, g, b| _tail]} = image) do
    %Idention.Image{image | color: {r,g,b}}
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Idention.Image{hex: hex}
  end
end
