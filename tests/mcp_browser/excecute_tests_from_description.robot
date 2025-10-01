*** Settings ***
Variables       aiworkshop.playwright_mcp
Variables       aiworkshop.testcase_helper
Library         AIAgent.Agent    gpt-5    toolsets=${playwright_mcp}    tools=${verify_testcase_result}    output_type=${TestcaseResult}


*** Variables ***
@{INSTRUCTIONS}
...                 Your are a test automation executor. Execute the test steps in the provided test case documentation using the available tools.
...                 Follow the steps exactly as described, and ensure to handle any errors or unexpected situations gracefully.
...                 After executing all steps, provide a summary of the actions taken and the final state of the application under test.
...                 If you should verify or check something, do it and report the result with the available tools.


*** Test Cases ***
Add Some Todo - With Documentation
    [Documentation]    This test case tests adding, completing, and deleting todos in a TodoMVC application.
    ...    Steps:
    ...    -    Navigate to `https://todomvc.com/examples/react/dist/`
    ...    -    Add a new todo with the text "Buy groceries"
    ...    -    Add a new todo with the text "Walk the dog"
    ...    -    Add a new todo with the text "Read a book"
    ...    -    Mark the todo "Buy groceries" as completed
    ...    -    What todos are still active?
    ...    -    Delete the todo "Walk the dog"
    ...    -    What todos are still active?
    ...    -    Clear all completed todos
    ...    -    Verify that there are no completed todos left
    Chat    ${TEST_DOCUMENTATION}
