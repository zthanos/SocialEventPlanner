ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(EventPlanner.Repo, {:shared, self()})
Mox.defmock(EventPlanner.CommandExecutorMock, for: EventPlanner.Infrastructure.CommandExecution)
