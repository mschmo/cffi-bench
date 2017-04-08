#!/usr/bin/env bash

command -v virtualenv >/dev/null 2>&1 || {
    echo "Virtualenv is required so that we don't mess up";
    echo "your system python install.";
    echo "See http://python-guide-pt-br.readthedocs.io/en/latest/dev/virtualenvs/";
    exit 1;
}
virtualenv env
env/bin/pip install -r src/requirements.txt

command -v cargo >/dev/null 2>&1 || {
    echo "Error: Cargo required for cffi-bench.";
    echo "Get cargo by installing the current stable release of rust.";
    echo "See http://doc.crates.io/ for more info.";
    exit 1;
}
for SCRIPT in cffi pure; do
  echo "Building rust ${SCRIPT} package"
  (cd src/rust/${SCRIPT} && cargo build --release)
done
