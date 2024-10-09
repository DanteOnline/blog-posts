defmodule Drop do

  def drop do
    receive do
      {from, planemo, distance} ->
        send(from, {planemo, distance, fall_velocity(planemo, distance)})
    end
    drop()
  end

  defp calc_velocity(distance, gravity) when distance >= 0 do
    :math.sqrt(2 * gravity * distance)
  end

  defp get_gravity(:moon) do
    1.6
  end

  defp get_gravity(:mars) do
    3.71
  end

  defp get_gravity(_) do
    9.8
  end

  defp fall_velocity(planemo, distance) do
    planemo
    |> get_gravity()
    |> calc_velocity(distance)
  end

end
