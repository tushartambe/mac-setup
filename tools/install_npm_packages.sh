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
  npm install -g $i
done
