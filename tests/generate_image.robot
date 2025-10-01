*** Settings ***
Variables   aiworkshop.image_tool
Library   AIAgent.Agent   gpt-5   toolsets=${genimage_toolset}

*** Test Cases ***
Generate an image of a cat
    Chat   Generate an image of a cat with a hat

Generate 3 images
    Chat   Generate 3 images of a futuristic cityscape at sunset
