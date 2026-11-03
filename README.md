# Psychedelic Doom Godot Framework

A strong, modular Godot 4 template for a **psychedelic, weird, Rick & Morty-inspired Doom-like FPS** with googly quirky sci-fi aliens and a consistent **pixel art** style.

### Current Status: Playable Vertical Slice + Pixel Pipeline
- Fast Doom-style movement + mouse look
- Working hitscan weapon
- Enemy AI (chase + attack)
- Health, score, HUD, death/restart
- **480×270 pixel-perfect viewport** with nearest filtering
- Integer scaling for crisp pixels
- Pixel art consistency guide

**You can play it right now.** Open in Godot 4.3+ and hit Play.

### Pixel Art Decision
**Locked resolution: 480 × 270**

See `PIXEL_ART.md` for the full pipeline and rules.

### Vision
- Classic Doom/Wolfenstein feel with modern pixel-art polish
- Extremely whacky, psychedelic aesthetics
- Quirky sci-fi aliens with googly eyes
- Rick & Morty vibes
- Easy to reskin — strong template architecture

**Target**: Browser-friendly export (HTML5) for RokumonGames.com, plus desktop.

## Quick Start
1. Install Godot 4.3+
2. Clone this repo
3. Open `project.godot`
4. Run the main scene
5. WASD to move, Mouse to look, Left Click to shoot, Esc to free mouse

## Project Structure
```
/
├── project.godot
├── README.md
├── ROADMAP.md
├── PIXEL_ART.md
├── scenes/
├── scripts/
└── assets/
    ├── textures/
    └── sprites/
```

See **ROADMAP.md** and **PIXEL_ART.md** for next steps.

Built for original indie games on RokumonGames.com.

License: MIT
