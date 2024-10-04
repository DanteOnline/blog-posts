defmodule Planemo do
  defstruct name: nil, gravity: 0, diameter: 0, distance_from_sun: 0
end

defimpl Valid, for: Planemo do

  def valid?(p) do
    p.gravity >= 0 and p.diameter >= 0 and p.distance_from_sun >= 0
  end

end
