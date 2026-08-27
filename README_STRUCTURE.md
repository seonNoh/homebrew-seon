# README and diagram structure

The repository publishes one README in each supported documentation language and four localized diagrams per README.

| Language | README | Diagram directory |
| --- | --- | --- |
| English | `README.md` | `docs/assets/en/` |
| Korean | `README.ko.md` | `docs/assets/ko/` |
| Japanese | `README.ja.md` | `docs/assets/ja/` |

Each directory contains the same four topics:

1. `install-flow.svg`
2. `platform-selection.svg`
3. `checksum-boundary.svg`
4. `maintenance-flow.svg`

The canonical pedia lookup key is the stable title `homebrew-seon-<language>-<topic>`. Existing pedia records must be updated by their stored ID. A timestamp or temporary suffix must never be used.

All diagrams are self-contained Relief SVG files. Each file includes its own styles, gradients, shadows, arrow markers, motion-reduction rule, and repository-specific ID prefix.
