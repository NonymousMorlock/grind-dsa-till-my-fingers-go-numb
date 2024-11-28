def expect(actual, expected):
    """
    This function is used to compare the actual result with the expected result.

    :param actual:
    :param expected:
    :return:
    """
    assert actual == expected, f"Test failed: expected {expected}, got {actual}"
    print(f"Test passed: expected {expected}, got {actual}")
