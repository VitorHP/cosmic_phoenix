defmodule Cosmic.RacesView do
  use Cosmic.Web, :view

  def phase_list(race) do
    ["Início do Turno",
    "Reagrupar",
    "Destino",
    "Lançamento",
    "Aliança",
    "Planejamento",
    "Revelar",
    "Resolução"]
    |> Enum.map(fn(phase) -> %{name: phase, selected: Enum.member?(List.wrap(race["phase"]), phase) } end)
  end

  def active_class(is_active) do
    if ( is_active ), do: "phase-list-item phase-list-item--active", else: "phase-list-item"
  end
end
