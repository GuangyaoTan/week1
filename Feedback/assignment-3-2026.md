# Assignment 3 formative feedback

This feedback is organised using the [Computing Bootcamp rubric](https://mulquabio.github.io/MQB/rubrics/Computing_Bootcamp_Rubric.html). It does not award a mark; use it to decide what to revise and check before final submission.

## Criterion 1: Repository organisation & workflow discipline

- Your root README provides Assignment 3 commands and output paths. Required files are present, supplied inputs match the supplied versions, and no generated results are tracked. The ignore rules and descriptive commits support a reproducible workflow.

## Criterion 2: Code completeness & functional correctness

- The fixed and generalised tree-height programs both ran and generated their respective CSVs. Separate comparison with the expected outputs found that each satisfied the tree-height required output format and values. These are distinct successes; neither establishes that the required callable function is available.

## Criterion 3: Code quality & style

As you revise, keep names descriptive, use comments to explain decisions rather than restating code, and avoid repeating the same calculation in several places.

## Criterion 4: Documentation

Give exact commands in the root `README.md`, together with each script’s input and output files, so that another student could repeat your checks.

## Criterion 5: Version-control practice

Commit each functional revision with a short message that says what changed; this makes your development easier to follow than one large final commit.

## Criterion 8: Basic error-handling & input validation

Test an ordinary case and an invalid case for each tree-height route, and confirm both the message shown and whether an output file was created or changed.

## Criterion 9: Problem-solving approach & method implementation

- Your Pound Hill program ran, and its CSV had the expected rows, plot identifiers and richness values. Your code shows a clear route from metadata-supported treatment of blanks, through species presence and quadrat richness, to plot-level means. The section headings and comments explain important choices, including why quadrat labels alone are not unique.
- The automated check only confirmed that the PDF existed. When I opened the figure, I also found readable axes, plot-level values, treatment means and an explanatory legend. Your written interpretation appropriately distinguishes descriptive differences from evidence of causation.
- Before final submission, **Provide the required tree-height function interface.** The interface test wrote the fixed CSV and then stopped with `object 'TreeHeight' not found`. Your code confirms that `code/TreeHeight.R` calculates heights directly but does not define `TreeHeight`. Correct CSV output therefore does not yet complete the route from individual measurements to a reusable calculation. Define the required function with the angle in degrees as its first input and horizontal distance as its second. Try the taught example call and compare its result with a direct calculation, checking the degree-to-radian conversion and argument order.
- Before final submission, **Make your independent height check reproducible.** Your README says you checked the first tree’s height, but does not show how that check was made independently of the scripts. Briefly record the chosen measurements, units, calculation method and comparison with the generated row. This will make your reasoning visible rather than leaving the reader with only a reported result.

## Criterion 10: Learning progression demonstration

Use this feedback as a revision checklist. Make the changes in small, descriptive commits, then add a short README note explaining what you changed and how you checked it. This will make your development from this formative checkpoint visible in the final portfolio.

## Priorities before final submission

- After repairing the interface, rerun the taught function example and both tree-height programs separately from the directory containing `code/`, `data/` and the root `README.md`.
- Rerun one ordinary and one invalid case for each tree-height route. The invalid-input tests run for this feedback stopped with useful distance-related errors, and your code places validation before output writing. Confirm that your revised programs still report the intended problem and produce no new result for invalid input; use temporary test copies rather than changing supplied data.
- Regenerate the Pound Hill table and PDF, then trace one plotted point back to its plot mean and underlying quadrat richness values. Check that the regenerated labels, values and interpretation remain consistent.
- Add the reproducible height check and function usage example to the README, then commit the revision descriptively without generated results.
