#!/bin/bash

# GitHub API URL
API_URL="https://api.github.com"

# GitHub username and personal access token
USERNAME=$username   # Placeholder for GitHub username
TOKEN=$token         # Placeholder for GitHub personal access token

# User and Repository information
REPO_OWNER=$1  # The first argument to the script: the owner of the repository
REPO_NAME=$2   # The second argument to the script: the name of the repository

# Function to make a GET request to the GitHub API
function github_api_get {
    local endpoint="$1"  # The API endpoint to query
    local url="${API_URL}/${endpoint}"  # Full URL for the API request

    # Send a GET request to the GitHub API with authentication
    curl -s -u "${USERNAME}:${TOKEN}" "$url"
}

# Function to list users with read access to the repository
function list_users_with_read_access {
    local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"  # API endpoint to get collaborators

    # Fetch the list of collaborators on the repository
    collaborators="$(github_api_get "$endpoint" | jq -r '.[] | select(.permissions.pull == true) | .login')"

    # Display the list of collaborators with read access
    if [[ -z "$collaborators" ]]; then
        echo "No users with read access found for ${REPO_OWNER}/${REPO_NAME}."
    else
        echo "Users with read access to ${REPO_OWNER}/${REPO_NAME}:"
        echo "$collaborators"
    fi
}

# Main script

echo "Listing users with read access to ${REPO_OWNER}/${REPO_NAME}..."
list_users_with_read_access  # Call the function to list users with read access
