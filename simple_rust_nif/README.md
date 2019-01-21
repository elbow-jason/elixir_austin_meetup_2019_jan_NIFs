# SimpleRustNif

## Specs

  - Elixir 1.7.4
  - Erlang OTP 21
  - rustc 1.32.0-nightly (14997d56a 2018-12-05)

## Steps to create the Simple project

  1) `mix new simple_rust_nif && cd simple_rust_nif`
  2) Search for `rustler` on [hex.pm](https://hex.pm/packages?_utf8=%E2%9C%93&search=rustler&sort=recent_downloads)
  3) Add `{:rustler, "~> 0.18.0"}` to `mix.exs` deps.
  4) Run `mix deps.get` to install get the deps.
  5) Run `mix rustler.new` and follow the prompts:
      
      a) For `Module name >` enter `SimpleRustNif.Native`
      
      b) For `Library name (simplerustnif_native) >` enter `simplerustnif_native` (or just press enter for the default)
  
  #### There should now be a folder `native` that is next to your elixir `lib` folder. The `native` directory is where the rust project lives.

  6) To your elixir project add a file `lib/native.ex` with the contents:

  ```elixir
  defmodule SimpleRustNif.Native do
      use Rustler, otp_app: :simple_rust_nif, crate: "simplerustnif_native"

      # When your NIF is loaded, it will override this function.
      def add(_a, _b), do: :erlang.nif_error(:nif_not_loaded)
  end
  ```
    
  7) In `mix.exs`: 
    
      a) In the `project/0` function add `compilers: [:rustler] ++ Mix.compilers` and `rustler_crates: rustler_crates()`
      

      b) Add the following function:

      ```elixir
      defp rustler_crates do
        [
          simple_rust_nif: [
            path: "native/simplerustnif_native",
            mode: if(Mix.env() == :prod, do: :release, else: :debug)
          ]
        ]
      end
      ```

  8) Run `iex -S mix`. There should be no Elixir warnings and _maybe_ one Rust warning.

  9) You should be able to enter:

  ```
  iex(1)> SimpleRustNif.Native.add(1, 2)
  {:ok, 3}
  ```