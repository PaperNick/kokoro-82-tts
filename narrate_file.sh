#!/bin/bash

SCRIPT_FULL_PATH="$(readlink -f "$0")"
VENV_PYTHON_FULL_PATH="$(dirname "$SCRIPT_FULL_PATH")/venv/bin/python"
VENV_ACTIVATE_FULL_PATH="$(dirname "$SCRIPT_FULL_PATH")/venv/bin/activate"


TEXT_FILE_TO_NARRATE="$1"
if [ ! -f "$TEXT_FILE_TO_NARRATE" ]; then
  echo 'Please specify text file to narrate as a first param'
  exit 1
fi

TEXT_CONTENT="$(cat "$TEXT_FILE_TO_NARRATE")"


is_venv_active() {
  if [ "$(which python)" = "$VENV_PYTHON_FULL_PATH" ]; then
    echo 1
  else
    echo 0
  fi
}

if [ ! -f "$VENV_PYTHON_FULL_PATH" ]; then
  echo 'Error: Could not find a virtual environment. Please initialize one first.'
  echo 'Command: python -m venv venv'
  exit 1
fi

if [ "$(is_venv_active)" = "0" ]; then
  . "$VENV_ACTIVATE_FULL_PATH"
fi


narrate() {
  python narrate.py "$TEXT_CONTENT"
}


narrate
