# Psychedelic Doom Godot Framework

A strong, modular Godot 4 template for a **psychedelic, weird, Rick & Morty-inspired Doom-like FPS** with googly quirky sci-fi aliens.

### Current Status: Playable Vertical Slice
- Fast Doom-style movement + mouse look
- Working hitscan weapon (left click to shoot)
- Enemy AI that chases and attacks
- Player health + death/restart
- Score system
- Basic HUD
- Enclosed arena with two googly aliens

**You can play it right now.** Open in Godot 4.3+ and hit Play.

### Vision
- Classic Doom/Wolfenstein feel
- Extremely whacky, psychedelic aesthetics (warping shaders, googly eyes, reality-breaking effects)
- Quirky sci-fi aliens with googly eyes
- Rick & Morty vibes: absurd humor, interdimensional nonsense
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
├── scenes/
│   ├── main.tscn
│   ├── player/
│   ├── enemies/
│   ├── weapons/
│   └── ui/
├── scripts/
│   ├── player/
│   ├── weapons/
│   ├── enemies/
│   ├── systems/
│   └── ui/
└── assets/ (for future art/shaders)
```

## Why This Is a Strong Template
- Modular weapon and enemy bases (easy to extend or reskin)
- Clear separation of player, AI, systems, and UI
- Group-based communication
- Ready for custom shaders and post-processing
- Designed so you can swap meshes/materials without rewriting logic

See **ROADMAP.md** for the full development plan.

Built for original indie games on RokumonGames.com.

License: MIT
