FROM ocaml/opam2:ubuntu-lts
RUN sudo apt-get update -y
RUN sudo apt-get install -y pandoc wget zsh mksh busybox posh ksh
RUN opam repository add --rank 1 --set-default mothership https://github.com/ocaml/opam-repository.git
RUN opam config exec -- opam update --yes
RUN opam config exec -- opam switch 4.05
RUN opam config exec -- opam install --yes depext
RUN opam config exec -- opam pin add -n febusy 'https://gitlab.com/smondet/febusy.git'
RUN opam config exec -- opam pin add -n caml2html 'https://github.com/smondet/caml2html.git#fix-build-407-issue-5'
RUN opam config exec -- opam depext -y -i rresult nonstd sosa uri febusy cmdliner merlin caml2html base
