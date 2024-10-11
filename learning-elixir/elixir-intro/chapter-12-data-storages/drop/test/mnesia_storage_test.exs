defmodule MnesiaStorageTest do
  use ExUnit.Case, asinc: true
  require Planemo

  test "Storage" do
    name = :test_mnesia
    MnesiaStorage.create(name)
    assert 0 == MnesiaStorage.count(name)
    new_planemo = Planemo.planemo(name: :pluto, gravity: 5, distance_from_sun: 1)
    MnesiaStorage.add(name, new_planemo)
    assert 1 == MnesiaStorage.count(name)

    planemo = MnesiaStorage.get(:pluto, name)

    assert new_planemo == planemo

    gravity = MnesiaStorage.get_gravity(:pluto, name)

    assert 5 == gravity

    pid = spawn(MnesiaStorage, :get_gravity, [])
    send(pid, {self(), name, :pluto})

    receive do
      {:ok, gravity} -> assert 5 == gravity
    end

    send(pid, {self(), name, :pluto})

    receive do
      {:ok, gravity} -> assert 5 == gravity
    end

    MnesiaStorage.delete(name)
    assert true
  end

  test "fill storage" do
    name = :test_mnesia
    planemos = [
      Planemo.planemo(name: :pluto, gravity: 5, distance_from_sun: 1),
      Planemo.planemo()
    ]
    MnesiaStorage.create(name, planemos)
    assert 2 == Storage.count(name)
    MnesiaStorage.delete(name)
    assert True

  end

end
