defmodule SoggyWaffle.Weather do
  defstruct [:datetime, :rain?]

  def imminent_rain?(weather_data, now \\ DateTime.utc_now()) do
    Enum.any?(
      weather_data,
      fn %__MODULE__{rain?: true} = weather ->
        in_next_4_hours?(now, weather.datetime)
        _ -> false
      end
    )
  end

  defp in_next_4_hours?(now, weather_datetime) do
    four_hours_from_now = DateTime.add(now, _4_hours_in_seconds=4*60*60)
    DateTime.compare(weather_datetime, now) in [:gt, :eq] and DateTime.compare(weather_datetime, four_hours_from_now) in [:lt, :eq]
  end
end
