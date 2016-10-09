defmodule Ppush.Repo.Migrations.CreateGif do
  use Ecto.Migration

  def change do
    create table(:gifs) do
      add :user_id, references(:users, on_delete: :delete_all)
      add :name, :string

      timestamps()
    end

    create index(:gifs, [:user_id])
  end
end
