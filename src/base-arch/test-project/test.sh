#!/bin/bash
cd $(dirname "$0")

source test-utils.sh arch

# Run common tests
checkCommon

# Report result
reportResults
