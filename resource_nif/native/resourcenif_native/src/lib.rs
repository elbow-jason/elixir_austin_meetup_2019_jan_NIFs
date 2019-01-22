#[macro_use] extern crate rustler;
#[macro_use] extern crate rustler_codegen;
#[macro_use] extern crate lazy_static;

use rustler::{Env, Term, NifResult, Encoder};
use rustler::resource::{ResourceArc};

#[derive(Debug)]
struct TheStruct {
    field: String
}

fn on_load<'a>(env: Env<'a>, _load_info: Term<'a>) -> bool {
	resource_struct_init!(TheStruct, env);
	true
}

mod atoms {
    rustler_atoms! {
        atom ok;
        //atom error;
        //atom __true__ = "true";
        //atom __false__ = "false";
    }
}

rustler_export_nifs! {
    "Elixir.ResourceNif.Native",
    [
        ("add", 2, add),
        ("get_the_struct", 1, get_the_struct),
        ("get_the_data_from_the_struct", 1, get_the_data_from_the_struct),
    ],
    Some(on_load)
}

fn add<'a>(env: Env<'a>, args: &[Term<'a>]) -> NifResult<Term<'a>> {
    let num1: i64 = try!(args[0].decode());
    let num2: i64 = try!(args[1].decode());

    Ok((atoms::ok(), num1 + num2).encode(env))
}

fn get_the_struct<'a>(env: Env<'a>, args: &[Term<'a>]) -> NifResult<Term<'a>> {
    let data: &str = try!(args[0].decode());
    let the_struct = TheStruct{
        field: String::from(data)
    };
    let resource: ResourceArc<TheStruct> = ResourceArc::new(the_struct);
    Ok((atoms::ok(), resource).encode(env))
}

fn get_the_data_from_the_struct<'a>(env: Env<'a>, args: &[Term<'a>]) -> NifResult<Term<'a>> {
    let the_struct: ResourceArc<TheStruct> = args[0].decode()?;
    Ok((atoms::ok(), the_struct.field.clone()).encode(env))
}
