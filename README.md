# Shadows
Team Name: \*Cries in Java\*

Members: Wilde Chu & Joshua Kloepfer

Description: Our project will be a dungeon style game, similar to the Binding of Isaac/Enter the Gungeon.  The player will play as a ninja and fight through multiple rooms with many enemies, with each room being its own contained battle. There will also be power ups and other weapons the player can pick up along the way that will randomly spawn. In the last room, the player will fight a boss in a battle resembling a bullet hell, which will involve weaving between projectiles while returning fire.

[Prototype](https://docs.google.com/document/d/1um9NYU4VOosW5PTzd0VpSnWpZxrdpRQoRMOCysq01pk/edit?usp=sharing)


**How to Run:**

Open Shadows.pde and hit Run


**Development log:**

5/24:
- Created basic Bow sprite(Joshua)

5/25:
- Created Necromancer sprite(Joshua)
- Outlined basic classes like Shadows, Game, Floor, Room(Wilde)

5/27:
- Coded player movement(Joshua & Wilde)
- Added Projectile and implementation of the Shuriken subclass(Joshua & Wilde)

5/28:
- Rooms are now loaded from rooms.txt, and different initialization number gives a different layout(Wilde)

6/1:
- A melee enemy called bat now exists(Joshua)
- It is unaffected by obstacles and goes at the player until it can strike(Joshua)
- The bat can kill the player ending the game and the player can kill the bat making the bat disappear(Joshua)

6/2:
- Now working skeleton archer(Joshua)
- Refactored all projectiles into one big array in Game, while still maintaining no friendly fire(Wilde)

6/3:
- Can now have multiple enemies(Joshua)
- Necromancer is started and has the ability to summon enemies(Joshua)
- Bat movement is now animated(Joshua)
- Bat attack is now animated(Joshua)

6/6:
- Player now faces correct direction(Wilde)
- UI class created along with Hearts(Wilde)
- Hearts now display player health(Wilde)

6/8:
- Walls and corners added(Wilde)

6/9:
- Collision with rocks(Joshua)
- Corrected collision bounds (Wilde)
- Projectiles now correspond to primaryWeapon(Wilde)
- Began work on Inventory of the UI(Wilde)

6/10
- Perfected collision(Joshua)
- Ninja doesn't need mirror sprite(Wilde)
- Figuring out the sword(Joshua)

6/11
- Nearly all the sprites and animations(Wilde)
- Skeleton shoots arrow(Joshua)
- Coded in the animations(Joshua)
- Added pause function(Joshua)
- Title screen(Wilde)
- Floors increase each time you defeat the boss(Wilde)
- Weapon switching(Joshua)
- Inventory UI(Wilde)
- Randomized room generation(Joshua)
- Made sure edges had no doors leading out of the array(Joshua)
- Added powerups(Joshua)
- Removed rock inheritance of PowerUp(Joshua)
- Doors unlock after defeating all enemies(Joshua)
- "How to play"(Wilde)
