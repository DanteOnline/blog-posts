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
    # case planemo do
    #   :moon -> calc_velocity(distance, 1.6)
    #   :mars -> calc_velocity(distance, 3.71)
    #   _ -> calc_velocity(distance, 9.8)
    # end
  end

  def velocity_characteristic(planemo, distance) when distance >= 0 do
    gravity = case planemo do
      :moon -> 1.6
      :mars -> 3.71
      _ -> 9.8
    end

    velocity = sqrt(2 * gravity * distance)
    cond do
      velocity == 0 -> :stable
      velocity < 5 -> :slow
      velocity >= 5 and velocity < 10 -> :moving
      velocity >= 10 and velocity < 20 -> :fast
      velocity >= 20 -> :speedy
    end
  end
end
