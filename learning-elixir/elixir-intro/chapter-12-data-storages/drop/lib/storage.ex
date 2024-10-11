defmodule Storage do
  require Planemo

  def create(name \\ :planemos, planemos \\ []) do
    planemo_table = :ets.new(name, [:named_table, {:keypos, Planemo.planemo(:name) + 1}])
    Enum.map(planemos, &Storage.add(name, &1))
  end

  def add(name \\ :planemos, planemo) do
    :ets.insert(name, planemo)
  end

  def delete(name \\ :planemos) do
    :ets.delete(name)
  end

  def count(name \\ :planemos) do
    info = :ets.info(name, :size)
  end

  def get(planemo_name, name \\ :planemos) do
    [record] = :ets.lookup(name, planemo_name)
    record
  end

  def get_gravity(planemo_name, name \\ :planemos) do
    planemo = Storage.get(planemo_name, name)
    Planemo.planemo(planemo, :gravity)
  end

  def get_gravity() do
    receive do
      {from, name, planemo_name} -> send(
        from, {:ok, Storage.get_gravity(planemo_name, name)}
      )
    end
    get_gravity()
  end

  def tuple_to_planemo({name, gravity, diameter, distance}) do
    Planemo.planemo(name: name, gravity: gravity, diameter: diameter, distance_from_sun: distance)
  end

end
