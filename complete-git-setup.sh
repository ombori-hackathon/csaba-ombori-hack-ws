#!/bin/bash
set -e  # Exit on error
set -x  # Print commands

echo "=== Completing Git Setup for Hackathon Workspace ==="

# Step 1: Push API repo
echo "Step 1: Pushing API repository..."
cd /Users/csaba.gulyas/ombori/hackatlon/services/api
rm -rf .git
git init
git add .
git commit -m "Initial FastAPI backend setup"
git branch -M main
git remote add origin https://github.com/ombori-hackathon/csaba-ombori-hack-api.git
git push -u origin main

# Step 2: Go back to workspace root and prepare for submodules
echo "Step 2: Preparing workspace for submodules..."
cd /Users/csaba.gulyas/ombori/hackatlon
rm -rf apps/macos-client
rm -rf services/api

# Step 3: Initialize workspace git
echo "Step 3: Initializing workspace repository..."
git init

# Step 4: Add submodules
echo "Step 4: Adding submodules..."
git submodule add https://github.com/ombori-hackathon/csaba-ombori-hack-macos.git apps/macos-client
git submodule add https://github.com/ombori-hackathon/csaba-ombori-hack-api.git services/api

# Step 5: Commit workspace
echo "Step 5: Committing workspace..."
git add .
git commit -m "Initial workspace setup with submodules"
git branch -M main
git remote add origin https://github.com/ombori-hackathon/csaba-ombori-hack-ws.git
git push -u origin main

echo ""
echo "=== Git Setup Complete! ==="
echo ""
echo "Next steps:"
echo "1. Start database: docker compose up -d"
echo "2. Start API: cd services/api && uv run fastapi dev"
echo "3. Run Swift client: cd apps/macos-client && swift run CsabaOmboriHackClient"
echo ""
echo "Use /feature to start building features!"
