def temperature_celsius(city: str) -> float:
    """Get the current temperature in Celsius for a given city."""
    if city.lower() == "london":
        return 15.0
    elif city.lower() == "new york":
        return 22.0
    elif city.lower() == "san francisco":
        return 18.0
    elif city.lower() == "tokyo":
        return 20.0
    elif city.lower() == "sydney":
        return 25.0
    elif city.lower() == "berlin":
        return 25.0
    else:
        return -2.0

def temperature_fahrenheit(city: str) -> float:
    """Get the current temperature in Fahrenheit for a given city."""
    if city.lower() == "london":
        return 15.0
    elif city.lower() == "new york":
        return 22.0
    elif city.lower() == "san francisco":
        return 18.0
    elif city.lower() == "tokyo":
        return 20.0
    elif city.lower() == "sydney":
        return 25.0
    elif city.lower() == "berlin":
        return 25.0
    else:
        return -2.0
