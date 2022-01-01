import Config

config :codepagex, :encodings, [
  # CP392 is SHIFT_JIS
  # https://en.wikipedia.org/wiki/Code_page_932_(Microsoft_Windows)
  # Make sure to `mix deps.compile codepagex --force` after changing this
  "VENDORS/MICSFT/WINDOWS/CP932"
]
