defmodule Msg91 do
  @moduledoc """
  MSG91 API library for Elixir
  """

  @base_url "https://control.msg91.com/api/sendhttp.php"

  @api_key :msg91 |> Application.fetch_env!(__MODULE__) |> Keyword.get(:authkey)
  @sender :msg91 |> Application.fetch_env!(__MODULE__) |> Keyword.get(:sender)
  @route :msg91 |> Application.fetch_env!(__MODULE__) |> Keyword.get(:route)
  @country :msg91 |> Application.fetch_env!(__MODULE__) |> Keyword.get(:country_code)

  def format_request(phone, message) do
    %{
      authkey: @api_key,
      mobiles: phone,
      message: message,
      sender: @sender,
      route: @route,
      country: @country
    }
  end

  defp parse_response({:ok, %HTTPoison.Response{body: body, status_code: status}}) do
    {:ok, body}
  end

  defp parse_response({:ok, %HTTPoison.Error{reason: reason}}) do
    {:error, reason}
  end

  @doc """
  Sends message as SMS to phone number.

  Returns `{:ok, result}` on success, else `{:error, reason}`

  ## Examples

        iex(1)> Msg91.send("7995738307", "Hello from elixir")
          {:ok, "376a68754169303039353533"}
          
  """
  def send(phone, message) do
    @base_url
    |> HTTPoison.get([], [params: format_request(phone, message)])
    |> parse_response()
  end
end
