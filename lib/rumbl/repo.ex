defmodule Rumbl.Repo do
  @moduledoc """
  In memory repository.
  """
  def all(Rumbl.User) do
    [%Rumbl.User{id: "1", name: "José Valim", username: "josevalim", password: "elixir"},
    %Rumbl.User{id: "2", name: "Bruce Something", username: "redrapids", password: "7langs"},
     %Rumbl.User{id: "3", name: "Chris McCord", username: "chrismccord", password: "phx"}]
  end

  def all(_module), do: []

  def get(module, id) do
    Enum.find all(module), fn map -> map.id == id end
  end
  def get_by(module, params) do Enum.find all(module), fn map ->
    Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end) end
  end
end
