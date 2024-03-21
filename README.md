# Repro

Reproduction of lack of source quotation in OCaml 5.2 when ppxlib driver is
used with `-ppx`:

```shell
$ dune build
$ ocamlc -ppx ./_build/install/default/bin/myppx x.ml
File "x.ml", line 1, characters 0-43:
Alert hello: hello

```


