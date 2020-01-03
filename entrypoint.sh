#! /usr/bin/env bash

set -eo pipefail
set -x

ACTION_STATE_NAME="${ACTION_STATE_NAME:-data.csv}"

set -u

cd "${GITHUB_WORKSPACE}"

ACTION_STATE_PATH="${GITHUB_WORKSPACE}/${ACTION_STATE_NAME}"

if [ ! -f "${ACTION_STATE_PATH}" -a ! -d "${ACTION_STATE_PATH}" ]; then
  >&2 echo "==> Can't find '${ACTION_STATE_PATH}'.
    Please ensure to set up ACTION_STATE_NAME env var
    relative to the root of your project."
  exit 1
fi

>&2 echo
>&2 echo "==> Linting ${ACTION_STATE_PATH}…"

if [ -d "${ACTION_STATE_PATH}" ]; then
  /usr/local/sbin/csvlint  `find "${ACTION_STATE_PATH}" -type f -name data.csv`
else
  /usr/local/sbin/csvlint  "${ACTION_STATE_PATH}"
fi

>&2 echo