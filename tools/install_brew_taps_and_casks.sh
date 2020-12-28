#!/usr/bin/env bash

e_header "Installing taps.."
#fira code font
brew tap homebrew/cask-fonts
brew cask install font-fira-code

#Heroku
brew tap heroku/brew
brew install heroku

#mongo
brew tap mongodb/brew
brew install mongodb-community

applications=(
  visual-studio-code
  intellij-idea
  firefox
  brave-browser
  postman
  flycut
  docker
  notion
  evernote
  zoom
)

e_header "Installing desktop applications.. This may take little longer"
for i in ${applications[@]}; do
  brew install --cask $i
done
