# Init Kit

initKit is a project setup script that automates the initialization of different types of projects by creating the necessary directory structure, files, and optionally adding predefined libraries or frameworks. It supports creating:

- Web Apps with HTML, CSS, and JavaScript.
- Python Scripts.
- Node.js Applications.

## Features

- Creates project directories and essential files with boilerplate code.
- Optional addition of predefined libraries/frameworks like jQuery, Bootstrap, Tailwind CSS (for web apps), Requests, Flask, NumPy (for Python scripts), and Express, Body-parser, Mongoose (for Node.js apps).

## Prerequisites

- **For Windows Users**:
  - Install Git for Windows with Git Bash from [git-scm.com](https://git-scm.com/).

- **For macOS Users**:
  - Use Terminal, which comes pre-installed on macOS.

- **For Linux Users**:
  - Use your preferred terminal emulator.

- **Additional Requirements**:
  - Ensure you have Node.js and npm installed for Node.js projects.
  - Ensure you have Python and pip installed for Python projects.

## Installation

1. Clone the repository to your local machine:
   Add this file in the directory where you want your projects. 
   ```bash
   git clone https://github.com/Anhad-Ajit-Singh-Beri/Init-Kit.git
   cd InitKit

2. Make the script executable:
   ```
   chmod +x create_project.sh

## Usage
### Running the Script
 - Open your terminal or Git Bash (Windows) and navigate to the directory where create_project.sh is located.

**Run the script:**
  ```
    ./create_project.sh
```

## Project Types
**Web App:**

 - Creates an index.html file with basic HTML structure, styles.css, and app.js.
 - Optionally adds jQuery, Bootstrap, or Tailwind CSS.

**Python Script:**

 - Creates a main.py file with a basic Python script structure.
 - Optionally adds Requests, Flask, or NumPy.

**Node.js App:**

 - Initializes an npm project with npm init.
 - Creates an index.js file with a basic Node.js script structure.
 - Optionally adds Express, Body-parser, or Mongoose.


## Example
**Creating a Web App**

```
  ./create_project.sh
```

1. Select "Web App" when prompted.
2. Enter the project name (e.g., MyWebApp).
3. Choose the libraries/frameworks to add (e.g., jQuery, Bootstrap).
4. Your project is ready to use!




