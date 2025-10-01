from pydantic_ai.models.openai import OpenAIChatModel
from pydantic_ai.providers.github import GitHubProvider

__all__ = ["openai_gpt5"]

openai_gpt5 = OpenAIChatModel(
    "openai/gpt-5",  # GitHub Models uses prefixed model names
    provider=GitHubProvider(),
)
