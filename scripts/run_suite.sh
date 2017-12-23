#!/usr/bin/env bash
set -e

CMD="robot --console verbose --outputdir /reports /suites"

echo ${CMD}

``${CMD}``