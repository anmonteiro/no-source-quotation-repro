(lang dune 3.10)

(name repro)

(package
 (name repro)
 (synopsis "Toolchain to produce JS from Reason/OCaml")
 (depends
  (ocaml
   (>= "5.2"))
  ppxlib))
