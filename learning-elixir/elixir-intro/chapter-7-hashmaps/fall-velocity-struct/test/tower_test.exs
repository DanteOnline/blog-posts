defmodule ToverTest do
  use ExUnit.Case

  test "valid" do
    params = [
      {false, %Tower{height: -2, location: "underground"}},
      {true, %Tower{}}
    ]

    Enum.map(
      params, fn {result, value} -> assert result == Valid.valid?(value) end
    )
  end
end
