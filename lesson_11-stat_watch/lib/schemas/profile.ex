defmodule StatWatch.Profile do
  use Ecto.Schema

  schema "profiles" do
    field(:name, :string)
    field(:url, :string)
    field(:twitter, :string)
    field(:youtube, :string)
  end
end
