# Implement Linear Ticket with PR

You are implementing a Linear ticket end-to-end including PR creation. Follow this workflow precisely with human checkpoints.

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

## Phase 6: Create Pull Request

Use gh CLI to create PR:

gh pr create \
 --title "<TICKET-ID>: <ticket title>" \
 --body "## Summary
<1-2 sentence overview>

## Linear Ticket

<full Linear URL>

## Changes

- <bullet list of what changed>

## Acceptance Criteria

<copy from Linear ticket>

## Testing

- [ ] <relevant test checklist>

## Screenshots

<if UI changes, note here>
" \
 --base main \
 --head feature/<TICKET-ID>

## Phase 7: Add Reviewer

gh pr edit --add-reviewer <prompt user for GitHub username>

**STOP** - Ask user: "Who should review this PR? Provide GitHub username."

Then run:
gh pr edit --add-reviewer <username>

## Phase 8: Update Linear

1. Move ticket to "In Review" status
2. Add comment with PR link and summary

## Rules

- NEVER skip human checkpoints
- NEVER force push
- NEVER commit to main directly
- Include ticket ID in all commits
- Keep commits atomic and focused
- PR description must reference Linear ticket
