defmodule Phonebook.PhonebookTest do
  use Phonebook.ModelCase

  alias Phonebook.Phonebook

  @valid_attrs %{name: "some content", number: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Phonebook.changeset(%Phonebook{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Phonebook.changeset(%Phonebook{}, @invalid_attrs)
    refute changeset.valid?
  end
end
