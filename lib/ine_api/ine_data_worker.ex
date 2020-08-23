defmodule IneApi.IneDataWorker do
  use GenServer

  def start_link(args) do
    GenServer.start_link(__MODULE__, args, name: __MODULE__)
  end

  def init(state) do
    schedule_ine_fetch()
    {:ok, state}
  end

  def handle_info(:operaciones_fetch, state) do
    operaciones = ine_operaciones()

    # |> Enum.into([], &Map.get(&1, "Nombre"))
    operaciones
    |> Enum.each(&IO.inspect(&1))

    schedule_ine_fetch()
    {:noreply, operaciones}
  end

  defp ine_operaciones() do
    "https://servicios.ine.es/wstempus/js/ES/OPERACIONES_DISPONIBLES"
    |> HTTPoison.get!()
    |> Map.get(:body)
    |> Jason.decode!()
  end

  defp schedule_ine_fetch do
    Process.send_after(self(), :operaciones_fetch, 60_000 * 60)
  end
end
