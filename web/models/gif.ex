defmodule Ppush.Gif do
  use Ppush.Web, :model
  use Arc.Ecto.Schema

  schema "gifs" do
    belongs_to :user, Ppush.User
    field :name, Ppush.GifUploader.Type

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
