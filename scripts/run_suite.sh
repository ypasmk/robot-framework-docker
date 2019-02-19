#!/usr/bin/env bash
set -e

CMD="robot --console verbose --outputdir /home/tester/suites/reports /home/tester/suites"

echo ${CMD}

``${CMD}``