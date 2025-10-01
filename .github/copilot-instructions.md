# AI Coding Agent Instructions for AIWorkshop

## Project Overview
This is a Robot Framework browser automation project for testing web applications. The project uses the Browser library (Playwright-based) for modern web testing with built-in screenshot capabilities and robust error handling.

## Architecture & Dependencies
- **Package Manager**: `uv` for Python dependency management (not pip)
- **Testing Framework**: Robot Framework 7.3+ with Browser library 19.8+
- **Browser Automation**: Browser library (robotframework-browser) using Playwright under the hood
- **Python Package**: `src/aiworkshop/` contains minimal library code with helper functions
- **Virtual Environment**: Always activate `.venv` before running commands: `source .venv/bin/activate`

## Key Development Workflows

### Running Tests
```bash
# Activate environment first
source .venv/bin/activate

# Run specific test file
uv run robotcode robot tests/browser_test.robot

# Run all tests with custom output directory
uv run robotcode robot --outputdir results tests/

# Initialize Browser library (required after fresh install)
rfbrowser init
```

### Managing Dependencies
```bash
# Add new dependency
uv add robotframework-new-library

# Install dev dependencies
uv sync --group dev

# Update lockfile
uv lock
```

## Project-Specific Patterns

### Browser Test Structure
All Browser tests follow this pattern in `tests/*.robot`:
```robotframework
*** Settings ***
Library    Browser
Test Timeout    120s

*** Test Cases ***
Test Name
    New Browser    chromium    headless=False
    New Context    viewport={'width': 1920, 'height': 1080}
    Set Browser Timeout    45s
    # Test steps...
    Close Browser
```

### Error Handling Strategy
This project uses defensive programming with TRY/EXCEPT blocks and fallback approaches:
- Primary approach with specific selectors
- Fallback with more general selectors
- Final fallback with direct navigation
- Always continue test execution even on partial failures
- Log detailed information at each step

Example pattern from `tests/browser_test.robot`:
```robotframework
TRY
    Wait For Elements State    [role="dialog"] >> text="Accept"    visible    timeout=10s
    Click    [role="dialog"] >> text="Accept"
    ${handled}=    Set Variable    True
EXCEPT
    TRY
        Click    button:has-text("Accept") >> nth=0
        ${handled}=    Set Variable    True
    EXCEPT
        Log    All approaches failed, continuing...
    END
END
```

### Screenshot Strategy
- Take screenshots at key moments: page load, after interactions, on errors
- Use descriptive filenames: `initial_page_load.png`, `after_cookie_handling.png`
- Screenshots are stored in `results/browser/screenshot/`
- Always screenshot before failing or when debugging selectors

### Selector Patterns
1. **Role-based selectors**: `[role="dialog"]:has-text("text")`
2. **Text-based selectors**: `button:has-text("Accept")`
3. **CSS with nth**: `button:has-text("text") >> nth=0`
4. **Href-based**: `[href*="keyword"]`
5. **Fallback chaining**: Try specific → general → direct navigation

## Testing Configuration
- **Viewport**: Standard 1920x1080 for consistency
- **Timeouts**: 45s browser timeout, 120s test timeout
- **Browser**: Chromium with `headless=False` for development
- **Results**: Always output to `results/` directory with HTML reports

## Integration Points
- `src/aiworkshop/__init__.py`: Contains helper functions callable from Robot tests
- Browser library requires initialization: `rfbrowser init`
- Test results include: HTML reports, XML output, Playwright logs, screenshots

## Common Development Tasks
- **Add new test**: Create `.robot` file in `tests/` following existing patterns
- **Debug selectors**: Use `Get Element Count` to verify element presence before clicking
- **Handle dynamic content**: Use `Wait For Elements State` with appropriate timeouts
- **Custom keywords**: Add to `src/aiworkshop/` as Python functions, import as library

## VS Code Integration
- RobotCode extension configured (robocop disabled in `.vscode/settings.json`)
- Tests can be run via VS Code Robot Framework extension
- Use workspace-relative paths for file operations

## Key Files to Reference
- `tests/browser_test.robot`: Complex real-world browser automation example
- `tests/first.robot`: Simple test patterns and TodoMVC example
- `pyproject.toml`: Project configuration and dependencies
- `results/`: Contains test outputs, logs, and screenshots from latest run