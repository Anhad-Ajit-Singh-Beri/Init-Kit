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

# Function to create a web app project from a custom template or default
create_web_app_from_template() {
    local template_dir="$1"

    if [[ ! -d "$template_dir" ]]; then
        handle_error "Template directory '$template_dir' not found."
    fi

    mkdir -p "$PROJECT_NAME" || handle_error "Failed to create directory $PROJECT_NAME"
    cd "$PROJECT_NAME" || handle_error "Failed to change directory to $PROJECT_NAME"

    # Copy template files from the specified directory
    cp -r "$template_dir"/* ./ || handle_error "Failed to copy template files"

    echo "Web app project created successfully."
    log_message "Web app project '$PROJECT_NAME' created successfully."
}

# Function to create a Python script project from a custom template or default
create_python_script_from_template() {
    local template_dir="$1"

    if [[ ! -d "$template_dir" ]]; then
        handle_error "Template directory '$template_dir' not found."
    fi

    mkdir -p "$PROJECT_NAME" || handle_error "Failed to create directory $PROJECT_NAME"
    cd "$PROJECT_NAME" || handle_error "Failed to change directory to $PROJECT_NAME"

    # Copy template files from the specified directory
    cp -r "$template_dir"/* ./ || handle_error "Failed to copy template files"

    echo "Python script project created successfully."
    log_message "Python script project '$PROJECT_NAME' created successfully."
}

# Function to create a Node.js app project from a custom template or default
create_node_app_from_template() {
    local template_dir="$1"

    if [[ ! -d "$template_dir" ]]; then
        handle_error "Template directory '$template_dir' not found."
    fi

    mkdir -p "$PROJECT_NAME" || handle_error "Failed to create directory $PROJECT_NAME"
    cd "$PROJECT_NAME" || handle_error "Failed to change directory to $PROJECT_NAME"

    # Copy template files from the specified directory
    cp -r "$template_dir"/* ./ || handle_error "Failed to copy template files"

    echo "Node.js app project created successfully."
    log_message "Node.js app project '$PROJECT_NAME' created successfully."
}

# Function to create a Java project from a custom template or default
create_java_project_from_template() {
    local template_dir="$1"

    if [[ ! -d "$template_dir" ]]; then
        handle_error "Template directory '$template_dir' not found."
    fi

    mkdir -p "$PROJECT_NAME/src" || handle_error "Failed to create directory $PROJECT_NAME/src"
    cd "$PROJECT_NAME" || handle_error "Failed to change directory to $PROJECT_NAME"

    # Copy template files from the specified directory
    cp -r "$template_dir"/* ./ || handle_error "Failed to copy template files"

    echo "Java project created successfully."
    log_message "Java project '$PROJECT_NAME' created successfully."
}

# Function to create a C++ project from a custom template or default
create_cpp_project_from_template() {
    local template_dir="$1"

    if [[ ! -d "$template_dir" ]]; then
        handle_error "Template directory '$template_dir' not found."
    fi

    mkdir -p "$PROJECT_NAME/src" || handle_error "Failed to create directory $PROJECT_NAME/src"
    cd "$PROJECT_NAME" || handle_error "Failed to change directory to $PROJECT_NAME"

    # Copy template files from the specified directory
    cp -r "$template_dir"/* ./ || handle_error "Failed to copy template files"

    echo "C++ project created successfully."
    log_message "C++ project '$PROJECT_NAME' created successfully."
}

# Function to create a Ruby project from a custom template or default
create_ruby_project_from_template() {
    local template_dir="$1"

    if [[ ! -d "$template_dir" ]]; then
        handle_error "Template directory '$template_dir' not found."
    fi

    mkdir -p "$PROJECT_NAME" || handle_error "Failed to create directory $PROJECT_NAME"
    cd "$PROJECT_NAME" || handle_error "Failed to change directory to $PROJECT_NAME"

    # Copy template files from the specified directory
    cp -r "$template_dir"/* ./ || handle_error "Failed to copy template files"

    echo "Ruby project created successfully."
    log_message "Ruby project '$PROJECT_NAME' created successfully."
}

# Main script logic
echo "Select the type of project you want to create:"
echo "1. Web App"
echo "2. Python Script"
echo "3. Node.js App"
echo "4. Java Project"
echo "5. C++ Project"
echo "6. Ruby Project"
read -p "Enter the number corresponding to your choice: " PROJECT_TYPE

read -p "Enter the project name: " PROJECT_NAME

read -p "Choose a license for your project (e.g., MIT, GPL): " LICENSE_TYPE

# Prompt to use a custom template or default
read -p "Do you want to use a custom template? (y/n): " USE_TEMPLATE

if [[ $USE_TEMPLATE =~ ^[Yy]$ ]]; then
    read -p "Enter the path to your custom template directory: " TEMPLATE_PATH

    case $PROJECT_TYPE in
        1)
            create_web_app_from_template "$TEMPLATE_PATH"
            ;;
        2)
            create_python_script_from_template "$TEMPLATE_PATH"
            ;;
        3)
            create_node_app_from_template "$TEMPLATE_PATH"
            ;;
        4)
            create_java_project_from_template "$TEMPLATE_PATH"
            ;;
        5)
            create_cpp_project_from_template "$TEMPLATE_PATH"
            ;;
        6)
            create_ruby_project_from_template "$TEMPLATE_PATH"
            ;;
        *)
            handle_error "Invalid choice. Exiting..."
            ;;
    esac
else
    case $PROJECT_TYPE in
        1)
            # Use default web app template directory
            DEFAULT_TEMPLATE_DIR="templates/web_app"
            create_web_app_from_template "$DEFAULT_TEMPLATE_DIR"
            ;;
        2)
            # Use default Python script template directory
            DEFAULT_TEMPLATE_DIR="templates/python_script"
            create_python_script_from_template "$DEFAULT_TEMPLATE_DIR"
            ;;
        3)
            # Use default Node.js app template directory
            DEFAULT_TEMPLATE_DIR="templates/node_app"
            create_node_app_from_template "$DEFAULT_TEMPLATE_DIR"
            ;;
        4)
            # Use default Java project template directory
            DEFAULT_TEMPLATE_DIR="templates/java_project"
            create_java_project_from_template "$DEFAULT_TEMPLATE_DIR"
            ;;
        5)
            # Use default C++ project template directory
            DEFAULT_TEMPLATE_DIR="templates/cpp_project"
            create_cpp_project_from_template "$DEFAULT_TEMPLATE_DIR"
            ;;
        6)
            # Use default Ruby project template directory
            DEFAULT_TEMPLATE_DIR="templates/ruby_project"
            create_ruby_project_from_template "$DEFAULT_TEMPLATE_DIR"
            ;;
        *)
            handle_error "Invalid choice. Exiting..."
            ;;
    esac
fi

# Initialize Git repository if user agrees
read -p "Initialize Git repository? (y/n): " INITIALIZE_GIT
if [[ $INITIALIZE_GIT =~ ^[Yy]$ ]]; then
    initialize_git
fi

# Create README.md, LICENSE.txt, and .gitignore files
echo "Creating README.md file..."
create_readme || handle_error "Failed to create README.md"

echo "Creating LICENSE.txt file..."
create_license || handle_error "Failed to create LICENSE.txt"

echo "Creating .gitignore file..."
create_gitignore || handle_error "Failed to create .gitignore"

echo "Project initialization completed successfully."