defmodule IOBehaviour do
  @callback gets(String.t()) :: String.t() | nil
end
