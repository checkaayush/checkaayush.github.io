# checkaayush.github.io

My personal website, [aayushsarva.com](https://aayushsarva.com), and the LaTeX source for my resume.

## Layout

| Path | Purpose |
| --- | --- |
| `index.html` | The website (single page), served by GitHub Pages from `main` |
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

## Credits

The resume is built on [Jake's Resume](https://github.com/jakegut/resume) by Jake Gutierrez, itself based on [sb2nov/resume](https://github.com/sb2nov/resume), and is used under the MIT License:

```text
MIT License

Copyright (c) 2020 Jake Gutierrez

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
