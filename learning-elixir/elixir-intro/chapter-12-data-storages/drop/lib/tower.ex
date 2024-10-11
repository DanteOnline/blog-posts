defmodule Tower do
  require Record
  Record.defrecord :tower, [location: "", height: 20, planemo: :earth, name: ""]
end
