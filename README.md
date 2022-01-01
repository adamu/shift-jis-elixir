# SHIFT_JIS in Elixir with Codepagex

A demonstration of how to encode/decode SHIFT_JIS in Elixir with the [Codepagex](https://hex.pm/packages/codepagex) library

## Config

`SHIFT_JIS` is called `VENDORS/MICSFT/WINDOWS/CP932` in Codepagex. Enable it in [config](https://github.com/adamu/shift-jis-elixir/blob/main/config/config.exs):

```elixir
config :codepagex, :encodings, [
  # CP392 is SHIFT_JIS
  # https://en.wikipedia.org/wiki/Code_page_932_(Microsoft_Windows)
  # Make sure to `mix deps.compile codepagex --force` after changing this
  "VENDORS/MICSFT/WINDOWS/CP932"
]
```

## Encode/Decode

After that we can [encode/decode](https://github.com/adamu/shift-jis-elixir/blob/main/lib/shift_jis.ex):

```elixir
defmodule ShiftJis do
  # Check config/config.exs to see how to enable this
  @shift_jis "VENDORS/MICSFT/WINDOWS/CP932"

  @doc ~S"""
      iex> test = ShiftJis.encode("テスト")
      <<131, 101, 131, 88, 131, 103>>
      iex> ShiftJis.decode(test)
      "テスト"
  """

  def encode(str), do: Codepagex.from_string!(str, @shift_jis)
  def decode(str), do: Codepagex.to_string!(str, @shift_jis)
end
```
