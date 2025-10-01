*** Settings ***
# Variables    aiworkshop.models
# Library    AIAgent.Agent    ${openai_gpt5}
Library     AIAgent.Agent    gpt-5


*** Test Cases ***
Who are you
    Chat    Who are you?
