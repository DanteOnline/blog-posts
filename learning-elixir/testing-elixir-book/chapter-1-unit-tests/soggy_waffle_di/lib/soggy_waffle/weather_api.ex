defmodule SoggyWaffle.WeatherAPI do
  def get_forecast(city) when is_binary(city) do
    app_id = "replace_me"
    query_params = URI.encode_query(%{"q" => city, "APPID" => app_id})
    url = "https://api.openweathermap.org/data/2.5/forecast?" <> query_params

    case HTTPoison.get(url) do
      {
        :ok,
        %HTTPoison.Response{status_code: 200, body: body, headers: _headers}
      } -> {:ok, Jason.decode!(body)}
      {
        :ok,
        %HTTPoison.Response{status_code: status_code}
      } -> {:error, {:status, status_code}}
      {
        :error,
        reason
      } -> {:error, reason}
    end
  end
end
