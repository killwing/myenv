#!/bin/bash

cmd="go get -u -v"
packages=(
    # dev tools
    "golang.org/x/tools/cmd/goimports"
    "golang.org/x/tools/cmd/gorename"
    "golang.org/x/tools/cmd/guru"
    "github.com/nsf/gocode"
    "github.com/rogpeppe/godef"
    "github.com/golang/lint/golint"
    "github.com/kisielk/errcheck"
    "github.com/jstemmer/gotags"
    "github.com/alecthomas/gometalinter"
    "github.com/klauspost/asmfmt/cmd/asmfmt"
    "github.com/fatih/motion"
    "github.com/zmb3/gogetdoc"
    "github.com/josharian/impl"
    # debug libraries
    "github.com/davecgh/go-spew/spew"
)

for pkg in ${packages[@]}; do
    ${cmd} "${pkg}"
done
