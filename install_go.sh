#!/bin/bash

cmd="go get -u -v"
packages=(
    # dev tools
    "golang.org/x/tools/cmd/goimports"
    "golang.org/x/tools/cmd/oracle"
    "golang.org/x/tools/cmd/gorename"
    "github.com/nsf/gocode"
    "github.com/rogpeppe/godef"
    "github.com/golang/lint/golint"
    "github.com/kisielk/errcheck"
    "github.com/jstemmer/gotags"
    # system tools
    "github.com/svent/sift"
    # debug libraries
    "github.com/davecgh/go-spew/spew"
)

for pkg in ${packages[@]}; do
    ${cmd} "${pkg}"
done
