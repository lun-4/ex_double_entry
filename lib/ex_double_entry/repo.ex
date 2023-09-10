defmodule ExDoubleEntry.Repo do
  @db Application.fetch_env!(:ex_double_entry, :db)

  @db_adapter (case @db do
                 :postgres -> Ecto.Adapters.Postgres
                 :mysql -> Ecto.Adapters.MyXQL
                 nil -> Application.fetch_env!(:ex_double_entry, :db_adapter)
               end)

  use Ecto.Repo,
    otp_app: :ex_double_entry,
    adapter: @db_adapter
end
