*** Settings ***
Variables   aiworkshop.playwright_mcp
Library     AIAgent.Agent    gpt-5    toolsets=${playwright_mcp}

*** Test Cases ***
Add Some Todo
    Chat  Navigate to `https://todomvc.com/examples/react/dist/`
    Chat  Add a new todo with the text "Buy groceries"
    Chat  Add a new todo with the text "Walk the dog"
    Chat  Mark the todo "Buy groceries" as completed
    Chat  What todos are still active?
    Chat  Delete the todo "Walk the dog"
    Chat  What todos are still active?
    Chat  Clear all completed todos
    Chat  What todos are still active?