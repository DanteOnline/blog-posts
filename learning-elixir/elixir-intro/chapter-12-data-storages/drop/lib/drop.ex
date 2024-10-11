defmodule Drop do

  def calc_velocity(gravity, distance) do
    :math.sqrt(2 * gravity * distance)
  end

  def get_gravity(storage_pid, storage_name, planemo) do
    send(storage_pid, {self(), storage_name, planemo})
    receive do
      {:ok, gravity} ->
        gravity
    end
  end

  def fall_velocity(storage_pid, storage_name, planemo, distance) do
    gravity = Drop.get_gravity(storage_pid, storage_name, planemo)
    calc_velocity(gravity, distance)
  end

  def get_velocity(storage_pid, storage_name) do
    receive do
      {from, planemo, distance} ->
        send(from, {:ok, Drop.fall_velocity(storage_pid, storage_name, planemo, distance)})
    end
    get_velocity(storage_pid, storage_name)
  end

end
