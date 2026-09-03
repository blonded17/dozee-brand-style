---
name: dozee-brand-style
description: Apply Dozee's brand visual identity (colors, fonts, shape language, logo) to every HTML artifact, dashboard, mockup, or report built for this user, by default, without being asked.
---

# Dozee Brand Style

This is Shubham's default visual style for anything visual built for him: HTML pages, dashboards, mockups, reports, one-pagers, prototypes. Apply it automatically to every such artifact **unless he explicitly asks for something unbranded**. When you use it, say so in one short line (e.g. "Styled with the Dozee brand system").

Tokens below were extracted directly from the live computed styles and shipped assets of https://dozeehealth.ai (checked September 2026: primary color class `bg-f_primary`/`text-f_primary` in the site's compiled Tailwind CSS, `@font-face` rules, button/panel `border-radius`, and the two logo PNGs actually served by the site). The dark-mode column is an original extension — Dozee's site has no native dark mode — designed to feel like the same brand at night, not an inverted light palette.

## 1. Color tokens

Use these as CSS custom properties on `:root`, with the dark block applied both via `prefers-color-scheme` and a `[data-theme="dark"]` override, per standard artifact dark-mode practice.

```css
:root {
  /* Dozee brand — light mode (source values from dozeehealth.ai) */
  --dozee-primary: #0055D2;        /* brand blue — site's own "f_primary" token */
  --dozee-accent-sky: #009BF7;     /* bright accent blue — gradient/icon highlights */
  --dozee-accent-indigo: #3861F6;  /* indigo — gradient end, secondary accent */
  --dozee-accent-teal: #36E9BA;    /* mint/teal — sparing highlight accent only */

  --dozee-bg: #FFFFFF;
  --dozee-surface: #F2F8FF;        /* light blue tint used for cards/panels on white */
  --dozee-text: #000000;
  --dozee-text-muted: #495566;
  --dozee-border: rgba(0, 85, 210, 0.14);

  --dozee-gradient: linear-gradient(103deg, #009BF7 0%, #3861F6 100%); /* stat/number callouts */

  --dozee-radius: 20px;
  --dozee-radius-sm: 12px;
  --dozee-shadow: none;            /* the live site uses NO drop shadows — flat, color-blocked design */

  --dozee-font: 'Poppins', 'Segoe UI', system-ui, -apple-system, sans-serif;
}

@media (prefers-color-scheme: dark) {
  :root:not([data-theme="light"]) { --dozee-dark: 1; }
}
:root:not([data-theme="light"]) {
  @media (prefers-color-scheme: dark) {
    --dozee-bg: #071633;              /* deep navy derived from the brand blue, never pure black */
    --dozee-surface: #0E2049;
    --dozee-text: #F3F7FF;
    --dozee-text-muted: #A9B8D6;
    --dozee-primary: #4C9DFF;         /* brightened — #0055D2 fails contrast on dark navy */
    --dozee-accent-sky: #33B4FF;
    --dozee-accent-indigo: #7C93FF;
    --dozee-accent-teal: #36E9BA;     /* unchanged — already vivid, reads well on navy */
    --dozee-border: rgba(255, 255, 255, 0.14);
    --dozee-gradient: linear-gradient(103deg, #33B4FF 0%, #7C93FF 100%);
    --dozee-shadow: 0 8px 30px rgba(0, 0, 0, 0.45); /* dark UIs need panel separation; the live site doesn't */
  }
}
:root[data-theme="dark"] {
  --dozee-bg: #071633;
  --dozee-surface: #0E2049;
  --dozee-text: #F3F7FF;
  --dozee-text-muted: #A9B8D6;
  --dozee-primary: #4C9DFF;
  --dozee-accent-sky: #33B4FF;
  --dozee-accent-indigo: #7C93FF;
  --dozee-accent-teal: #36E9BA;
  --dozee-border: rgba(255, 255, 255, 0.14);
  --dozee-gradient: linear-gradient(103deg, #33B4FF 0%, #7C93FF 100%);
  --dozee-shadow: 0 8px 30px rgba(0, 0, 0, 0.45);
}
```

(Write actual artifact CSS with the real nested `@media`/`[data-theme]` structure used elsewhere for artifacts — the block above is condensed for readability. The rule to preserve: every dark-mode token gets its own real value, never `filter: invert()` or reused light values.)

Use `--dozee-accent-teal` sparingly — a small highlight bar, a single badge, one accent dot. It is not a secondary primary color on the live site; it appears once per screen as a flourish.

## 2. Typography

Brand font is **Poppins** (self-hosted by the site via `next/font`, originating from Google Fonts), weights 400/500/600/700/800. Load it with:

```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">
```

Fallback stack: `'Poppins', 'Segoe UI', system-ui, -apple-system, sans-serif` (same family for headings and body — the site does not switch families).

- Headings: Poppins 600–700, tight-ish tracking, sentence or title case (the site itself uses uppercase for nav/hero labels but that's a hero-specific choice, not a rule — don't force all-caps everywhere).
- Body: Poppins 400–500.
- Big stat numbers / KPIs: Poppins 700–800 with the gradient text fill below — this is a distinctive, real pattern from the site (their homepage stat counters use it), not an invention.

```css
.dozee-stat {
  background: var(--dozee-gradient);
  -webkit-background-clip: text;
  background-clip: text;
  -webkit-text-fill-color: transparent;
  color: transparent;
  font-weight: 800;
}
```

## 3. Shape language

The signature Dozee shape is a **large rounded panel/button with exactly one corner left square** — verified on both the header CTA button and a homepage stat panel (their actual computed `border-radius` values only round three of the four corners). Use it as an accent on hero-level elements (primary buttons, feature panels, the top of a card stack) — not on every small element; dense UI (tables, chips, form fields) can just use `--dozee-radius-sm` fully rounded.

```css
.dozee-corner-br { border-radius: var(--dozee-radius) var(--dozee-radius) 0 var(--dozee-radius); }   /* square bottom-right — buttons */
.dozee-corner-bl { border-radius: var(--dozee-radius) var(--dozee-radius) var(--dozee-radius) 0; }   /* square bottom-left — panels */
.dozee-rounded   { border-radius: var(--dozee-radius); }                                              /* plain fallback */
```

No drop shadows in light mode (`--dozee-shadow: none`) — the live site relies on flat color blocking, not elevation, for hierarchy. In dark mode a subtle shadow (already in the tokens) is fine since dark surfaces need it to read as separate from the page background.

## 4. Logo

Two exact PNG assets pulled from the live site's own `_next/static/media` bundle (not redrawn), each is the "d" mark + "dozee" wordmark lockup on a transparent background:

- **White version** (112×100 px, ~1.12:1) — for dark/blue backgrounds and dark mode.
- **Blue version** (100×90 px, ~1.11:1, brand blue #0055D2) — for light backgrounds and light mode.

Embed both as data URIs (required — external image hosts are blocked in published artifacts) and swap by theme:

```html
<a href="https://dozeehealth.ai" target="_blank" rel="noopener" class="dozee-mark" aria-label="Dozee">
  <img class="dozee-mark-light" src="data:image/png;base64,PASTE_BLUE_LOGO_BASE64" alt="Dozee" height="28">
  <img class="dozee-mark-dark"  src="data:image/png;base64,PASTE_WHITE_LOGO_BASE64" alt="Dozee" height="28">
</a>
```

```css
.dozee-mark { position: fixed; top: 16px; left: 16px; z-index: 1000; display: inline-flex; line-height: 0; }
.dozee-mark img { height: 28px; width: auto; display: block; }
.dozee-mark-dark { display: none; }
:root[data-theme="dark"] .dozee-mark-light,
:root:not([data-theme="light"]) .dozee-mark-dark { display: none; }
@media (prefers-color-scheme: dark) {
  :root:not([data-theme="light"]) .dozee-mark-light { display: none; }
  :root:not([data-theme="light"]) .dozee-mark-dark { display: inline; }
}
:root[data-theme="dark"] .dozee-mark-dark { display: inline; }
```

Base64 payloads (exact, decoded and pixel-verified — 112×100 RGBA and 100×90 RGBA respectively):

**Blue logo (light backgrounds) — `dozee-logo-blue.png`, 100×90:**
```
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
```

**White logo (dark backgrounds / dark mode) — `dozee-logo-white.png`, 112×100:**
```
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
```

## 5. How to apply

For every HTML artifact, dashboard, mockup, or report built for Shubham, unless he asks for something unbranded:

1. Inline the Google Fonts `<link>` tags for Poppins.
2. Define the full light + dark CSS custom property block on `:root` (section 1), matching whatever dark-mode pattern the current artifact platform expects (`prefers-color-scheme` + `[data-theme]` override).
3. Build the page's colors, buttons, and text off the `--dozee-*` variables — never hardcode a hex value inline.
4. Use `.dozee-corner-br` / `.dozee-corner-bl` on at least the primary CTA and one hero panel, to keep the signature look recognizable; plain `--dozee-radius`/`--dozee-radius-sm` elsewhere.
5. Place the logo lockup (section 4) fixed top-left, ~28px tall, 16px margin, linking to `https://dozeehealth.ai`, theme-swapped automatically.
6. Tell Shubham in one short line that the Dozee brand system was applied — don't ask permission each time, just flag it.

If he ever explicitly asks for an unbranded page, skip all of the above for that one artifact.
