ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Phonebook.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Phonebook.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Phonebook.Repo)

