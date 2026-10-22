# checkaayush.github.io

My personal website, [checkaayush.com](https://checkaayush.com), and the LaTeX source for my resume.

## Layout

| Path | Purpose |
| --- | --- |
| `index.html`, `images/`, `stylesheets/`, `me.svg`, `favicon.ico` | The website, served as-is by GitHub Pages |
| `Resume_AayushSarva.pdf` | Published resume, **built by CI**; don't edit or commit it by hand |
| `resume/AayushSarva.tex` | Resume source (Jake's Resume template, single file) |
| `resume/archives/` | Frozen snapshots of previous resumes (see `resume/archives/README.md`); never edit or overwrite |
| `.github/workflows/build-resume.yml` | Builds the PDF on push and commits it to the root |
| `_config.yml` | Keeps `resume/`, `Makefile` and this README off the live site |

## Updating the resume

1. Edit `resume/AayushSarva.tex`. Leave `make watch` running to preview at `build/AayushSarva.pdf`.
2. Commit and push to `master`.
3. CI rebuilds the PDF, commits `Resume_AayushSarva.pdf` and redeploys the site. Run `git pull` afterwards to pick up that commit.

The site links only to `Resume_AayushSarva.pdf`, and only CI writes it, so the website always serves the resume built from the latest `.tex`.

## Commands

Requires [Tectonic](https://tectonic-typesetting.github.io/) and [watchexec](https://github.com/watchexec/watchexec).

```sh
make setup   # one-time: brew install tectonic watchexec
make pdf     # -> build/AayushSarva.pdf
make open    # build and open
make watch   # rebuild on save
make serve   # preview the site at http://localhost:8000
```

The first build downloads TeX packages and takes a minute; later builds take seconds.

## Notes

- Escape `&` as `\&` in the `.tex` source.
- Never copy `resume/AayushSarva.tex` over anything in `resume/archives/`; the archived `.tex` files keep commented-out bullets on purpose.
