#!/usr/bin/env bash

e_header "Installing taps.."
#fira code font
brew tap homebrew/cask-fonts
brew install --cask font-fira-code

#Heroku
brew tap heroku/brew
brew install heroku

#mongo
brew tap mongodb/brew
brew install mongodb-community

applications=(
  visual-studio-code
  intellij-idea
  iterm2
  firefox
  brave-browser
  postman
  flycut
  notion
  evernote
  zoom
  docker
)

e_header "Installing desktop applications.. This may take little longer"
for i in ${applications[@]}; do
  brew install --cask $i
done
