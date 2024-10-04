defmodule DropTest do
  use ExUnit.Case

  test "fall_velocity" do
    params = [
      {60.909769331364245, %Tower{planemo: :mars, height: 500, name: "Daga Vallis", location: "Valles Marineris"}},
      {19.79898987322333, %Tower{}}
    ]

    Enum.map(
      params, fn {result, value} -> assert result == Drop.fall_velocity(value) end
    )

  end
end
