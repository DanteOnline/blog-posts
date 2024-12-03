defmodule SoggyWaffle do
  alias SoggyWaffle.WeatherAPI

  def rain?(city, datetime, weather_fn \\ &WeatherAPI.get_forecast/1) do
    with {:ok, response} <- weather_fn.(city) do
      {:ok, weather_data} = SoggyWaffle.WeatherAPI.ResponseParser.parse_response(response)
      SoggyWaffle.Weather.imminent_rain?(weather_data, datetime)
    end
  end
end
