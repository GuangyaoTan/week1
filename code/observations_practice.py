
"""Load observation records and summarise them by site."""

import csv


def load_observations(path):
    """Read observation records from a CSV file."""
    with open(path, newline="", encoding="utf-8") as stream:
        return list(csv.DictReader(stream))


def parse_count(count_text):
    """Convert a count to an integer, or None for a missing count."""
    if not isinstance(count_text, str):
        raise ValueError("Count must be a string")

    if count_text == "":
        return None

    count = int(count_text)

    if count < 0:
        raise ValueError("Count cannot be negative")

    return count


def summarise_site(rows, site):
    """Return (known count total, missing count) for one site."""
    if not isinstance(rows, list):
        raise ValueError("Rows must be a list")

    if not isinstance(site, str) or not site:
        raise ValueError("Site must be a non-empty string")

    seen = set()
    total = 0
    missing = 0
    has_known_count = False

    for row in rows:
        if not isinstance(row, dict):
            raise ValueError("Each row must be a dictionary")

        if set(row) != {"site", "date", "count"}:
            raise ValueError("Invalid observation columns")

        if not all(isinstance(value, str) for value in row.values()):
            raise ValueError("Observation values must be strings")

        if not row["site"] or not row["date"]:
            raise ValueError("Site and date cannot be empty")

        count = parse_count(row["count"])

        key = (row["site"], row["date"], row["count"])

        if key in seen:
            continue

        seen.add(key)

        if row["site"] != site:
            continue

        if count is None:
            missing += 1
        else:
            total += count
            has_known_count = True

    return (total if has_known_count else None, missing)


def main():
    rows = load_observations("data/bootcamp_observations.csv")

    for site in sorted({row["site"] for row in rows}):
        print(f"{site}: {summarise_site(rows, site)}")


if __name__ == "__main__":
    main()
