defmodule App.ChatBot do
  use HTTPoison.Base

  @endpoint "https://api.hy-tech.my.id/api/gemini/"

  def handle_response(%{status_code: 200, body: body}) do
    {:ok, Jason.decode!(body)}
  end

  def handle_response(response) do
    {:error, response}
  end

  def ask(question) do
    case get("#{@endpoint}#{question}") do
      {:ok, response} ->
        handle_response(response)
      {:error, error} ->
        handle_response(error)
    end
  end
end
