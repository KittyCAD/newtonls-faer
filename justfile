clippy-flags := "--workspace --tests --benches --examples"

check-most:
    just lint
    just check-typos
    just test
    just fmt-check

lint:
    cargo clippy {{clippy-flags}} -- -D warnings

lint-fix:
    cargo clippy {{clippy-flags}} --fix -- -D warnings

check-typos:
    typos

test:
    cargo nextest run --all-features

# Run unit tests, output coverage to `lcov.info`.
test-with-coverage:
    cargo llvm-cov nextest --lcov --output-path lcov.info

fmt-check:
    cargo fmt --check
    cargo sort --check
    typos

