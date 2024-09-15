defmodule Drop do

  defp calc_velocity(distance, gravity) when distance >= 0 do
    :math.sqrt(2 * gravity * distance)
  end

  def fall_velocity(:moon, distance) do
    calc_velocity(distance, 1.6)
  end

  def fall_velocity(:mars, distance) do
    calc_velocity(distance, 3.71)
  end

  def fall_velocity(_, distance) do
    calc_velocity(distance, 9.8)
  end
end
