*** Settings ***
Library     AIAgent.Agent    openai:gpt-5-nano    AS    Author
Library     AIAgent.Agent    anthropic:claude-sonnet-4-0
...             output_type=${{ dataclasses.make_dataclass('Review', [('ok', bool), ('edits', str), ('reason', str)]) }}
...         AS    Reviewer


*** Test Cases ***
Draft And Review
    ${draft}    Author.Chat    Write a 3-sentence product update note for a fictional product.
    ${r}    Reviewer.Chat    Review for clarity and tone. If not ok, propose edits.    ${draft}
    IF    not ${r.ok}
        ${draft}    Author.Chat    Apply these edits: ${r.edits}
    END
