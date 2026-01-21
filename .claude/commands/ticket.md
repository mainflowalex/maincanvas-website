# Implement Linear Ticket

You are implementing a Linear ticket. Follow this workflow precisely with human checkpoints.

## Input
Linear ticket URL: $ARGUMENTS

## Phase 1: Context Gathering
1. Extract ticket ID from URL (e.g., CORE-198)
2. Use Linear MCP to fetch full ticket details:
   - Title, description, acceptance criteria
   - Any linked issues or dependencies
3. **STOP** - Present ticket summary and ask for approval to proceed

## Phase 2: Planning
1. Analyze codebase for relevant files
2. Create implementation plan with:
   - Files to create/modify
   - Approach and rationale
   - Potential risks or edge cases
3. **STOP** - Present plan and wait for explicit approval

## Phase 3: Branch Setup
git checkout main
git pull origin main
git checkout -b feature/<TICKET-ID>

## Phase 4: Implementation
1. Implement according to approved plan
2. Follow existing code patterns and conventions
3. Add tests if applicable
4. Run linting/formatting

## Phase 5: Commit & Push
git add -A
git commit -m "<TICKET-ID>: <brief description>

- Implementation details
- Resolves <full Linear URL>"
git push -u origin feature/<TICKET-ID>

## Phase 6: Update Linear
1. Move ticket to "In Review" status
2. Add comment with branch name and summary

## Rules
- NEVER skip human checkpoints
- NEVER force push
- NEVER commit to main directly
- Include ticket ID in all commits
- Keep commits atomic and focused
