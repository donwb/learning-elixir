defmodule PgTest.App do
    use Application

    def start(_type, _args) do
        import Supervisor.Spec
        tree = [supervisor(PgTest.Repo, [])]
        opts = [name: PgTest.Sup, strategy: :one_for_one]
        Supervisor.start_link(tree, opts)
        
    end
end

defmodule PgTest.Repo do
    use Ecto.Repo, otp_app: :pg_test
end


defmodule Employee do
    use Ecto.Schema
    schema "employee" do
        field :name, :string
        field :dept, :string
        field :jobtitle, :string
    end

end
