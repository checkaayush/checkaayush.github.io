# checkaayush.github.io

My personal website, [checkaayush.com](https://checkaayush.com), and the LaTeX source for my resume.

## Layout

| Path | Purpose |
| --- | --- |
| `index.html` | The website (single page), served by GitHub Pages from `master` |
| `assets/` | Stylesheet, portrait and favicon |
| `resume/Resume_AayushSarva.tex` | Resume source (Jake's Resume template, single file) |
| `resume/Resume_AayushSarva.pdf` | Built resume, committed; the site links here |
| `resume/archives/` | Frozen snapshots of previous resumes (see `resume/archives/README.md`); never edit or overwrite |
| `.githooks/pre-commit` | Rebuilds and stages the PDF when the `.tex` is committed; blocks broken or multi-page builds |
| `.github/workflows/check-resume.yml` | CI backstop: the PDF is one page, the source builds, and both changed together |
| `_config.yml` | Keeps the `.tex`, archives, `Makefile` and this README off the live site |

## Setup

Requires Homebrew. Installs [Tectonic](https://tectonic-typesetting.github.io/), [watchexec](https://github.com/watchexec/watchexec) and poppler (`pdfinfo`), and enables the pre-commit hook:

```sh
make setup
```

## Updating the resume

1. Edit `resume/Resume_AayushSarva.tex`. Leave `make watch` running to rebuild `resume/Resume_AayushSarva.pdf` on save.
2. `git add resume/Resume_AayushSarva.tex && git commit`. The hook rebuilds the PDF, checks it is one page, and adds it to the commit. If the build fails, the commit is aborted.
3. `git push`. Pages redeploys and the site serves the new PDF.

## Commands

```sh
make pdf     # build resume/Resume_AayushSarva.pdf
make check   # build and fail unless it is exactly one page
make open    # build and open
make watch   # rebuild on save
make serve   # preview the site at http://localhost:8000
```

The first build downloads TeX packages and takes a minute; later builds take seconds.

## Notes

- Escape `&` as `\&` in the `.tex` source.
- Never copy `resume/Resume_AayushSarva.tex` over anything in `resume/archives/`; the archived `.tex` files keep commented-out bullets on purpose.
