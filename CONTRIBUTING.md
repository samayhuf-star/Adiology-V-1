# Contributing to Adiology-V-1

Thank you for your interest in contributing to Adiology-V-1! This guide will help you upload files from your local computer to this repository.

## Quick Start: Uploading Files

### Method 1: Using Git Command Line

1. **Clone the repository** (if you haven't already):
   ```bash
   git clone https://github.com/samayhuf-star/Adiology-V-1.git
   cd Adiology-V-1
   ```

2. **Add your files**:
   ```bash
   # Copy your files to the repository directory
   # For example, copy all files from a directory:
   cp /path/to/your/files/* .
   
   # Or copy a specific file:
   cp /path/to/your/file.txt .
   ```

3. **Stage your files**:
   ```bash
   # Add all new files
   git add .
   
   # Or add specific files
   git add file1.txt file2.txt
   ```

4. **Commit your changes**:
   ```bash
   git commit -m "Add files: description of what you're uploading"
   ```

5. **Push to GitHub**:
   ```bash
   git push origin main
   ```

### Method 2: Using GitHub Web Interface

1. Navigate to https://github.com/samayhuf-star/Adiology-V-1
2. Click "Add file" → "Upload files"
3. Drag and drop your files or click "choose your files"
4. Add a commit message describing your upload
5. Click "Commit changes"

### Method 3: Using GitHub Desktop

1. Install [GitHub Desktop](https://desktop.github.com/)
2. Clone the repository through GitHub Desktop
3. Copy files to your local repository folder
4. GitHub Desktop will automatically detect changes
5. Add a commit message and click "Commit to main"
6. Click "Push origin" to upload

## File Organization

Please organize your files according to this structure:

```
Adiology-V-1/
├── docs/           # Documentation files
├── src/            # Source code files
├── data/           # Data files
├── images/         # Image files
├── scripts/        # Utility scripts
└── tests/          # Test files
```

## Best Practices

1. **Use meaningful file names**: Use descriptive names that indicate the file's content
2. **Check file sizes**: Large files (>100MB) may require Git LFS
3. **Review before committing**: Use `git status` and `git diff` to review changes
4. **Write clear commit messages**: Describe what files you're adding and why
5. **Keep related files together**: Organize files into appropriate directories

## Common Git Commands

```bash
# Check what files will be committed
git status

# See changes in files
git diff

# Remove a file from staging
git reset HEAD filename

# Undo local changes to a file
git checkout -- filename

# Create a new branch for your changes
git checkout -b my-new-branch

# Switch back to main branch
git checkout main

# Pull latest changes from GitHub
git pull origin main
```

## Troubleshooting

### Large Files
If you have files larger than 100MB, you'll need to use Git LFS:
```bash
# Install Git LFS
git lfs install

# Track large file types
git lfs track "*.psd"
git lfs track "*.zip"

# Add .gitattributes
git add .gitattributes

# Then add and commit your files normally
git add large-file.zip
git commit -m "Add large file"
git push origin main
```

### Merge Conflicts
If you encounter merge conflicts:
```bash
# Pull latest changes
git pull origin main

# Resolve conflicts in your text editor
# Look for <<<<<<, =====, and >>>>>> markers

# After resolving, add the files
git add resolved-file.txt

# Complete the merge
git commit -m "Resolve merge conflicts"
git push origin main
```

## Need Help?

If you encounter any issues:
1. Check the [GitHub documentation](https://docs.github.com/)
2. Open an issue in this repository
3. Contact the repository maintainers

## Additional Resources

- [Git Basics](https://git-scm.com/book/en/v2/Getting-Started-Git-Basics)
- [GitHub Guides](https://guides.github.com/)
- [Git LFS](https://git-lfs.github.com/)
