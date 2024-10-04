defmodule PlanemoTest do
  use ExUnit.Case

  test "valid" do
    params = [
      {true, %Planemo{diameter: 0, distance_from_sun: 0, gravity: 0, name: nil}},
      {false, %Planemo{name: :weirdworld, gravity: -2.3}}
    ]

    Enum.map(
      params, fn {result, value} -> assert result == Valid.valid?(value) end
    )
  end
end
