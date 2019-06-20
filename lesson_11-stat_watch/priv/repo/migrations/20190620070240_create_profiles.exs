defmodule StatWatch.Repo.Migrations.CreateProfiles do
  use Ecto.Migration

  def change do
    create table(:profiles) do
      add(:name, :string)
      add(:twitter, :string)
      add(:url, :string)
      add(:youtube, :string)
    end

    create(unique_index(:profiles, [:name]))
  end
end
