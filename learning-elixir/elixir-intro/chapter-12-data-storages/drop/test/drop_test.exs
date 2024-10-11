defmodule DropTest do
  use ExUnit.Case

  test "get velocity" do

    name = :fall_storage

    input_data = [
      {:mercury, 3.7, 4878, 57.9},
      {:venus, 8.9, 12104, 108.2},
      {:earth, 9.8, 12756, 149.6},
      {:moon, 1.6, 3475, 149.6},
      {:mars, 3.7, 6787, 227.9},
      {:ceres, 0.27, 950, 413.7},
      {:jupiter, 23.1, 142796, 778.3},
      {:saturn, 9.0, 120660, 1427.0},
      {:uranus, 8.7, 51118, 2871.0},
      {:neptune, 11.0, 30200, 4497.1},
      {:pluto, 0.6, 2300, 5913.0},
      {:haumea, 0.44, 1150, 6484.0},
      {:makemake, 0.5, 1500, 6850.0},
      {:eris, 0.8, 2400, 10210.0}
    ]

    planemos = Enum.map(input_data, &Storage.tuple_to_planemo(&1))
    Storage.create(name, planemos)

    assert 0.8 == Storage.get_gravity(:eris, name)

    storage_pid = spawn(Storage, :get_gravity, [])

    drop_pid = spawn(Drop, :get_velocity, [storage_pid, name])

    send(drop_pid, {self(), :uranus, 50})

    receive do
      {:ok, velocity} -> assert 29.49576240750525 == velocity
    end

    send(drop_pid, {self(), :saturn, 150})

    receive do
      {:ok, velocity} -> assert 51.96152422706632 == velocity
    end

    Storage.delete(name)
    assert true

  end

end
