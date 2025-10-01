*** Settings ***
Variables       aiworkshop.playwright_mcp
Variables       aiworkshop.types
# Library         AIAgent.Agent    gpt-5    toolsets=${playwright_mcp}
Library         AIAgent.Agent    anthropic:claude-sonnet-4-5    toolsets=${playwright_mcp}
Test Setup      Chat    Navigate to `https://todomvc.com/examples/react/dist/`


*** Test Cases ***
Add Some Todo
    Chat    Add a new todo with the text "Buy groceries"
    Chat    Add a new todo with the text "Walk the dog"
    Chat    Mark the todo "Buy groceries" as completed
    Chat    What todos are still active?
    Chat    Delete the todo "Walk the dog"
    Chat    What todos are still active?
    Chat    Clear all completed todos
    Chat    What todos are still active?

Add Some Todo - With Documentation
    [Documentation]    This test case demonstrates adding, completing, and deleting todos in a TodoMVC application.
    ...    Steps:
    ...    -    Add a new todo with the text "Buy groceries"
    ...    -    Add a new todo with the text "Walk the dog"
    ...    -    Add a new todo with the text "Read a book"
    ...    -    Mark the todo "Buy groceries" as completed
    ...    -    What todos are still active?
    ...    -    Delete the todo "Walk the dog"
    ...    -    What todos are still active?
    ...    -    Clear all completed todos
    ...    -    There should be no completed todos left
    ...    -    Verify that there are no uncompleted todos left
    ${result}    Chat    Execute This Test Case
    ...    ${TEST_DOCUMENTATION}
    ...    output_type=${TestcaseResult}

    IF    $result.outcome == $TestCaseOutcome.FAILED
        Fail    Test case failed: ${result.message}
    END