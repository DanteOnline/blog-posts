defmodule StorageTest do
  use ExUnit.Case, asinc: true
  require Planemo

  test "Storage" do
    name = :test_planemos
    Storage.create(name)
    assert 0 == Storage.count(name)
    new_planemo = Planemo.planemo(name: :pluto, gravity: 5, distance_from_sun: 1)
    Storage.add(name, new_planemo)
    assert 1 == Storage.count(name)

    planemo = Storage.get(:pluto, name)

    assert new_planemo == planemo

    gravity = Storage.get_gravity(:pluto, name)

    assert 5 == gravity

    pid = spawn(Storage, :get_gravity, [])
    send(pid, {self(), name, :pluto})

    receive do
      {:ok, gravity} -> assert 5 == gravity
    end

    send(pid, {self(), name, :pluto})

    receive do
      {:ok, gravity} -> assert 5 == gravity
    end

    Storage.delete(name)
    assert true
  end

  test "fill storage" do
    name = :filled_storage
    planemos = [
      Planemo.planemo(name: :pluto, gravity: 5, distance_from_sun: 1),
      Planemo.planemo()
    ]
    Storage.create(name, planemos)
    assert 2 == Storage.count(name)
    Storage.delete(name)
    assert True

  end

end
