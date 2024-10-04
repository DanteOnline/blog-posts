defmodule PascalTest do
  use ExUnit.Case

  test "add_row" do
    params = [
      {[0, 1, 1, 0], [0, 1, 0]},
      {[0, 1, 2, 1, 0], [0, 1, 1, 0]},
      {[0, 1, 3, 3, 1, 0], [0, 1, 2, 1, 0]}
    ]

    Enum.map(
      params,
      fn {result, value} -> assert result == Pascal.add_row(value) end
    )

  end

  test "triangle" do

    params = [
      {[[0, 1, 0], [0, 1, 1, 0], [0, 1, 2, 1, 0], [0, 1, 3, 3, 1, 0]], 4},
      {[[0, 1, 0], [0, 1, 1, 0], [0, 1, 2, 1, 0], [0, 1, 3, 3, 1, 0],
      [0, 1, 4, 6, 4, 1, 0], [0, 1, 5, 10, 10, 5, 1, 0]], 6}
    ]

    Enum.map(
      params,
      fn {result, value} -> assert result == Pascal.triangle(value) end
    )

  end

end
