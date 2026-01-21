#!/bin/bash

# MainCanvas Local Development Setup
# One-command setup for new developers

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color
BOLD='\033[1m'

# Print header
echo ""
echo -e "${BOLD}${BLUE}========================================${NC}"
echo -e "${BOLD}  🚀 MainCanvas Development Setup${NC}"
echo -e "${BOLD}${BLUE}========================================${NC}"
echo ""

# Step 1: Install dependencies
echo -e "${BOLD}📦 Installing dependencies...${NC}"
if npm ci; then
    echo -e "${GREEN}✓ Dependencies installed${NC}"
else
    echo -e "${RED}✗ Failed to install dependencies${NC}"
    exit 1
fi
echo ""

# Step 2: Create .env.local if not exists
echo -e "${BOLD}🔧 Checking environment configuration...${NC}"
if [ ! -f .env.local ]; then
    if [ -f .env.example ]; then
        cp .env.example .env.local
        echo -e "${GREEN}✓ Created .env.local from .env.example${NC}"
        echo -e "${YELLOW}  ⚠ Review .env.local and add your values${NC}"
    else
        echo -e "${YELLOW}⚠ No .env.example found, skipping .env.local creation${NC}"
    fi
else
    echo -e "${GREEN}✓ .env.local already exists${NC}"
fi
echo ""

# Step 3: Install Playwright browsers (if Playwright is in dependencies)
if grep -q "playwright" package.json 2>/dev/null; then
    echo -e "${BOLD}🎭 Installing Playwright browsers...${NC}"
    if npx playwright install; then
        echo -e "${GREEN}✓ Playwright browsers installed${NC}"
    else
        echo -e "${YELLOW}⚠ Playwright browser installation had issues${NC}"
    fi
    echo ""
fi

# Complete
echo -e "${BLUE}========================================${NC}"
echo ""
echo -e "${GREEN}${BOLD}  ✅ Setup complete!${NC}"
echo ""
echo -e "  Run ${BOLD}npm run dev${NC} to start the development server."
echo ""
