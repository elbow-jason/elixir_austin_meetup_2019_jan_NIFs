defmodule ResourceNif.Native do
  use Rustler, otp_app: :resource_nif, crate: "resourcenif_native"

  # When your NIF is loaded, it will override this function.
  def add(_a, _b), do: :erlang.nif_error(:nif_not_loaded)
  def get_the_struct(_some_string), do: :erlang.nif_error(:nif_not_loaded)
  def get_the_data_from_the_struct(_the_struct_ref), do: :erlang.nif_error(:nif_not_loaded)
end
