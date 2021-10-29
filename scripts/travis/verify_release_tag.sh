#!/usr/bin/env bash
echo "=========================== Starting Verify Release Tag Script ==========================="
PS4="\[\e[35m\]+ \[\e[m\]"
set -vex
pushd "$(dirname "${BASH_SOURCE[0]}")/../../"

if [ -z "${RELEASE_VERSION}" ]; then
  echo "Please provide a RELEASE_VERSION (e.g 6.2)"
  exit 1
fi

if git rev-parse "${RELEASE_VERSION}^{tag}" &>/dev/null ; then
  echo "The RELEASE_VERSION tag \"${RELEASE_VERSION}\" already exists in the git project"
  exit 1
fi

popd
set +vex
echo "=========================== Finishing Verify Release Tag Script =========================="
