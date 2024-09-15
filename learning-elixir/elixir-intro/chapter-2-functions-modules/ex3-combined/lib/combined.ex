defmodule Combined do
  def height_to_mph(meters, gravity \\ 9.8) do
    Convert.mps_to_mph(Drop.fall_velocity(meters, gravity))
  end

  def height_to_mph_pipe(meters) do
    meters
    |> Drop.fall_velocity
    |> Convert.mps_to_mph
  end
end

defmodule CombinedImport do
  import Convert

  def height_to_mph_pipe(meters) do
    meters
    |> Drop.fall_velocity
    |> mps_to_mph
  end
end
