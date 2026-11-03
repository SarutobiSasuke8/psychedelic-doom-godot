# Pixel Art Pipeline & Consistency Guide

## Locked Resolution
**480 × 270** (16:9)

- Viewport is rendered at 480×270
- Integer scaled to window (default 2× = 960×540)
- Stretch mode: `viewport` + `integer` scale
- All textures use **Nearest** filtering (no blur)

This gives a crisp retro Doom-like look while remaining practical for browser and desktop.

## Rules for Consistency
1. **All new textures** must be created at a size that looks good when viewed at the 480×270 scale.
2. Prefer power-of-two sizes: 16×16, 32×32, 64×64, 128×128.
3. Always import with **Filter = Nearest** (or set project-wide default, which we already did).
4. UI elements should also respect the low-res aesthetic (chunky fonts or pixel fonts).
5. Enemy billboards / sprites should be drawn at a consistent pixel density (recommend 32–64 px tall for characters).
6. Avoid mixing high-res and low-res assets in the same scene.

## Recommended Asset Sizes
| Asset Type          | Suggested Size | Notes                          |
|---------------------|----------------|--------------------------------|
| Enemy sprites       | 32×48 or 48×64 | Billboarded, googly aliens     |
| Weapon viewmodels   | 64×64        | Low-poly + pixel texture       |
| Wall / floor tiles  | 64×64        | Seamless if possible           |
| UI icons            | 16×16 or 32×32| Keep chunky                    |
| Particle sprites    | 8×8 or 16×16 | Simple shapes                  |

## Godot Import Settings (for every texture)
- Filter: **Nearest**
- Mipmaps: Off (or Nearest if needed)
- Compress: Lossless or VRAM Compressed with high quality

## How to Add New Pixel Art
1. Create the image at the target size.
2. Drop it into `assets/textures/` or `assets/sprites/`.
3. In Godot, select the texture → Import tab → Filter = Nearest → Reimport.
4. Apply to materials or Sprite3D / MeshInstance3D.

## Current Implementation
- Project viewport locked to 480×270
- Default texture filter set to Nearest
- Integer scaling enabled
- Ready for pixel textures and billboarded sprites

This keeps the entire game visually consistent as we add more content.
