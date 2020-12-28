#!/bin/bash

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Remove All Apps From The Dock In OS X
defaults write com.apple.dock persistent-apps -array

killall Dock