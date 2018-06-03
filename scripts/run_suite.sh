#!/usr/bin/env bash
set -e

CMD="robot --console verbose -i MediumStoryApi --outputdir /reports /suites "

echo ${CMD}

``${CMD}``