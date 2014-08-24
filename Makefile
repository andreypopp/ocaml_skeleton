build: build-native
tests: tests-native

clean:
	@ocamlbuild -clean

build-native:
	@ocamlbuild -use-ocamlfind -I src/ -build-dir _build/ main.native

build-byte:
	@ocamlbuild -use-ocamlfind -I src/ -build-dir _build/ main.byte

tests-native:
	@ocamlbuild -use-ocamlfind -I src/ -build-dir _build/ -tag pkg_oUnit tests.native
	@_build/tests/tests.native

tests-byte:
	@ocamlbuild -use-ocamlfind -I src/ -build-dir _build/ -tag pkg_oUnit tests.byte
	@_build/tests/tests.byte

.PHONY: build tests clean build-native build-byte tests-native tests-byte
