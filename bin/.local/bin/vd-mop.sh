#!/bin/bash

set -e

# Helper functions
selectValue () {
    PS3="$1" # Set special select promt variable
    shift
    select currentSelection in "$@"; do
        if [ -z "$currentSelection" ]; then
            echo "Unknown value"
        else
            echo $currentSelection && return
        fi
    done
}

# Select environment
environments=(
    "dev"
    "test"
    "acc-bvmop"
    "acc-mbvm"
)
selectedEnvironment=$(selectValue "Select Env: " ${environments[@]})

# Source selected environment variables
source ~/private-dotfiles/bin/mop-db-var.sh ${selectedEnvironment}

echo "SCHOE: ${DB_SCHEMAS}"
selectedSchema=$(selectValue "Select Schema: " ${DB_SCHEMAS[@]})

echo "Pass hint: ${PASS_HINT}"
read -s -p 'DB password: ' dbPassword

vd --postgres-schema="${selectedSchema}" postgres://${DB_USERNAME}:${dbPassword}@${DB_HOST}:${DB_PORT}/${DB_NAME}?sslmode=require

