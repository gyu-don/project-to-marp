# Marp Syntax Reference

## Frontmatter

```yaml
---
marp: true
theme: default         # default | gaia | uncover
paginate: true
header: "Header text"
footer: "Footer text"
---
```

## Slide Separator

`---` on its own line starts a new slide.

## Text Formatting

Standard Markdown: `**bold**`, `*italic*`, `~~strikethrough~~`, `` `code` ``

## Images

```markdown
![width:400px](image.png)
![bg](background.png)          # Full background
![bg left:40%](image.png)      # Split background (left 40%)
![bg right](image.png)         # Split background (right 50%)
```

## Directives

Slide-level directives (affect only current slide):

```markdown
<!-- _class: lead -->          # Apply class to this slide only
<!-- _backgroundColor: #fff -->
<!-- _color: #333 -->
<!-- _paginate: false -->       # Hide page number on this slide
```

Global directives (affect all slides after declaration):

```markdown
<!-- theme: gaia -->
<!-- paginate: true -->
```

## Common Classes (default theme)

- `lead` — centered title slide style
- `invert` — dark background variant

## Math

Inline: `$E = mc^2$`
Block: `$$\sum_{i=1}^{n} x_i$$`

## Columns (using HTML)

```html
<div class="columns">
<div>

Left column content

</div>
<div>

Right column content

</div>
</div>
```

Requires CSS in frontmatter or theme support. Simple alternative — use `![bg right]` for two-column layouts.

## PDF Export

```bash
marp --pdf input.md -o output.pdf
# With Chrome/Chromium:
marp --pdf --allow-local-files input.md -o output.pdf
```

## Layout Tips

- Slide aspect ratio: 16:9 by default (`size: 16:9` or `size: 4:3` in frontmatter)
- Keep text per slide minimal — 5–7 bullet points max
- Use `<!-- fit -->` in headings for auto-fit: `# <!-- fit --> Big Title`
- Image-heavy slides: prefer `![bg]` over inline images for layout stability
