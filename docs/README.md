# Perch project website

This directory is the actual source of the standalone
[Perch website](https://echoz.github.io/Perch/): [index.html](index.html),
[styles.css](styles.css), five WebP renders and [.nojekyll](.nojekyll). The page
introduces the dock, shows the sculpted form and links to the tagged print
candidate and editable CAD. It has no application backend or JavaScript build.

## Preview and edit

From the repository root:

```sh
python3 -m http.server 8773 --bind 127.0.0.1 --directory docs
```

Open `http://127.0.0.1:8773/`. The server exposes this directory only. Stop it
when finished. GitHub Pages is configured to publish `main` at `/docs`; this
local guide does not authorize a deployment. Keep `.nojekyll` and relative asset
links so the site works under the `/Perch/` project path.

The visual theme uses warm cream, sage and coral with rounded shapes. Keep styles
in `styles.css` and use actual CAD renders. Preserve responsive layouts,
descriptive image text and visible keyboard focus. Device shapes in renders are
illustrative; the page must retain accurate print-candidate and physical-fit
labels from the [CAD guide](../cad/README.md).

## Downloads and verification

Download links point to the immutable `w01-candidate` release and its matching CAD
archive. Keep the license and scope notices beside downloads; the design license does not
cover the HTML/CSS implementation. See [license scope](../LICENSE-SCOPE.md).

After changing HTML, CSS or assets, preview phone and desktop layouts, keyboard
navigation, images and download links. After an authorized deployment, verify
the live Pages result separately. Run `sh scripts/check_documentation.sh` from
the repository root for this README's local Markdown links. That gate does not
inspect HTML destinations, responsive behavior, remote downloads or deployment.
No website layout or deployment check is implied by a documentation-only change.
