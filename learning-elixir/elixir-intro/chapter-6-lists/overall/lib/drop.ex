defmodule Drop do
  import :math, only: [sqrt: 1]

  defp get_gravity(:moon) do
    1.6
  end

  defp get_gravity(:mars) do
    3.71
  end

  defp get_gravity(_) do
    9.8
  end

  defp calc_velocity(distance, gravity) do
    sqrt(2 * gravity * distance)
  end

  def fall_velocity(planemo, distance) when distance >= 0 do
    gravity = get_gravity(planemo)
    calc_velocity(gravity, distance)
  end

end
