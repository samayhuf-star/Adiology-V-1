#!/bin/bash

# Upload Files Script for Adiology-V-1
# This script helps you upload files from your local computer to the repository

echo "==================================="
echo "Adiology-V-1 File Upload Helper"
echo "==================================="
echo ""

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    echo "Error: Not in a git repository!"
    echo "Please run this script from the Adiology-V-1 directory."
    exit 1
fi

# Function to upload files from a directory
upload_from_directory() {
    echo "Enter the full path to the directory containing your files:"
    read source_dir
    
    if [ ! -d "$source_dir" ]; then
        echo "Error: Directory not found: $source_dir"
        exit 1
    fi
    
    echo ""
    echo "Where should these files go in the repository?"
    echo "Options:"
    echo "  1. docs/    - Documentation files"
    echo "  2. src/     - Source code"
    echo "  3. data/    - Data files"
    echo "  4. images/  - Images"
    echo "  5. scripts/ - Scripts"
    echo "  6. tests/   - Tests"
    echo "  7. Root directory"
    read -p "Enter your choice (1-7): " dest_choice
    
    case $dest_choice in
        1) dest_dir="docs/" ;;
        2) dest_dir="src/" ;;
        3) dest_dir="data/" ;;
        4) dest_dir="images/" ;;
        5) dest_dir="scripts/" ;;
        6) dest_dir="tests/" ;;
        7) dest_dir="." ;;
        *) echo "Invalid choice"; exit 1 ;;
    esac
    
    echo ""
    echo "Copying files from $source_dir to $dest_dir..."
    cp -r "$source_dir"/* "$dest_dir"
    
    echo "Files copied successfully!"
}

# Function to upload specific files
upload_specific_files() {
    echo "Enter the full path to the file(s) you want to upload (space-separated):"
    read files
    
    echo ""
    echo "Where should these files go in the repository?"
    echo "Options:"
    echo "  1. docs/    - Documentation files"
    echo "  2. src/     - Source code"
    echo "  3. data/    - Data files"
    echo "  4. images/  - Images"
    echo "  5. scripts/ - Scripts"
    echo "  6. tests/   - Tests"
    echo "  7. Root directory"
    read -p "Enter your choice (1-7): " dest_choice
    
    case $dest_choice in
        1) dest_dir="docs/" ;;
        2) dest_dir="src/" ;;
        3) dest_dir="data/" ;;
        4) dest_dir="images/" ;;
        5) dest_dir="scripts/" ;;
        6) dest_dir="tests/" ;;
        7) dest_dir="." ;;
        *) echo "Invalid choice"; exit 1 ;;
    esac
    
    echo ""
    echo "Copying files to $dest_dir..."
    for file in $files; do
        if [ -f "$file" ]; then
            cp "$file" "$dest_dir"
            echo "  ✓ Copied: $(basename $file)"
        else
            echo "  ✗ Not found: $file"
        fi
    done
}

# Main menu
echo "What would you like to do?"
echo "  1. Upload all files from a directory"
echo "  2. Upload specific files"
echo "  3. View status of files to be committed"
echo "  4. Commit and push files"
echo ""
read -p "Enter your choice (1-4): " choice

case $choice in
    1)
        upload_from_directory
        ;;
    2)
        upload_specific_files
        ;;
    3)
        echo ""
        echo "Current status:"
        git status
        exit 0
        ;;
    4)
        echo ""
        git status
        echo ""
        read -p "Enter commit message: " commit_msg
        git add .
        git commit -m "$commit_msg"
        echo ""
        echo "Pushing to GitHub..."
        git push origin main
        echo ""
        echo "Files uploaded successfully!"
        exit 0
        ;;
    *)
        echo "Invalid choice"
        exit 1
        ;;
esac

# Ask if user wants to commit and push
echo ""
read -p "Would you like to commit and push these files now? (y/n): " commit_now

if [ "$commit_now" = "y" ] || [ "$commit_now" = "Y" ]; then
    echo ""
    git status
    echo ""
    read -p "Enter commit message: " commit_msg
    git add .
    git commit -m "$commit_msg"
    echo ""
    echo "Pushing to GitHub..."
    git push origin main
    echo ""
    echo "Files uploaded successfully!"
else
    echo ""
    echo "Files have been copied but not committed."
    echo "Run 'git status' to see the changes."
    echo "When ready, run this script again and choose option 4 to commit and push."
fi
