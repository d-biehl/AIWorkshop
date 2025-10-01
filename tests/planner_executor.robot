*** Settings ***
Library     AIAgent.Agent    gpt-5    instructions=${INSTRUCTIONS_PLANNER}    AS    Planner
Library     AIAgent.Agent    gpt-5    instructions=${INSTRUCTIONS_EXECUTOR}    AS    Executor


*** Variables ***
@{INSTRUCTIONS_PLANNER}     You are a planner agent. You should create a plan to achieve the given goal. Break it down into simple steps.
@{INSTRUCTIONS_EXECUTOR}    You are an executor agent. You should carry out the actions proposed by the planner.
...                         There are no real devices or so, so you can only simulate the actions.


*** Test Cases ***
Plan And Do (Loop)
    ${Plan}    Set Variable    ${{ dataclasses.make_dataclass('Plan', [('action', str), ('arg', str)]) }}
    FOR    ${i}    IN RANGE    3
        ${step}    Planner.Chat
        ...    Propose the next action as a tuple (action, arg). Keep it simple.
        ...    Examples: Click(#submit), Assert("Logged in").
        ...    Return only the action and arg.
        ...    output_type=${Plan}

        ${result}    Executor.Chat
        ...    Execute: ${step.action} ${step.arg}
        ...    Respond with a brief status line.

        # Optionally break on success keyword in ${result}
    END
