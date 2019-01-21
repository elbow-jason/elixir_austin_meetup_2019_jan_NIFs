defmodule SimpleRustNif.Native do
  use Rustler, otp_app: :simple_rust_nif, crate: "simplerustnif_native"

  # When your NIF is loaded, it will override this function.
  def add(_a, _b), do: :erlang.nif_error(:nif_not_loaded)
end
