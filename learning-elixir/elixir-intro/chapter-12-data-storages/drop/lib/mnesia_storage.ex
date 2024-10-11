defmodule MnesiaStorage do
  require Planemo

  def create(name \\ :planemos, planemos \\ []) do
    :mnesia.start()
    :mnesia.create_table(name, [{:attributes,
    [:name, :gravity, :diameter, :distance_from_sun]},
    {:record_name, :planemo}])
    Enum.map(planemos, &MnesiaStorage.add(name, &1))
  end

  def add(name \\ :planemos, planemo) do
    f = fn ->
      :mnesia.write(name, planemo, :write)
    end
    :mnesia.transaction(f)
  end

  def delete(name \\ :planemos) do
    # :ets.delete(name)
    :mnesia.delete_table(name)
    :mnesia.stop()
  end

  def count(name \\ :planemos) do
    :ets.info(name, :size)
  end

  def get(planemo_name, name \\ :planemos) do
    #[record] = :ets.lookup(name, planemo_name)
    #record
    {:atomic, [record]} = :mnesia.transaction(fn()->:mnesia.read(name, planemo_name) end)
    record
  end

  def get_gravity(planemo_name, name \\ :planemos) do
    planemo = MnesiaStorage.get(planemo_name, name)
    Planemo.planemo(planemo, :gravity)
  end

  def get_gravity() do
    receive do
      {from, name, planemo_name} -> send(
        from, {:ok, MnesiaStorage.get_gravity(planemo_name, name)}
      )
    end
    get_gravity()
  end

  def tuple_to_planemo({name, gravity, diameter, distance}) do
    Planemo.planemo(name: name, gravity: gravity, diameter: diameter, distance_from_sun: distance)
  end

end
