#!/usr/bin/env bash

e_header "Installing taps.."

e_header "Installing fira code font."
#fira code font
brew tap homebrew/cask-fonts
brew install --cask font-fira-code

e_header "Installing heroku cli."
#Heroku
brew tap heroku/brew
brew install heroku

e_header "Installing mongodb."
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
  slack
  notion
  evernote
  zoom
  docker
  android-studio
)

e_header "Installing desktop applications.. This may take little longer"
for i in ${applications[@]}; do
  e_header "Installing : $i"
  brew install --cask $i
done

e_success "Installed all apps sucessfully.."