defmodule Ppush.Session do
  import Ecto.Query
  alias Ppush.User
  alias Ppush.Repo

  def create(email, password) do
    q =
      from User,
      where: [email: ^email]

    user = Repo.one(q)

    case check_password(password, user) do
      true -> {:ok, user}
      _ -> {:error, "Password or email is invalid"}
    end
  end

  defp check_password(password, user)   do
    Comeonin.Bcrypt.checkpw(password, user.crypted_password)
  end
end
