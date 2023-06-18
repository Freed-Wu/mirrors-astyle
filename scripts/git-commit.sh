#!/usr/bin/env bash
cd "$(dirname "$(readlink -f "$0")")/.." || exit 1

pip install pre-commit-mirror-maker
git config --global user.name 'Github Actions'
git config --global user.email '41898282+github-actions[bot]@users.noreply.github.com'
pre-commit-mirror . --language=python --package-name=astyle --id=astyle --entry='astyle --options=none' --types-or c++ --types-or c --types-or 'c#' --types-or cuda --types-or java --types-or objective-c
git remote set-url origin "https://x-access-token:$GITHUB_TOKEN@github.com/$GITHUB_REPOSITORY"
git push origin HEAD:refs/heads/main --tags
