open Ppxlib

let warn =
  let module Location = Ocaml_common.Location in
  fun ~loc ->
    Location.prerr_alert loc
      {
        Ocaml_common.Warnings.kind = "hello";
        message = "hello";
        def = Location.none;
        use = loc;
      }

let mapper =
  object (_self)
    inherit Ppxlib.Ast_traverse.map as super

    method! structure_item str =
      match str.pstr_desc with
      | Pstr_primitive { pval_loc; _ } ->
          warn ~loc:pval_loc;
          str
      | _ -> super#structure_item str
  end

let () =
  Driver.V2.register_transformation "myppx" ~impl:(fun ctxt str ->
      let input_name = Expansion_context.Base.input_name ctxt in
      Ocaml_common.Location.input_name := input_name;
      mapper#structure str)
