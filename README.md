# Emacs Elisp Formation

Personal notes and exercises from an Elisp (Emacs Lisp) training session,
following Mike Zamansky's "Learning Elisp" videos
([YouTube channel](https://www.youtube.com/@mzamansky/videos)).

- **Dates:** 14/10/2026 – 20/10/2026
- **Tools:** Emacs, `lisp-interaction-mode`, the [Eros](https://github.com/fyency/eros) package (inline evaluation results)

## Files

| File | Based on | What it covers |
| --- | --- | --- |
| [`playground.el`](playground.el) | [Episode 1](https://www.youtube.com/watch?v=x9Qws7ZOksc) | Elisp basics: variables, `defun`, `let`/`let*`, `mapcar`, `lambda`; a rot13/rot-N word & region rotator with keybindings; regular expressions (`search-forward-regexp`, the `rx` macro); built-in data structures (lists/cons, vectors, hash tables, dotted-pair lists with `assoc`) |
| [`emoji-replace.el`](emoji-replace.el) | [Learning Elisp 11+](https://www.youtube.com/watch?v=DvFjCVHpoyk) | A minor mode replacing `:emoji:` tags with the emoji itself — two strategies: real insertion vs. visual replacement via text properties, wired through `after-change-functions` hooks; `defcustom` |
| [`web-api.el`](web-api.el) | [Learning Elisp 16+](https://www.youtube.com/watch?v=tGZNhJmZ_2M) | Calling a web API (dictionaryapi.com thesaurus): `url-retrieve-synchronously`, JSON parsing, interactive synonym replacement (`completing-read`), and a `zsyn-mode` minor mode (`C-c z`) |
| [`email.el`](email.el) | [Learning Elisp 18](https://www.youtube.com/watch?v=o2z9SKNVCwk) | Extracting email addresses from a document with `search-forward-regexp` and re-inserting them for copy/pasting afterwards |
| [`key.el`](key.el) | – | API keys, **git-ignored** — create your own locally, see below |

## Setup

Create a `key.el` file next to the others with your own API keys (it is listed in
[`.gitignore`](.gitignore) and must never be committed):

```elisp
(setq my-key "your-thesaurus-api-key")
(setq my-dict-key "your-dictionary-api-key")
```

Get keys at <https://dictionaryapi.com/products> for the `web-api.el` exercises.

README.me file written with the help of [Opencode](https://opencode.ai), [oMLX](https://omlx.ai) and local model [Qwen3.8](https://huggingface.co/lmstudio-community/Qwen3.8-27B-MLX-6bit).

---

# Formation Emacs Elisp (version française)

Notes personnelles et exercices issus d'une formation en Elisp (Emacs Lisp),
suivie d'après les vidéos "Learning Elisp" de Mike Zamansky
([chaîne YouTube](https://www.youtube.com/@mzamansky/videos)).

- **Dates :** 14/10/2026 – 20/10/2026
- **Outils :** Emacs, `lisp-interaction-mode`, le package [Eros](https://github.com/fyency/eros) (résultats d'évaluation affichés inline)

## Fichiers

| Fichier | D'après | Ce qu'il couvre |
| --- | --- | --- |
| [`playground.el`](playground.el) | [Episode 1](https://www.youtube.com/watch?v=x9Qws7ZOksc) | Les bases de l'Elisp : variables, `defun`, `let`/`let*`, `mapcar`, `lambda` ; un rotateur rot13/rot-N sur mot et région, avec raccourcis clavier ; les expressions régulières (`search-forward-regexp`, la macro `rx`) ; les structures de données intégrées (listes/cons, vecteurs, tables de hachage, listes de paires pointées avec `assoc`) |
| [`emoji-replace.el`](emoji-replace.el) | [Learning Elisp 11+](https://www.youtube.com/watch?v=DvFjCVHpoyk) | Un mode mineur remplaçant les tags `:emoji:` par l'emoji lui-même — deux stratégies : insertion réelle vs. remplacement visuel via les propriétés de texte, câblé sur les hooks `after-change-functions` ; `defcustom` |
| [`web-api.el`](web-api.el) | [Learning Elisp 16+](https://www.youtube.com/watch?v=tGZNhJmZ_2M) | Appels à une API web (thésaurus dictionaryapi.com) : `url-retrieve-synchronously`, analyse JSON, remplacement interactif d'un mot par un synonyme (`completing-read`), et le mode mineur `zsyn-mode` (`C-c z`) |
| [`email.el`](email.el) | [Learning Elisp 18](https://www.youtube.com/watch?v=o2z9SKNVCwk) | Extraction des adresses e-mail d'un document avec `search-forward-regexp` et réinsertion pour copie/coller par la suite |
| [`key.el`](key.el) | – | Clés API, **ignoré par git** — à créer localement, voir ci-dessous |

## Installation

Créer un fichier `key.el` à côté des autres, contenant ses propres clés API (il figure dans
[`.gitignore`](.gitignore) et ne doit jamais être commité) :

```elisp
(setq my-key "votre-cle-api-thesaurus")
(setq my-dict-key "votre-cle-api-dictionnaire")
```

Les clés s'obtiennent sur <https://dictionaryapi.com/products> pour les exercices de `web-api.el`.

Fichier README.me co-écrit avec [Opencode](https://opencode.ai), [oMLX](https://omlx.ai) et [Qwen3.8](https://huggingface.co/lmstudio-community/Qwen3.8-27B-MLX-6bit) en local.
