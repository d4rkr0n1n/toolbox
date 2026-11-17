---
name: ui-ux
description: Improve the clarity and consistency of interactive terminal utilities.
---

# UI/UX

Use `pwsh/choco/ChocoSearch.ps1` as the CLI presentation reference:

- Start with a simple bordered title using `Write-Host` colors.
- Separate the title, prompt, status message, command output, and exit prompt
  with blank lines.
- Use yellow for input prompts, dark gray for progress text, cyan for headings,
  and green for successful completion or exit prompts.
- Add exactly one relevant emoji to each user-facing status or prompt line.
  Keep emoji usage consistent and professional; do not decorate raw command
  output or error details excessively.
- State the active operation, such as `Searching Chocolatey for '<name>'...`.
- Keep prompts explicit and use `-NoNewline` when the user types on the same
  line.
- Preserve command behavior while improving presentation.
- Report actionable errors instead of failing silently.
