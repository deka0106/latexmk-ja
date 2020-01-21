#!/bin/bash
set -eu

cp /tmp/.latexmkrc $HOME/
exec "$@"