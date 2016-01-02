defmodule RethinkExample.Post do
  use RethinkExample.Web, :model

  schema "posts" do
    field :title, :string
    field :content, :string
    field :user, :string

    timestamps
  end

  @required_fields ~w(title content user)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_length(:title, max: 10)
  end
end
