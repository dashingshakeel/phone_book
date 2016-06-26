defmodule Phonebook.PhoneView do
use Phonebook.Web, :view
alias Phonebook.Phonebook
def first_name(%Phonebook{name: name}) do
name
|> String.split(" ")
|> Enum.at(0)
end
end