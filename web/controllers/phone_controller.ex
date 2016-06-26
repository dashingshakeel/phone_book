defmodule Phonebook.PhoneController do

  use Phonebook.Web, :controller
  alias Phonebook.Phonebook
  def index(conn,_param)do
   phonebooks= Repo.all(Phonebook)
   render conn, "index.html", phonebooks: phonebooks

  end
  def new(conn, _param)do
    changeset=Phonebook.changeset(%Phonebook{})
    render conn, "new.html", changeset: changeset
  end
def create(conn, %{"phonebook" => params})do
  


changeset= Phonebook.changeset(%Phonebook{}, params)
case Repo.insert(changeset) do
   {:ok, phonebook}->
    conn
    |> put_flash(:info, "#{phonebook.name} created!")
    |>redirect(to: phone_path(conn, :index))
    {:error, changeset}->
      render(conn, "new.html",changeset: changeset)
end
    
end


end