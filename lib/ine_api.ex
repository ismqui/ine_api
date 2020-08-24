defmodule IneApi do
  @moduledoc """
  Documentation for `IneApi`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> IneApi.hello()
      :world

  """
  def hello do
    :world
  end

  # Operaciones
  #
  def fetch_operaciones() do
    "https://servicios.ine.es/wstempus/js/ES/OPERACIONES_DISPONIBLES"
    |> HTTPoison.get!()
    |> Map.get(:body)
    |> Jason.decode!()
  end

  def fetch_operacion(id) do
    "https://servicios.ine.es/wstempus/js/ES/OPERACION/"<>id
    |> HTTPoison.get!()
    |> Map.get(:body)
    |> Jason.decode!()
  end

  # Variables
  #
  def fetch_variables() do
    "https://servicios.ine.es/wstempus/js/ES/VARIABLES"
    |> HTTPoison.get!()
    |> Map.get(:body)
    |> Jason.decode!()
  end

  def fetch_variables_operacion(id) do
    "https://servicios.ine.es/wstempus/js/ES/VARIABLES_OPERACION/"<>id
    |> HTTPoison.get!()
    |> Map.get(:body)
    |> Jason.decode!()
  end

  # Valores
  #
  def fetch_valores_variable(id) do
    "https://servicios.ine.es/wstempus/js/ES/VALORES_VARIABLE/"<>id
    |> HTTPoison.get!()
    |> Map.get(:body)
    |> Jason.decode!()
  end

  def fetch_valores_variable_operacion(id_variable, operacion) do
    "https://servicios.ine.es/wstempus/js/ES/VALORES_VARIABLE/"<>id_variable<>"/"<>operacion
    |> HTTPoison.get!()
    |> Map.get(:body)
    |> Jason.decode!()
  end

end
