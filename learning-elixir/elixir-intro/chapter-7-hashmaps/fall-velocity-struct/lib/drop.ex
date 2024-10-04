defmodule Drop do

  def fall_velocity(%Tower{planemo: planemo, height: height}) do
    fall_velocity(planemo, height)
  end

  defp calc_velocity(gravity, distance) when distance >= 0 do
    :math.sqrt(2 * gravity * distance)
  end

  def fall_velocity(:moon, distance) do
    calc_velocity(1.6, distance)
  end

  def fall_velocity(:mars, distance) do
    calc_velocity(3.71, distance)
  end

  def fall_velocity(_, distance) do
    calc_velocity(9.8, distance)
  end


end
