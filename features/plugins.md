# Plugins syntax support

Currently support syntax of the following plugins.

### Future CSS Syntax

* [`postcss-color-function`] supports functions to transform colors. :heavy_check_mark:
* [`postcss-color-gray`] supports the `gray()` function. :heavy_check_mark:
* [`postcss-color-hex-alpha`] supports `#rrggbbaa` and `#rgba` notation. :heavy_check_mark:
* [`postcss-color-hwb`] transforms `hwb()` to widely compatible `rgb()`. :heavy_check_mark:
* [`postcss-color-rebeccapurple`] supports the `rebeccapurple` color. :heavy_check_mark:
* [`postcss-conic-gradient`] supports the `conic-gradient` background. :heavy_check_mark:
* [`postcss-custom-media`] supports custom aliases for media queries. :heavy_check_mark:
* [`postcss-custom-properties`] supports variables, using syntax from :heavy_check_mark:
  the W3C Custom Properties.
* [`postcss-custom-selectors`] adds custom aliases for selectors. :heavy_check_mark:
* [`postcss-extend`] supports spec-approximate `@extend` for rules
  and placeholders, recursively.
* [`postcss-font-variant`] transpiles human-readable `font-variant`
  to more widely supported CSS. :heavy_check_mark:
* [`postcss-host`] makes the Shadow DOM’s `:host` selector work properly
  with pseudo-classes. :heavy_check_mark:
* [`postcss-initial`] supports `initial` keyword and `all: initial`
  to clean inherit styles. :heavy_check_mark:
* [`postcss-logical-properties`] transforms `start` and `end` properties to `left` and `right` depending on the writing direction of the document. :heavy_check_mark:
* [`postcss-media-minmax`] adds `<=` and `=>` statements to media queries.
* [`postcss-pseudo-class-any-link`] adds `:any-link` pseudo-class. :heavy_check_mark:
* [`postcss-selector-not`] transforms CSS4 `:not()` to CSS3 `:not()`. :heavy_check_mark:
* [`postcss-selector-matches`] transforms CSS4 `:matches()`
  to more compatible CSS. :heavy_check_mark:
* [`postcss-apply`] supports custom properties sets references :heavy_check_mark:
* [`mq4-hover-shim`] supports the `@media (hover)` feature.

### Fallbacks

* [`postcss-color-rgba-fallback`] transforms `rgba()` to hexadecimal. :heavy_check_mark:
* [`postcss-epub`] adds the `-epub-` prefix to relevant properties.
* [`postcss-fallback`] adds `fallback` function to avoid duplicate declarations. :heavy_check_mark:
* [`postcss-mqwidth-to-class`] converts min/max-width media queries to classes. :heavy_check_mark:
* [`postcss-opacity`] adds opacity filter for IE8. :heavy_check_mark:
* [`postcss-pseudoelements`] Convert `::` selectors into `:` selectors
  for IE 8 compatibility. :heavy_check_mark:
* [`postcss-round-subpixels`] plugin that rounds sub-pixel values to the nearest
  full pixel. :heavy_check_mark:
* [`postcss-unmq`] removes media queries while preserving desktop rules for IE≤8. :heavy_check_mark:
* [`postcss-vmin`] generates `vm` fallback for `vmin` unit in IE9. :heavy_check_mark:
* [`postcss-will-change`] inserts 3D hack before `will-change` property. :heavy_check_mark:
* [`autoprefixer`] adds vendor prefixes for you, using data from Can I Use. :heavy_check_mark:
* [`cssgrace`] provides various helpers and transpiles CSS 3 for IE
  and other old browsers. :heavy_check_mark:
* [`pixrem`] generates pixel fallbacks for `rem` units. :heavy_check_mark:

### Language Extensions

* [`postcss-atroot`] place rules directly at the root node.
* [`postcss-bem`] adds at-rules for BEM and SUIT style classes.
* [`postcss-conditionals`] adds `@if` statements.
* [`postcss-css-variables`] supports variables for selectors, and at-rules
  using W3C similar syntax.
* [`postcss-define-property`] to define properties shortcut.
* [`postcss-each`] adds `@each` statement.
* [`postcss-for`] adds `@for` loops.
* [`postcss-at-rules-variables`] adds support for custom properties in
  `@for`, `@each`, `@if`, etc.
* [`postcss-functions`] enables exposure of JavaScript functions.
* [`postcss-local-constants`] adds support for localized constants.
* [`postcss-map`] enables configuration maps.
* [`postcss-match`] adds `@match` for [Rust-style pattern matching].
* [`postcss-mixins`] enables mixins more powerful than Sass’,
  defined within stylesheets or in JS.
* [`postcss-media-variables`] adds support for `var()` and `calc()`
  in `@media` rules
* [`postcss-modular-scale`] adds a modular scale `ms()` function.
* [`postcss-nested`] unwraps nested rules.
* [`postcss-nested-props`] unwraps nested properties.
* [`postcss-nested-vars`] supports nested Sass-style variables.
* [`postcss-pseudo-class-enter`] transforms `:enter` into `:hover` and `:focus`.
* [`postcss-quantity-queries`] enables quantity queries.
* [`postcss-reverse-media`] reverse/Invert media query parameters.
* [`postcss-sassy-mixins`] enables mixins with Sass keywords.
* [`postcss-simple-extend`] lightweight extending of silent classes,
  like Sass’ `@extend`.
* [`postcss-simple-vars`] supports for Sass-style variables.
* [`postcss-strip-units`] strips units off of property values.
* [`postcss-vertical-rhythm`] adds a vertical rhythm unit
  based on `font-size` and `line-height`.
* [`csstyle`] adds components workflow to your styles.

### Colors

* [`postcss-ase-colors`] replaces color names with values read
  from an ASE palette file.
* [`postcss-brand-colors`] inserts company brand colors
  in the `brand-colors` module.
* [`postcss-color-alpha`] transforms `#hex.a`, `black(alpha)` and `white(alpha)`
  to `rgba()`.
* [`postcss-color-hcl`] transforms `hcl(H, C, L)` and `hcl(H, C, L, alpha)`
  to `#rgb` and `rgba()`.
* [`postcss-color-hexa`] transforms `hexa(hex, alpha)` into `rgba` format.
* [`postcss-color-mix`] mixes two colors together.
* [`postcss-color-palette`] transforms CSS 2 color keywords to a custom palette.
* [`postcss-color-pantone`] transforms pantone color to RGB.
* [`postcss-color-scale`] adds a color scale `cs()` function.
* [`postcss-color-short`] adds shorthand color declarations.
* [`postcss-color-yiq`] sets foreground colors using the YIQ color space.
* [`postcss-colorblind`] transforms colors using filters to simulate
  colorblindness.
* [`postcss-contrast`] checks background-color and gives either white or black.
* [`postcss-hexrgba`] adds shorthand hex `rgba(hex, alpha)` method.
* [`postcss-rgb-plz`] converts 3 or 6 digit hex values to `rgb`.
* [`postcss-rgba-hex`] converts `rgba` values to `hex` analogues.
* [`postcss-shades-of-gray`] helps keeping grayscale colors consistent to a gray palette.
* [`colorguard`] helps maintain a consistent color palette.

### Images and Fonts

* [`postcss-assets`] allows you to simplify URLs, insert image dimensions,
  and inline files.
* [`postcss-assets-rebase`] rebases assets from `url()`.
* [`postcss-at2x`] handles retina background images via use of `at-2x` keyword.
* [`postcss-copy-assets`] copies assets referenced by relative `url()`s into a
  build directory.
* [`postcss-data-packer`] moves embedded Base64 data to a separate file.
* [`postcss-image-set`] adds `background-image` with first image
  for `image-set()`.
* [`postcss-image-inliner`] inlines local and remote images.
* [`postcss-instagram`] adds Instagram filters to `filter`.
* [`postcss-font-pack`] simplifies font declarations and validates they match
  configured font packs.
* [`postcss-fontpath`] adds font links for different browsers.
* [`postcss-responsive-images`] adds stylesheets for making
  your images responsive.
* [`postcss-sprites`] generates CSS sprites from stylesheets.
* [`postcss-svg`] insert inline SVG to CSS and allows to manage it colors.
* [`postcss-svg-fallback`] converts SVG in your CSS to PNG files for IE 8.
* [`postcss-svgo`] processes inline SVG through [SVGO].
* [`postcss-url`] rebases or inlines `url()`s.
* [`postcss-urlrev`] adds MD5 hash strings to `url()`s.
* [`postcss-write-svg`] write inline SVGs in CSS.
* [`postcss-inline-svg`] inline SVG images and customize their styles.
* [`webpcss`] adds URLs for WebP images for browsers that support WebP.

### Grids

* [`postcss-grid`] adds a semantic grid system.
* [`postcss-simple-grid`] create grid with one line.
* [`postcss-neat`] is a semantic and fluid grid framework.
* [`lost`] feature-rich `calc()` grid system by Jeet author.

### Optimizations

* [`postcss-calc`] reduces `calc()` to values
  (when expressions involve the same units).
* [`postcss-import`] inlines the stylesheets referred to by `@import` rules.
* [`postcss-reference`] emulates Less’s [`@import (reference)`].
* [`postcss-partial-import`] inlines standard imports and Sass-like partials.
* [`postcss-single-charset`] ensures that there is one and only one
  `@charset` rule at the top of file.
* [`postcss-zindex`] rebases positive `z-index` values.
* [`css-byebye`] removes the CSS rules that you don’t want.
* [`css-mqpacker`] joins matching CSS media queries into a single statement.
* [`stylehacks`] removes CSS hacks based on browser support.

### Shortcuts

* [`postcss-alias`] creates shorter aliases for properties.
* [`postcss-alias-atrules`] creates shorter aliases for at-rules.
* [`postcss-all-link-colors`] insert colors for link-related pseudo-classes.
* [`postcss-border`] adds shorthand for width and color of all borders
  in `border` property.
* [`postcss-center`] centers elements.
* [`postcss-circle`] inserts a circle with color.
* [`postcss-clearfix`] adds `fix` and `fix-legacy` properties to the `clear`
  declaration.
* [`postcss-crip`] shorthand properties for Crips that are too lazy to write.
* [`postcss-default-unit`] adds default unit to numeric CSS properties.
* [`postcss-easings`] replaces easing names from easings.net
  with `cubic-bezier()` functions.
* [`postcss-filter`] adds shorthand for black and white filter.
* [`postcss-focus`] adds `:focus` selector to every `:hover`.
* [`postcss-generate-preset`] allows quick generation of rules.
  Useful for creating repetitive utilities.
* [`postcss-input-style`] adds new pseudo-elements for cross-browser styling
  of inputs.
* [`postcss-position`] adds shorthand declarations for position attributes.
* [`postcss-property-lookup`] allows referencing property values without
  a variable.
* [`postcss-responsive-type`] changes `font-size` depends on screen size.
* [`postcss-short-font-size`] extends `font-size` to define line-height
  s a second value.
* [`postcss-short-position`] extends `position` to define edges
  as additional values.
* [`postcss-short-spacing`] extends `margin` and `padding` to allow
  or omitted edges.
* [`postcss-short-text`] adds a `text` shortcut property for several
  text-related properties.
* [`postcss-size`] adds a `size` shortcut that sets width and height
  with one declaration.
* [`postcss-transform-shortcut`] allows shorthand transform properties in CSS.
* [`postcss-triangle`] creates a triangle.
* [`postcss-verthorz`] adds vertical and horizontal spacing declarations.
* [`font-magician`] generates all the `@font-face` rules needed in CSS.

### Others

* [`postcss-autoreset`]  automatically adds reset styles.
* [`postcss-class-prefix`] adds a prefix/namespace to class selectors.
* [`postcss-currency`] replaces name of currency with symbols.
* [`postcss-fakeid`] transforms `#foo` IDs to attribute selectors `[id="foo"]`.
* [`postcss-flexboxfixer`] unprefixes `-webkit-` only flexbox in legacy CSS.
* [`postcss-flexbugs-fixes`] fixes some of known [flexbox bugs].
* [`postcss-gradientfixer`] unprefixes `-webkit-` only gradients in legacy CSS.
* [`postcss-increase-specificity`] increases the specificity of your selectors.
* [`postcss-mq-keyframes`] moves any animation keyframes in media queries
  to the end of the file.
* [`postcss-pseudo-elements-content`] adds `content: ''` to `:before-c`
  and `:after-c`.
* [`postcss-pseudo-content-insert`] adds `content: ''` to `:before` and `:after`
  if it is missing.
* [`postcss-pxtorem`] converts pixel units to `rem`.
* [`postcss-select`] select rules based off a selector list.
* [`postcss-shorthand-expand`] expands shorthand properties.
* [`postcss-raw`] protects nodes inside `@raw` at-rules from being touched by other plugins.
* [`postcss-remove-prefixes`] removes vendor prefixes.
* [`postcss-style-guide`] generates a style guide automatically.
* [`postcss-scopify`] adds a user input scope to each selector.
* [`cssfmt`] formats CSS source code automatically inspired by Gofmt.
* [`perfectionist`] formats poorly written CSS and renders a “pretty” result.
* [`rtlcss`] mirrors styles for right-to-left locales.

### Analysis

* [`postcss-bem-linter`] lints CSS for conformance to SUIT CSS methodology.
* [`postcss-cssstats`] returns an object with CSS statistics.
* [`postcss-regexp-detect`] search for regexp in CSS declarations.
* [`css2modernizr`] creates a Modernizr config file
  that requires only the tests that your CSS uses.
* [`doiuse`] lints CSS for browser support, using data from Can I Use.
* [`immutable-css`] lints CSS for class mutations.
* [`list-selectors`] lists and categorizes the selectors used in your CSS,
  for code review.

### Reporters

* [`postcss-browser-reporter`] displays warning messages from other plugins
  right in your browser.
* [`postcss-reporter`] logs warnings and other messages from other plugins
  in the console.

### Fun

* [`postcss-australian-stylesheets`] Australian Style Sheets.
* [`postcss-andalusian-stylesheets`] Andalusian Style Sheets.
* [`postcss-canadian-stylesheets`] Canadian Style Sheets.
* [`postcss-german-stylesheets`] German Style Sheets.
* [`postcss-russian-stylesheets`] Russian Style Sheets.
* [`postcss-swedish-stylesheets`] Swedish Style Sheets.
* [`postcss-tatar-stylesheets`] Tatar Style Sheets
* [`postcss-lolcat-stylesheets`] Lolspeak Style Sheets.
* [`postcss-imperial`] adds CSS support for Imperial and US customary units
  of length.
* [`postcss-russian-units`] adds CSS support for russian units of length.
* [`postcss-pointer`] Replaces `pointer: cursor` with `cursor: pointer`.
* [`postcss-spiffing`] lets you use British English in your CSS.
* [`postcss-spanish-stylesheets`] Spanish Style Sheets.
