*** Settings ***
Library    aiworkshop
Library    Browser

*** Test Cases ***
first
    Hello From Library    Robot Framework

TodoMVC Browser Test
    [Documentation]    Open the TodoMVC React demo, add three todos, mark two done, and assert remaining count
    New Browser    chromium    headless=False    slowMo=500ms

    New Context    viewport={'width': 1280, 'height': 800}
    New Page    https://todomvc.com/examples/react/dist/
    Wait For Elements State    css=input[placeholder="What needs to be done?"]    visible    5s

    # Add three todos
    Fill Text    css=input[placeholder="What needs to be done?"]    Buy milk
    Press Keys    css=input[placeholder="What needs to be done?"]    Enter
    Fill Text    css=input[placeholder="What needs to be done?"]    Walk dog
    Press Keys    css=input[placeholder="What needs to be done?"]    Enter
    Fill Text    css=input[placeholder="What needs to be done?"]    Pay bills
    Press Keys    css=input[placeholder="What needs to be done?"]    Enter

    # Mark two todos done
    Click    css=li:has-text("Buy milk") input[type="checkbox"]
    Click    css=li:has-text("Walk dog") input[type="checkbox"]

    # Verify remaining count is 1
    ${count_text}=    Get Text    css=.todo-count
    Should Contain    ${count_text}    1 item left

    Close Browser


failed test
    Fail    This test is designed to fail