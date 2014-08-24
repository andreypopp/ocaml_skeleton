build: build-native
tests: tests-native

clean:
	@rm -rf _build/

build-native:
	@ocamlbuild -I src/ -build-dir _build/ main.native

build-byte:
	@ocamlbuild -I src/ -build-dir _build/ main.byte

tests-native:
	@ocamlbuild -I src/ -build-dir _build/ -tag pkg_oUnit tests.native
	@_build/tests/tests.native

tests-byte:
	@ocamlbuild -I src/ -build-dir _build/ -tag pkg_oUnit tests.byte
	@_build/tests/tests.byte

.PHONY: build tests clean build-native build-byte tests-native tests-byte
