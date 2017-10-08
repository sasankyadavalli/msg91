# Msg91

**MSG91 API library for Elixir**

## Installation

The package can be installed by adding `msg91` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:msg91, "~> 0.1.0"}
  ]
end
```
Docs can be found at [https://hexdocs.pm/msg91/0.1.0](https://hexdocs.pm/msg91/0.1.0).

## Configuration

```elixir
config :msg91, Msg91,
  authkey: "MSG91_APIKEY",
  sender: "SENDER_NAME",
  route: 4,
  country_code: 91
```

