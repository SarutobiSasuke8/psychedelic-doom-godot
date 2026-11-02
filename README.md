# Psychedelic Doom Godot Framework

A strong, modular Godot 4 framework for building a **psychedelic, weird, Rick & Morty-inspired Doom-like FPS**.

### Vision
- Classic Doom/Wolfenstein feel (fast movement, 2.5D/3D hybrid or full 3D corridors)
- Extremely whacky, psychedelic aesthetics (warping shaders, googly eyes, reality-breaking effects)
- Quirky sci-fi aliens with googly eyes instead of demons
- Rick & Morty vibes: absurd humor, interdimensional nonsense, portal-like weirdness, sarcastic tone
- More sci-fi enemies than classic hellish demons

**Target**: Browser-friendly export (HTML5) for RokumonGames.com, plus desktop.

## Quick Start
1. Install Godot 4.3+ (or latest stable)
2. Clone this repo
3. Open `project.godot` in Godot
4. Run the main scene (`scenes/main.tscn`)
5. WASD to move, Mouse to look, Left Click to shoot (placeholder)

## Project Structure
```
/
├── project.godot
├── README.md
├── ROADMAP.md
├── scenes/
│   ├── main.tscn
│   ├── player/
│   └── enemies/
├── scripts/
│   ├── player/
│   ├── weapons/
│   ├── enemies/
│   └── systems/
├── assets/
│   ├── models/
│   ├── textures/
│   ├── audio/
│   └── shaders/
└── addons/ (optional)
```

## Current Features (Framework)
- Basic FPS player controller (movement + mouse look)
- Modular weapon system base
- Enemy base class with simple state machine
- Game manager / state
- Input map ready
- Psychedelic post-processing placeholder
- Clean architecture for rapid iteration

See **ROADMAP.md** for the full development plan.

## Theme Notes
- Enemies: Googly-eyed aliens, interdimensional creatures, sarcastic robots, portal parasites, etc.
- Weapons: Portal gun variants, laser googly, dimension-warping guns, pickle-based absurdities
- Environments: Shifting corridors, floating islands in the void, neon-tripping labs, Morty-style suburban hellscapes mixed with sci-fi
- Audio: Distorted chiptunes, Rick-style burps, alien squeaks, psychedelic synths

Built for original indie games on RokumonGames.com.

License: MIT (or choose your own)
