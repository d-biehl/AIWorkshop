*** Settings ***
Library         AIAgent.Agent    gpt-5
Variables       aiworkshop.types


*** Test Cases ***
List of Scifi Movies
    ${result}    Chat    Give me a list of 5 popular science fiction movies released in the 1980s.
    ...    output_type=${{typing.List[typing.Tuple[str, ...]]}}
    Log Many    @{result}

List of Scifi Movies with Dataclass
    ${result}    Chat    Give me a list of 5 popular science fiction movies released in the 1980s.
    ...    output_type=${{typing.List[$Movie]}}
    FOR    ${movie}    IN    @{result}
        Log    ${movie.title} directed by ${movie.director} released in ${movie.year}
        Log    Description: ${movie.description}
    END

Generate Virtual Customer Data
    ${result}    Chat    Generate a list of 3 virtual customers with the following fields: name, email, age, and purchase history (a list of items they have purchased).
    ...    output_type=${{typing.List[$Customer]}}
    FOR    ${customer}    IN    @{result}
        Log    Name: ${customer.name}, Email: ${customer.email}, Age: ${customer.age}
    END