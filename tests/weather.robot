*** Settings ***
Variables       aiworkshop.weather
# Variables    aiworkshop.models
# Library    AIAgent.Agent    ${openai_gpt5}
# Library    AIAgent.Agent    gpt-5    tools=${temperature_celsius}
Library         AIAgent.Agent    gpt-5    tools=${temperature_tools}


*** Variables ***
@{temperature_tools}
...                     ${{$temperature_celsius}}
...                     ${{$temperature_fahrenheit}}


*** Test Cases ***
Weather in Berlin
    Chat    How is the weather in Berlin?

What is the temperature in diffent cities
    Chat    Can you tell me the temperature in New York, London and Tokyo?

What is the temperature in fahrenheit
    Chat    Can you tell me the temperature in New York, London and Tokyo in Fahrenheit?

Error handling
    Chat    Can you tell me the temperature in Atlantis in Celsius?
