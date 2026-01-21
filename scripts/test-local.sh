#!/bin/bash

# MainCanvas Local Test Runner
# Runs all test suites with color-coded output

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color
BOLD='\033[1m'

# Track results
UNIT_RESULT=0
INTEGRATION_RESULT=0
E2E_RESULT=0
OVERALL_RESULT=0

# Print header
echo ""
echo -e "${BOLD}${BLUE}========================================${NC}"
echo -e "${BOLD}  🧪 MainCanvas Test Suite${NC}"
echo -e "${BOLD}${BLUE}========================================${NC}"
echo ""

# Function to run a test suite
run_tests() {
    local name=$1
    local script=$2
    local emoji=$3

    echo -e "${BOLD}${emoji} ${name}...${NC}"
    echo ""

    # Check if the script exists in package.json
    if npm run "$script" --if-present 2>/dev/null; then
        echo ""
        echo -e "${GREEN}✓ ${name} passed${NC}"
        return 0
    else
        # Check if script doesn't exist vs failed
        if ! npm run "$script" 2>&1 | grep -q "Missing script"; then
            echo ""
            echo -e "${RED}✗ ${name} failed${NC}"
            return 1
        else
            echo -e "${YELLOW}⚠ ${name} skipped (script not configured)${NC}"
            return 0
        fi
    fi
}

# Run Unit Tests
echo -e "${BLUE}────────────────────────────────────────${NC}"
run_tests "Unit Tests" "test:unit" "📋"
UNIT_RESULT=$?
echo ""

# Run Integration Tests
echo -e "${BLUE}────────────────────────────────────────${NC}"
run_tests "Integration Tests" "test:integration" "🔗"
INTEGRATION_RESULT=$?
echo ""

# Run E2E Tests
echo -e "${BLUE}────────────────────────────────────────${NC}"
run_tests "E2E Tests" "test:e2e" "🌐"
E2E_RESULT=$?
echo ""

# Calculate overall result
if [ $UNIT_RESULT -ne 0 ] || [ $INTEGRATION_RESULT -ne 0 ] || [ $E2E_RESULT -ne 0 ]; then
    OVERALL_RESULT=1
fi

# Print summary
echo -e "${BLUE}========================================${NC}"
echo -e "${BOLD}  📊 Test Summary${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

print_status() {
    local name=$1
    local result=$2
    if [ $result -eq 0 ]; then
        echo -e "  ${name}: ${GREEN}✓ Passed${NC}"
    else
        echo -e "  ${name}: ${RED}✗ Failed${NC}"
    fi
}

print_status "Unit Tests       " $UNIT_RESULT
print_status "Integration Tests" $INTEGRATION_RESULT
print_status "E2E Tests        " $E2E_RESULT

echo ""
echo -e "${BLUE}────────────────────────────────────────${NC}"

if [ $OVERALL_RESULT -eq 0 ]; then
    echo ""
    echo -e "${GREEN}${BOLD}  ✅ All tests complete!${NC}"
    echo ""
else
    echo ""
    echo -e "${RED}${BOLD}  ❌ Some tests failed${NC}"
    echo ""
fi

exit $OVERALL_RESULT
