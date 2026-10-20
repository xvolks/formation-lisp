# Emacs Elisp Formation

Personal notes and exercises from an Elisp (Emacs Lisp) training session,
following Mike Zamansky's "Learning Elisp" videos
([YouTube channel](https://www.youtube.com/@mzamansky/videos)).

- **Dates:** 14/10/2026 – 20/10/2026
- **Tools:** Emacs, `lisp-interaction-mode`, the [Eros](https://github.com/fyency/eros) package (inline evaluation results)

## Files

| File | Based on | What it covers |
| --- | --- | --- |
| [`playground.el`](playground.el) | – | Elisp basics: variables, `defun`, `let`/`let*`, `mapcar`, `lambda`; a rot13/rot-N word & region rotator with keybindings; regular expressions (`search-forward-regexp`, the `rx` macro); built-in data structures (lists/cons, vectors, hash tables, dotted-pair lists with `assoc`) |
| [`emoji-replace.el`](emoji-replace.el) | Learning Elisp 11+ | A minor mode replacing `:emoji:` tags with the emoji itself — two strategies: real insertion vs. visual replacement via text properties, wired through `after-change-functions` hooks; `defcustom` |
| [`web-api.el`](web-api.el) | Learning Elisp 16+ | Calling a web API (dictionaryapi.com thesaurus): `url-retrieve-synchronously`, JSON parsing, interactive synonym replacement (`completing-read`), and a `zsyn-mode` minor mode (`C-c z`) |
| [`email.el`](email.el) | Learning Elisp 18 | Extracting email addresses from a document with `search-forward-regexp` and re-inserting them for copy/pasting afterwards |
| [`key.el`](key.el) | – | API keys, **git-ignored** — create your own locally, see below |

## Setup

Create a `key.el` file next to the others with your own API keys (it is listed in
[`.gitignore`](.gitignore) and must never be committed):

```elisp
(setq my-key "your-thesaurus-api-key")
(setq my-dict-key "your-dictionary-api-key")
```

Get keys at <https://dictionaryapi.com/products> for the `web-api.el` exercises.
