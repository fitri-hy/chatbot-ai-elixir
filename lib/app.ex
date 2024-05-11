defmodule App do
  def start do
    loop()
  end

  defp loop do
    IO.puts "Coba Tanya Disini:"
    question = IO.gets("")

    case App.ChatBot.ask(question) do
      {:ok, body} ->
        IO.puts "Jawaban: #{body["text"]}"
      {:error, _error} ->
        IO.puts "Terjadi kesalahan saat mengirim permintaan."
    end

    loop()
  end
end
