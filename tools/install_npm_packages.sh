#!/usr/bin/env bash

packages=(
  nyc
  readline-sync
  mocha
  prettier
  chalk
  lite-server
)

e_header "Installing npm packages.."
for i in ${packages[@]}; do
  e_header "Installing : $i."
  npm install -g $i
done

e_success "Installed npm global packages sucessfully.."