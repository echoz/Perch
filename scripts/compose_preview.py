"""Compose a labeled technical review sheet from the CAD renders."""

import json
from pathlib import Path

from PIL import Image, ImageDraw, ImageFont


ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "previews"
checks = json.loads((ROOT / "exports" / "concept" / "mesh-checks.json").read_text())
parts = {item["file"]: item["objects"][0] for item in checks["checks"]}
loaded = [parts[name] for name in (
    "assembled.stl", "reference_mini.stl", "reference_cards.stl",
    "reference_headphones.stl", "reference_cables.stl",
)]
loaded_size = [round(max(p["max_mm"][i] for p in loaded) - min(p["min_mm"][i] for p in loaded), 2) for i in range(3)]
base_size = parts["base.stl"]["dimensions_mm"][:2]
def size_text(values):
    return " × ".join(f"{v:g}" for v in values) + " mm"
FONT = "/System/Library/Fonts/Supplemental/Arial.ttf"
title = ImageFont.truetype(FONT, 40)
label = ImageFont.truetype(FONT, 29)
small = ImageFont.truetype(FONT, 24)
sheet = Image.new("RGB", (1480, 906), "#edf0f0")
draw = ImageDraw.Draw(sheet)
draw.text((34, 23), "Compact side-by-side charging station", font=title, fill="#193c3b")
draw.text((36, 76), "Device shapes and dimensions are illustrative; physical fit is unverified.", font=small, fill="#465a5b")

for x, filename, heading in (
    (24, "loaded-front.png", "Centered headphone mount"),
    (752, "base-detail.png", "One sculpted body · two pockets"),
):
    draw.text((x + 12, 123), heading, font=label, fill="#193c3b")
    image = Image.open(OUT / filename).convert("RGB")
    image.thumbnail((704, 640), Image.Resampling.LANCZOS)
    sheet.paste(image, (x, 165))

draw.text((36, 822), "Assumed loaded: " + size_text(loaded_size), font=small, fill="#193c3b")
draw.text((764, 822), "Printed base: " + size_text(base_size), font=small, fill="#193c3b")
draw.text((36, 862), "Measure hardware and print fit coupons before the full dock.", font=small, fill="#465a5b")
sheet.save(OUT / "concept-review.png")
print(OUT / "concept-review.png")
