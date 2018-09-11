FROM smondet/genspio-doc-dockerfiles:main406
RUN git clone https://github.com/hammerlab/genspio.git
WORKDIR ./genspio/RUN opam config exec -- ocaml please.mlt configure
RUN opam config exec -- dune build @install
RUN opam config exec -- dune build _build/default/src/test/main.exe
RUN sudo cp _build/default/src/test/main.exe /usr/bin/genspio_test
RUN opam config exec -- dune build _build/default/src/examples/downloader.exe
RUN sudo cp _build/default/src/examples/downloader.exe /usr/bin/genspio_downloader
RUN opam config exec -- dune build _build/default/src/examples/small_examples.exe
RUN sudo cp _build/default/src/examples/small_examples.exe /usr/bin/genspio_small_examples
RUN opam config exec -- dune build _build/default/src/examples/vm_tester.exe
RUN sudo cp _build/default/src/examples/vm_tester.exe /usr/bin/genspio_vm_tester
RUN opam config exec -- dune build _build/default/src/examples/service_composer.exe
RUN sudo cp _build/default/src/examples/service_composer.exe /usr/bin/genspio_service_composer
