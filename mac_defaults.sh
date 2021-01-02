#!/bin/bash

# Setting keyboard key repeats
# This requires restart you can override it > System Preferences, click Keyboard
e_header "Setting keyboard key repeats."
e_note "This requires restart you can override it > System Preferences, click Keyboard."
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)

# Mapping caps lock to control
# refer link https://stackoverflow.com/a/46460200
e_header "Mapping CAPS LOCK to control."
hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x7000000E0}]}'

e_header "Enabling auto hidding for Dock"
# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

e_header "Remove All Apps From The Dock"
# Remove All Apps From The Dock In OS X
defaults write com.apple.dock persistent-apps -array

killall Dock