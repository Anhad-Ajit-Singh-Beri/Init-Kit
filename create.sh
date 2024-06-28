#!/bin/bash

# Logging setup
LOG_FILE="initKit.log"

# Function to log messages
log_message() {
    local timestamp=$(date +"%Y-%m-%d %T")
    echo "[$timestamp] $1" >> "$LOG_FILE"
}

# Function to handle errors
handle_error() {
    local error_message="$1"
    echo "Error: $error_message" >&2
    log_message "Error: $error_message"
    exit 1
}

# Function to initialize Git repository
initialize_git() {
    git init > /dev/null 2>&1 || handle_error "Failed to initialize Git repository"
    log_message "Initialized Git repository."
}

# Function to create README.md file
create_readme() {
    cat > README.md <<EOF || handle_error "Failed to create README.md"
# $PROJECT_NAME

## Description
Describe your project here.

## Installation
Provide installation instructions here.

## Usage
Provide usage instructions here.

## Contributing
Provide guidelines for contributing to your project.

## License
This project is licensed under the $LICENSE_TYPE License.
EOF
}

# Function to create LICENSE.txt file
create_license() {
    case $LICENSE_TYPE in
        "MIT")
            LICENSE_TEXT="MIT License

Copyright (c) Year(s), Author

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the \"Software\"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE."
            ;;
        "GPL")
            LICENSE_TEXT="GPL License

This is a placeholder for the GPL License text. Replace it with the actual GPL License text."
            ;;
        *)
            handle_error "Unsupported license type: $LICENSE_TYPE"
            ;;
    esac

    echo "$LICENSE_TEXT" > LICENSE.txt || handle_error "Failed to create LICENSE.txt"
}

# Function to create .gitignore file
create_gitignore() {
    cat > .gitignore <<EOF
# Ignore npm modules
node_modules/
EOF
}

# Function to create a web app project
create_web_app() {
    mkdir -p "$PROJECT_NAME" || handle_error "Failed to create directory $PROJECT_NAME"
    cd "$PROJECT_NAME" || handle_error "Failed to change directory to $PROJECT_NAME"

    echo "Creating index.html..."
    cat > index.html <<EOF || handle_error "Failed to create index.html"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$PROJECT_NAME</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Welcome to $PROJECT_NAME</h1>
    <script src="app.js"></script>
</body>
</html>
EOF

    echo "Creating style.css..."
    cat > style.css <<EOF || handle_error "Failed to create style.css"
* {
    box-sizing: border-box;
    padding: 0;
    margin: 0;
}
EOF

    echo "Creating app.js..."
    touch app.js || handle_error "Failed to create app.js"

    echo "Select libraries/frameworks to add:"
    echo "1. jQuery"
    echo "2. Bootstrap"
    echo "3. Tailwind CSS"
    read -p "Enter the numbers corresponding to your choices (space-separated): " CHOICES

    for CHOICE in $CHOICES; do
        case $CHOICE in
            1)
                echo "<script src=\"https://code.jquery.com/jquery-3.6.0.min.js\"></script>" >> index.html || handle_error "Failed to add jQuery to index.html"
                ;;
            2)
                echo "<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\">" >> index.html || handle_error "Failed to add Bootstrap CSS to index.html"
                echo "<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js\"></script>" >> index.html || handle_error "Failed to add Bootstrap JS to index.html"
                ;;
            3)
                echo "<link href=\"https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css\" rel=\"stylesheet\">" >> index.html || handle_error "Failed to add Tailwind CSS to index.html"
                ;;
            *)
                handle_error "Invalid choice: $CHOICE"
                ;;
        esac
    done

    echo "Creating .gitignore file..."
    create_gitignore || handle_error "Failed to create .gitignore file"

    echo "Creating README.md file..."
    create_readme || handle_error "Failed to create README.md"

    echo "Creating LICENSE.txt file..."
    create_license || handle_error "Failed to create LICENSE.txt"

    echo "Web app project created successfully."
    log_message "Web app project '$PROJECT_NAME' created successfully."
}

# Function to create a Python script project
create_python_script() {
    mkdir -p "$PROJECT_NAME" || handle_error "Failed to create directory $PROJECT_NAME"
    cd "$PROJECT_NAME" || handle_error "Failed to change directory to $PROJECT_NAME"

    echo "Creating main.py..."
    cat > main.py <<EOF || handle_error "Failed to create main.py"
#!/usr/bin/env python3

def main():
    print("Welcome to $PROJECT_NAME")

if __name__ == "__main__":
    main()
EOF

    echo "Select libraries/frameworks to add:"
    echo "1. Requests"
    echo "2. Flask"
    echo "3. NumPy"
    read -p "Enter the numbers corresponding to your choices (space-separated): " CHOICES

    for CHOICE in $CHOICES; do
        case $CHOICE in
            1)
                pip install requests || handle_error "Failed to install Requests"
                echo "import requests" >> main.py || handle_error "Failed to add Requests import to main.py"
                ;;
            2)
                pip install flask || handle_error "Failed to install Flask"
                echo "from flask import Flask" >> main.py || handle_error "Failed to add Flask import to main.py"
                ;;
            3)
                pip install numpy || handle_error "Failed to install NumPy"
                echo "import numpy as np" >> main.py || handle_error "Failed to add NumPy import to main.py"
                ;;
            *)
                handle_error "Invalid choice: $CHOICE"
                ;;
        esac
    done

    echo "Creating .gitignore file..."
    create_gitignore || handle_error "Failed to create .gitignore file"

    echo "Creating README.md file..."
    create_readme || handle_error "Failed to create README.md"

    echo "Creating LICENSE.txt file..."
    create_license || handle_error "Failed to create LICENSE.txt"

    echo "Python script project created successfully."
    log_message "Python script project '$PROJECT_NAME' created successfully."
}

# Function to create a Node.js app project
create_node_app() {
    mkdir -p "$PROJECT_NAME" || handle_error "Failed to create directory $PROJECT_NAME"
    cd "$PROJECT_NAME" || handle_error "Failed to change directory to $PROJECT_NAME"

    echo "Initializing npm..."
    npm init -y > /dev/null 2>&1 || handle_error "Failed to initialize npm"

    echo "Creating index.js..."
    cat > index.js <<EOF || handle_error "Failed to create index.js"
console.log('Welcome to $PROJECT_NAME');
EOF

    echo "Select libraries/frameworks to add:"
    echo "1. Express"
    echo "2. Body-parser"
    echo "3. Mongoose"
    read -p "Enter the numbers corresponding to your choices (space-separated): " CHOICES

    for CHOICE in $CHOICES; do
        case $CHOICE in
            1)
                npm install express || handle_error "Failed to install Express"
                echo "const express = require('express');" >> index.js || handle_error "Failed to add Express import to index.js"
                ;;
            2)
                npm install body-parser || handle_error "Failed to install Body-parser"
                echo "const bodyParser = require('body-parser');" >> index.js || handle_error "Failed to add Body-parser import to index.js"
                ;;
            3)
                npm install mongoose || handle_error "Failed to install Mongoose"
                echo "const mongoose = require('mongoose');" >> index.js || handle_error "Failed to add Mongoose import to index.js"
                ;;
            *)
                handle_error "Invalid choice: $CHOICE"
                ;;
        esac
    done

    echo "Creating .gitignore file..."
    create_gitignore || handle_error "Failed to create .gitignore file"

    echo "Creating README.md file..."
    create_readme || handle_error "Failed to create README.md"

    echo "Creating LICENSE.txt file..."
    create_license || handle_error "Failed to create LICENSE.txt"

    echo "Node.js app project created successfully."
    log_message "Node.js app project '$PROJECT_NAME' created successfully."
}

# Main script logic
echo "Select the type of project you want to create:"
echo "1. Web App"
echo "2. Python Script"
echo "3. Node.js App"
read -p "Enter the number corresponding to your choice: " PROJECT_TYPE

read -p "Enter the project name: " PROJECT_NAME

read -p "Choose a license for your project (e.g., MIT, GPL): " LICENSE_TYPE

case $PROJECT_TYPE in
    1)
        create_web_app
        ;;
    2)
        create_python_script
        ;;
    3)
        create_node_app
        ;;
    *)
        handle_error "Invalid choice. Exiting..."
        ;;
esac

# Initialize Git repository if user agrees
read -p "Initialize Git repository? (y/n): " INITIALIZE_GIT
if [[ $INITIALIZE_GIT =~ ^[Yy]$ ]]; then
    initialize_git
fi
