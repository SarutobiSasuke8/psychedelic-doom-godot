# Detailed Roadmap: Psychedelic Doom-Like

## Phase 0: Framework Foundation (Current)
- [x] Godot 4 project setup
- [x] Player FPS controller (movement, mouse look, jumping)
- [x] Basic weapon system architecture
- [x] Enemy base class + simple AI stub
- [x] Main scene + game manager
- [x] Input mapping
- [x] README + this roadmap
- [ ] Basic placeholder level (corridor)
- [ ] Simple health/ammo UI

**Goal**: Playable prototype skeleton you can immediately start building on.

## Phase 1: Core Gameplay Loop (2-4 weeks)
- Full weapon system: hitscan + projectile weapons
- Multiple weapon slots + switching
- Ammo system + pickups
- Enemy AI: patrol, chase, attack, death
- Damage system + health
- Basic level geometry (modular corridors, rooms)
- Collision & interaction
- Sound effects framework
- First 2-3 quirky enemy types (googly aliens)

**Milestone**: One complete level with combat, clear start-to-finish.

## Phase 2: Psychedelic & Weird Layer (2-3 weeks)
- Custom shaders: warping walls, tripping post-processing, googly eye materials
- Reality-bending mechanics (gravity shifts, dimension portals, size changes)
- Whacky enemy behaviors (googly eyes that track, aliens that talk trash, morphing forms)
- Absurd weapons (Rick-style portal gun, laser that turns things into pickles, etc.)
- Environmental storytelling & easter eggs
- Dynamic lighting / neon / void aesthetics

**Milestone**: The game *feels* psychedelic and Rick & Morty-weird.

## Phase 3: Content & Polish (3-5 weeks)
- 5-10 handcrafted levels with increasing weirdness
- Full enemy roster (sci-fi focused)
- Weapon variety (6-8 unique guns)
- Boss encounters
- Full UI (health, ammo, minimap or compass, dialogue)
- Music & SFX library
- Particle effects & juice
- Save system / level select
- Accessibility options

## Phase 4: Browser & Distribution
- HTML5 export optimization
- Performance profiling (especially for web)
- Touch/mobile controls optional
- Integration notes for RokumonGames.com
- Playtesting & balance
- Final polish pass

## Phase 5: Future / Stretch
- Multiplayer co-op (WebRTC or simple)
- Procedural weird levels
- Mod support
- More absurd dimensions

## Design Pillars
1. **Fast & Responsive** — Doom-like movement and gunplay
2. **Weird First** — Every system should have a psychedelic or absurd twist
3. **Quirky Characters** — Googly aliens with personality
4. **Modular** — Easy to add new weapons, enemies, and effects
5. **Browser Ready** — Lightweight enough for web export

## Tech Notes
- Godot 4.x
- Forward+ or Mobile renderer depending on target
- Shaders for the psychedelic feel (use Godot's visual shader or GLSL)
- Keep assets low-poly or stylized for performance
- Consider Godot's NavigationServer for AI pathing later

This is a living document. Update as you progress.
