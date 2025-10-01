from .types import TestCaseOutcome, TestcaseResult


def verify_testcase_result(result: TestcaseResult):
    """Verify the outcome of a test case and raise an assertion error if it failed."""
    if result.outcome == TestCaseOutcome.FAILED:
        raise AssertionError(f"Test case failed: {result.message}")
