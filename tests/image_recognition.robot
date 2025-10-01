*** Settings ***
Variables       aiworkshop.data_helpers
Library         AIAgent.Agent    gpt-5


*** Test Cases ***
Image Recognition
    Chat    What is on this image?
    ...    ${ImageUrl("https://img.freepik.com/photos-premium/photo-detaillee-yeux-cameleon_129172-1206.jpg?w=360")}
    Chat    What is the color of the chameleon's eyes?

Image Description
    Chat
    ...    Describe this image in detail.
    ...    ${ImageUrl("https://www.flightradar24.com/blog/wp-content/uploads/2021/02/Updated-Flightradar24-Blog-Cover.jpg")}
    Chat    Can you describe the background of the image?

Local Image
    Chat    What is on this image?
    ...    ${load_binary_content("${CURDIR}/images/calulator.png", "image/png")}
    Chat    what buttons are on the calculator?
