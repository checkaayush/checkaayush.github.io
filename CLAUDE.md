# Agent guide

Two modules share this repo: the **site** (`index.html`, `assets/`) and the **resume** (`resume/`). `README.md` maps the layout and lists the `make` targets; read it before your first change.

## Site

- `index.html` is the whole site: one hand-written page, one stylesheet, no build step, no JavaScript framework. Icons are inline SVG; fonts come from Google Fonts. Keep it that way rather than adding a CDN or dependency.
- After any change to `assets/style.css`, bump the `?v=N` on its `<link>` in `index.html` so browsers drop the cached copy.
- Verify every visual change at desktop width and below 640px, in light and dark mode (`make serve`). Tap targets stay at least 44px on mobile.
- External links open in a new tab with `target="_blank" rel="noopener noreferrer"`, the arrow SVG and a `<span class="sr-only"> (opens in a new tab)</span>`; copy an existing `.talk` link.
- Strip EXIF metadata from any image before committing it.
- A new top-level file that isn't part of the site goes in `_config.yml`'s `exclude` list.

## Resume

- Edit only `resume/Resume_AayushSarva.tex`. The PDF is a build output: the pre-commit hook rebuilds and stages it, so never hand-edit or separately regenerate it into a commit. If `core.hooksPath` isn't `.githooks`, run `make setup`.
- All vertical spacing lives in the lengths under `SPACING` in the `.tex` preamble, applied by the list and heading settings; the page centres itself vertically. Change spacing there, never with `\vspace` or `\\[..]` in the content, and use the existing `\resume...` commands for new entries.
- The resume is exactly one page. Run `make check` after every edit; when a change overflows, tighten wording rather than shrinking margins or font size.
- Write bullets as outcomes and ownership, not duties, and keep figures defensible.
- `resume/archives/` is frozen. To retire the current resume, copy it into a new `archives/<layout>-<YYYY-MM>/` folder and add an entry to `archives/README.md`; never edit an existing snapshot.

## Keep the modules in sync

The site and resume describe the same career. When you change a role, result, talk or link in one, make the matching change in the other in the same commit, or say why not. Talks link to the same LinkedIn posts in both.

## Commits

Imperative subject under ~60 characters that names the user-visible change ("Give the desktop layout more room"). Body wrapped at 72 columns explaining what changed and why, in plain prose. One logical change per commit.
