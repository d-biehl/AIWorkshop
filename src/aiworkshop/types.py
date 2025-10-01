from dataclasses import dataclass
from enum import Enum


@dataclass
class Movie:
    title: str
    year: int
    genre: str
    director: str
    description: str


@dataclass
class Customer:
    name: str
    age: int
    email: str
    phone: str
    address: str


class TestCaseOutcome(Enum):
    PASSED = "passed"
    FAILED = "failed"
    SKIPPED = "skipped"


@dataclass
class TestcaseResult:
    outcome: TestCaseOutcome
    message: str | None = None
