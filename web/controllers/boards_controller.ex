defmodule Cosmic.BoardsController do
  use Cosmic.Web, :controller

  def index(conn, _params) do
    players = [
      %{
        name: "Ramon",
        cards: 2,
        color: :blue,
        race: "Ameba",
        planets: [
          %{
            ships: %{
              blue: 0,
              red: 2
            }
          },
          %{
            ships: %{
              blue: 2,
            }
          },
          %{
            ships: %{
              blue: 2,
            }
          },
          %{
            ships: %{
              blue: 2,
            }
          },
          %{
            ships: %{
              blue: 2,
            }
          },
        ]
      },
      %{
        name: "Ruan",
        cards: 2,
        color: :red,
        race: "Clone",
        planets: [
          %{
            ships: %{
              red: 2
            }
          },
          %{
            ships: %{
              red: 2,
              blue: 2,
              green: 2,
            }
          },
          %{
            ships: %{
              red: 2,
            }
          },
          %{
            ships: %{
              red: 2,
            }
          },
          %{
            ships: %{
              red: 2,
            }
          },
        ]
      },
      %{
        name: "Vitor",
        cards: 2,
        color: :green,
        race: "Mirror",
        planets: [
          %{
            ships: %{
              green: 2
            }
          },
          %{
            ships: %{
              green: 2,
              blue: 2,
              red: 2,
            }
          },
          %{
            ships: %{
              green: 2,
            }
          },
          %{
            ships: %{
              green: 2,
            }
          },
          %{
            ships: %{
              green: 2,
            }
          },
        ]
      }
    ]

    render conn, "index.html", players: players
  end
end
