#!/bin/bash

# Function to create a web app project
create_web_app() {
    mkdir -p "$PROJECT_NAME"
    cd "$PROJECT_NAME" || exit

    echo "Creating index.html..."
    cat > index.html <<EOF
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
    cat > style.css <<EOF
*{
box-sizing: border-box;
padding: 0;
margin: 0;
}
EOF

    echo "Creating app.js..."
    touch app.js

    echo "Select libraries/frameworks to add:"
    echo "1. jQuery"
    echo "2. Bootstrap"
    echo "3. Tailwind CSS"
    read -p "Enter the numbers corresponding to your choices (space-separated): " CHOICES

    for CHOICE in $CHOICES; do
        case $CHOICE in
            1)
                echo "<script src=\"https://code.jquery.com/jquery-3.6.0.min.js\"></script>" >> index.html
                ;;
            2)
                echo "<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\">" >> index.html
                echo "<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js\"></script>" >> index.html
                ;;
            3)
                echo "<link href=\"https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css\" rel=\"stylesheet\">" >> index.html
                ;;
            *)
                echo "Invalid choice: $CHOICE"
                ;;
        esac
    done

    echo "Web app project created successfully."
}

# Function to create a Python script project
create_python_script() {
    mkdir -p "$PROJECT_NAME"
    cd "$PROJECT_NAME" || exit

    echo "Creating main.py..."
    cat > main.py <<EOF
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
                pip install requests
                echo "import requests" >> main.py
                ;;
            2)
                pip install flask
                echo "from flask import Flask" >> main.py
                ;;
            3)
                pip install numpy
                echo "import numpy as np" >> main.py
                ;;
            *)
                echo "Invalid choice: $CHOICE"
                ;;
        esac
    done

    echo "Python script project created successfully."
}

# Function to create a Node.js app project
create_node_app() {
    mkdir -p "$PROJECT_NAME"
    cd "$PROJECT_NAME" || exit

    echo "Initializing npm..."
    npm init -y > /dev/null 2>&1

    echo "Creating index.js..."
    cat > index.js <<EOF
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
                npm install express
                echo "const express = require('express');" >> index.js
                ;;
            2)
                npm install body-parser
                echo "const bodyParser = require('body-parser');" >> index.js
                ;;
            3)
                npm install mongoose
                echo "const mongoose = require('mongoose');" >> index.js
                ;;
            *)
                echo "Invalid choice: $CHOICE"
                ;;
        esac
    done

    echo "Node.js app project created successfully."
}

# Main script logic
echo "Select the type of project you want to create:"
echo "1. Web App"
echo "2. Python Script"
echo "3. Node.js App"
read -p "Enter the number corresponding to your choice: " PROJECT_TYPE

read -p "Enter the project name: " PROJECT_NAME

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
        echo "Invalid choice. Exiting..."
        exit 1
        ;;
esac
