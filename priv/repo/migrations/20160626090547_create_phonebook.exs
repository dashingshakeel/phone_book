defmodule Phonebook.Repo.Migrations.CreatePhonebook do
  use Ecto.Migration

  def change do
    create table(:phonebooks) do
      add :name, :string
      add :number, :integer

      timestamps
    end

  end
end
