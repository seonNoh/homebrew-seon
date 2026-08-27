#!/usr/bin/env python3
from __future__ import annotations

import re
import sys
from pathlib import Path


REQUIRED_FILES = (
    "README.md",
    "README.ko.md",
    "README.ja.md",
    "LICENSE",
    "CONTRIBUTING.md",
    ".editorconfig",
    ".gitignore",
    ".gitea/PULL_REQUEST_TEMPLATE.md",
    ".gitea/ISSUE_TEMPLATE/bug-report.yaml",
    ".gitea/ISSUE_TEMPLATE/feature-request.yaml",
    ".gitea/workflows/ci.yml",
    ".gitea/workflows/release.yml",
    "README_STRUCTURE.md",
    "Casks/seon.rb",
    "verify.py",
)

LANGUAGES = {
    "en": "README.md",
    "ko": "README.ko.md",
    "ja": "README.ja.md",
}

SVG_TOPICS = (
    "install-flow",
    "platform-selection",
    "checksum-boundary",
    "maintenance-flow",
)

EMOJI_PATTERN = re.compile(
    "["
    "\U0001F1E6-\U0001F1FF"
    "\U0001F300-\U0001FAFF"
    "\U00002600-\U000027BF"
    "]"
)

AI_SIGNATURE_PATTERNS = (
    re.compile("co-authored" + r"-by:.*(?:codex|anthropic|claude)", re.IGNORECASE),
    re.compile("generated" + r" with (?:codex|claude)", re.IGNORECASE),
)


def expected_svg_paths(root: Path) -> list[Path]:
    return [
        root / "docs" / "assets" / language / f"{topic}.svg"
        for language in LANGUAGES
        for topic in SVG_TOPICS
    ]


def validate_repository(root: Path) -> list[str]:
    errors: list[str] = []
    for relative_path in REQUIRED_FILES:
        if not (root / relative_path).is_file():
            errors.append(f"missing required file: {relative_path}")

    svg_paths = expected_svg_paths(root)
    existing_svg_paths = sorted((root / "docs" / "assets").glob("*/*.svg"))
    if len(existing_svg_paths) != 12:
        errors.append(f"expected 12 SVG files, found {len(existing_svg_paths)}")

    for svg_path in svg_paths:
        if not svg_path.is_file():
            errors.append(f"missing required SVG: {svg_path.relative_to(root)}")
            continue
        content = svg_path.read_text(encoding="utf-8")
        for token in ("viewBox=\"0 0 960 540\"", "<defs>", "prefers-reduced-motion", "markerWidth=\"6\""):
            if token not in content:
                errors.append(f"{svg_path.relative_to(root)} is missing {token}")

    for language, readme_name in LANGUAGES.items():
        readme_path = root / readme_name
        if not readme_path.is_file():
            continue
        content = readme_path.read_text(encoding="utf-8")
        for topic in SVG_TOPICS:
            expected_reference = f"docs/assets/{language}/{topic}.svg"
            if expected_reference not in content:
                errors.append(f"{readme_name} is missing diagram reference {expected_reference}")

    cask_path = root / "Casks" / "seon.rb"
    if cask_path.is_file():
        cask = cask_path.read_text(encoding="utf-8")
        for artifact in (
            "seon-darwin-amd64",
            "seon-darwin-arm64",
            "seon-linux-amd64",
            "seon-linux-arm64",
        ):
            if artifact not in cask:
                errors.append(f"Cask is missing platform artifact {artifact}")
        if cask.count('sha256 "') != 4:
            errors.append("Cask must contain exactly four SHA-256 digests")

    scanned_suffixes = {".md", ".py", ".rb", ".svg", ".yml", ".yaml"}
    for path in sorted(root.rglob("*")):
        if not path.is_file() or ".git" in path.parts or path.suffix not in scanned_suffixes:
            continue
        content = path.read_text(encoding="utf-8")
        if EMOJI_PATTERN.search(content):
            errors.append(f"emoji found in {path.relative_to(root)}")
        for pattern in AI_SIGNATURE_PATTERNS:
            if pattern.search(content):
                errors.append(f"AI signature found in {path.relative_to(root)}")

    return errors


def main() -> int:
    repository_root = Path(__file__).resolve().parent
    errors = validate_repository(repository_root)
    if errors:
        for error in errors:
            print(f"ERROR: {error}")
        return 1
    print("PASS: repository contract verified")
    return 0


if __name__ == "__main__":
    sys.exit(main())
