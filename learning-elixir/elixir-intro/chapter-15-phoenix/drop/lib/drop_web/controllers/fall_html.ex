defmodule DropWeb.FallHTML do
  @moduledoc """
  This module contains pages rendered by PageController.

  See the `page_html` directory for all templates available.
  """
  use DropWeb, :html

  embed_templates "welcome_html/*"
end
