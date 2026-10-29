return {
  'denisbog/cargo-registry-search',
  ft = { "rust", "toml" },
  config = function()
    require("cargo_registry_search").setup()
  end,
}
