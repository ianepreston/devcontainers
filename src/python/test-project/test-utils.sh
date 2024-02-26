#!/bin/bash
SCRIPT_FOLDER="$(cd "$(dirname $0)" && pwd)"
USERNAME=${1:-arch}

if [ -z $HOME ]; then
    HOME="/root"
fi

FAILED=()

echoStderr()
{
    echo "$@" 1>&2
}

check() {
    LABEL=$1
    shift
    echo -e "\n🧪 Testing $LABEL"
    if "$@"; then 
        echo "✅  Passed!"
        return 0
    else
        echoStderr "❌ $LABEL check failed."
        FAILED+=("$LABEL")
        return 1
    fi
}

checkMultiple() {
    PASSED=0
    LABEL="$1"
    echo -e "\n🧪 Testing $LABEL."
    shift; MINIMUMPASSED=$1
    shift; EXPRESSION="$1"
    while [ "$EXPRESSION" != "" ]; do
        if $EXPRESSION; then ((PASSED++)); fi
        shift; EXPRESSION=$1
    done
    if [ $PASSED -ge $MINIMUMPASSED ]; then
        echo "✅ Passed!"
        return 0
    else
        echoStderr "❌ $LABEL check failed."
        FAILED+=("$LABEL")
        return 1
    fi
}

checkOSPackages() {
    LABEL=$1
    shift
    echo -e "\n🧪 Testing $LABEL"
    if pacman -Qq "$@"; then 
        echo "✅  Passed!"
        return 0
    else
        echoStderr "❌ $LABEL check failed."
        FAILED+=("$LABEL")
        return 1
    fi
}


checkCommon()
{
    PACKAGE_LIST="\
        git \
        openssh \
        less \
        iproute2 \
        procps \
        neofetch \
        ripgrep \
        fd \
        lazygit \
        curl \
        wget \
        unzip \
        jq \
        sudo \
        python312 \
        python-pipx \
        python-poetry"

    # Actual tests
    checkOSPackages "common-os-packages" ${PACKAGE_LIST}
    check "non-root-user" id ${USERNAME}
    check "locale" [ $(locale -a | grep en_US.utf8) ]
    check "sudo" sudo echo "sudo works."
    check "login-shell-path" [ -f "/etc/profile.d/00-restore-env.sh" ]
}

reportResults() {
    if [ ${#FAILED[@]} -ne 0 ]; then
        echoStderr -e "\n💥  Failed tests: ${FAILED[@]}"
        exit 1
    else 
        echo -e "\n💯  All passed!"
        exit 0
    fi
}

fixTestProjectFolderPrivs() {
    if [ "${USERNAME}" != "root" ]; then
        TEST_PROJECT_FOLDER="${1:-$SCRIPT_FOLDER}"
        FOLDER_USER="$(stat -c '%U' "${TEST_PROJECT_FOLDER}")"
        if [ "${FOLDER_USER}" != "${USERNAME}" ]; then
            echoStderr "WARNING: Test project folder is owned by ${FOLDER_USER}. Updating to ${USERNAME}."
            sudo chown -R ${USERNAME} "${TEST_PROJECT_FOLDER}"
        fi
    fi
}
