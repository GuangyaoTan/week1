
"""Tests for observations_practice.py."""

from observations_practice import (
    load_observations,
    parse_count,
    summarise_site,
)


def expect_value_error(function, *args):
    """Confirm that invalid input raises ValueError."""
    try:
        function(*args)
    except ValueError:
        return

    raise AssertionError("Expected ValueError")


def main():
    assert parse_count("2") == 2
    assert parse_count("0") == 0
    assert parse_count("") is None

    for bad_count in ["-1", "many", 2]:
        expect_value_error(parse_count, bad_count)

    rows = load_observations("data/bootcamp_observations.csv")
    assert summarise_site(rows, "A") == (2, 1)
    assert summarise_site(rows, "B") == (0, 0)
    assert summarise_site(rows, "Z") == (None, 0)
    assert summarise_site([], "A") == (None, 0)

    boundary_rows = load_observations(
        "data/bootcamp_observations_boundary.csv"
    )
    assert summarise_site(boundary_rows, "C") == (None, 2)
    assert summarise_site(boundary_rows, "D") == (0, 0)

    extra_rows = [
        {"site": "E", "date": "2026-10-03", "count": "5"},
        {"site": "E", "date": "2026-10-03", "count": "5"},
        {"site": "E", "date": "2026-10-04", "count": ""},
        {"site": "E", "date": "2026-10-04", "count": ""},
        {"site": "E", "date": "2026-10-05", "count": "3"},
    ]
    assert summarise_site(extra_rows, "E") == (8, 1)

    invalid_rows = load_observations(
        "data/bootcamp_observations_invalid.csv"
    )

    for row in invalid_rows:
        expect_value_error(summarise_site, [row], "A")

    expect_value_error(
        summarise_site, rows + invalid_rows, "A"
    )

    expect_value_error(
        summarise_site, [{"site": "A", "count": "2"}], "A"
    )

    expect_value_error(
        summarise_site,
        [{"site": "A", "date": "2026-10-01",
          "count": "2", "extra": "x"}],
        "A",
    )

    expect_value_error(
        summarise_site,
        [{"site": "", "date": "2026-10-01", "count": "2"}],
        "A",
    )

    expect_value_error(
        summarise_site,
        [{"site": "A", "date": "", "count": "2"}],
        "A",
    )

    expect_value_error(
        summarise_site,
        [{"site": "A", "date": "2026-10-01", "count": 2}],
        "A",
    )

    expect_value_error(summarise_site, ["not a dictionary"], "A")
    expect_value_error(summarise_site, None, "A")
    expect_value_error(summarise_site, rows, "")
    expect_value_error(summarise_site, rows, 2)

    original_rows = [row.copy() for row in rows]
    summarise_site(rows, "A")
    assert rows == original_rows

    print("All observations tests passed.")


if __name__ == "__main__":
    main()
