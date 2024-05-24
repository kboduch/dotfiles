#!/bin/bash

# Runs after updating the target state only if the file contents have changed.

set -eufo pipefail

source ~/.kboduch/common.lib.sh

print_info "Configuring the dock"

trap 'killall Dock' EXIT

declare -a remove_labels=(
	Launchpad
	Mail
	Maps
	Photos
	FaceTime
	Contacts
	Reminders
	Notes
	Freeform
	TV
	Keynote
	Numbers
	Pages
	"App Store"
  "System Settings"
)

for label in "${remove_labels[@]}"; do
	dockutil --no-restart --remove "${label}" || true
done

dockutil --no-restart --add /Applications/Todoist.app --after Music || true
dockutil --no-restart --add /Applications/Obsidian.app --after Todoist || true
