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

  def show(conn, %{"id" => id}) do
    phone = Repo.get!(Phonebook, id)
    render(conn, "show.html", phone: phone)
  end

  def delete(conn,%{"id" => id})do
    phone =Repo.get!(Phonebook, id)
    Repo.delete!(phone)
    conn
    |> put_flash(:info, "phone number deleted")
    |> redirect(to: phone_path(conn,:index))
    end

  def edit(conn, %{"id" => id}) do
    phone = Repo.get!(Phonebook, id)
    changeset = Phonebook.changeset(phone)
    render(conn, "edit.html", phone: phone, changeset: changeset)
  end

  def update(conn, %{"id" => id, "phonebook" => params}) do
    phone = Repo.get!(Phonebook, id)
    changeset = Phonebook.changeset(phone, params)

    case Repo.update(changeset) do
      {:ok, phone} ->
        conn
        |> put_flash(:info, "Number updated successfully.")
        |> redirect(to: phone_path(conn, :index, phone))
      {:error, changeset} ->
        render(conn, "show.html", phone: phone, changeset: changeset)
    end
  end

end
