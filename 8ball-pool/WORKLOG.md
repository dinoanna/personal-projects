# Work Log

## Anna

### 5/22/23

Created the files with the outline of methods and all variables in ball(set final variables by scaling down real life data). Complete accessor methods and revised ball construction to differ in color from background. Finished basic version of move() with velocity and bounce(no friction) and using onBoard to remove ball if scored.

### 5/23/23

Apply move() in draw and test its functionality. Also revised movement by including acceleration as a factor and fixed issues with bouncing around borders. Used physics formulas to calculate force, acceleration, and velocity as well as friction force based on the friction coefficient of 0.06 although more testing is needed.

### 5/24/23

Fixed friction with Maya. Also began working on the CueBall class, using mousePressed() and mouseReleased() to control the strength and direction it is hit. Actual implementation still needs to be done but the overall outline and plan has been completed.

### 5/25/23

Continued working on cueBall aiming and completed initial mouse controls and booleans/restrictions on aiming or creating new balls. Also began fixing move() and applyFriction() in order to use player controlled direction and strength(of aiming) variables rather than just gravitational force.

### 5/26/23

Started to revise cueBall aiming to use mouseDragged instead of mouseClicked or mouseReleased.

### 5/27/23

Revised Maya's version of aiming with mouseDragged to utilize the distance the mouse has been dragged in order to set the strength of the ball shot, with restrictions on minimum and maximum strength. draw() has also been modified to show these changes on the arrow, with the distance being the length of the aiming arrow.

### 5/28/23

Completed the initial setup of balls, in a triangular rack. This will be the shortcut key to demonstrate in our demo, and to play an actual game instead of a simulation. More templates may be added later on, along with instructions on how to play or aim the cue ball.

### 5/29/23

Added keyboard shortcuts to return to previous template(pressing 2 will allow mouse click to place balls, and escape from game).

### 5/30/23

Added the shape of holes, on the corners and middle of the table for a total of six holes(using rotate, translate, and ellipse commands).

### 5/31/23

Revised holes so it's easier to implement interaction with balls. Also rehearsed for demo and looked for errors in programming.

### 6/1/23

Completed hole revisions and added diamonds on the edges of the table to make it more realistic.

### 6/5/23

Continued testing for errors(especially with holes and bouncing), started on making it a game by displaying player's turn(will continue revising bounce and started working on scoring after Maya completes her revisions).

### 6/6/23

Completed score tracker(display all remaining balls), and fixed display and color of text.

### 6/7/23

Started revising display and revised minor issues(font, text size, text placement, etc).

### 6/8/23

Completed display, and added more cheats using controller. Pressing 1 will lead to easy endgame, 2 will go back to normal game, 3 will restart game after someone wins. Also revised Read Me to note these changes.

### 6/9/23

Completed the last cheat, which will bring player to a losing game if 3 is pressed(shooting in the 8-ball before all other balls of their color has been scored). Pressing 4 twice will restart the game(not 3 anymore). Revised Read Me to match these changes.

### 6/10/23

Changed reset control to pressing 4 once not twice or with delay.

## Maya

### 5/22/23

Started working on the setup() in Game for pool table graphics in class. At home, completed the initial ball class (constructor and getShape()) and added the ability to add balls.

### 5/23/23

Changed ball graphics to include stripe/no stripe, and number (modified getShape(), constructor, and Game for random selection). At home, wrote isOverlapping() and canPlace() to solve the issue of overlapping balls.

### 5/24/23

fixed balls drawing over the edges issue. Modified Ball and Game to add friction to the simulation. Added collision, which works, but still has some major bugs.

### 5/25/23

Tried a different model for handling collisions, but didn't work. Made progress towards fixing the old collision simulator.

### 5/26/23

Finished working on collisions. Added new constructor to Ball to include color. Added a new controller class, and modified Game to add the ability to aim and shoot the cue ball.

### 5/27/23

Edited Ball and Game to implement a power bar that can control shot strength.

### 5/30/23

Started working on adding holes. Finished adding side holes, but still some bugs with the cue ball.

### 5/31/23

Finished working on the side holes. Started working on the corner holes.

### 6/4/23

Finished implementing the holes, and modified the graphics.

### 6/5/23

Reorganized the code in the Game file to transition into creating a standard game of 8 ball pool. Added turns to the game, with a player's turn continuing if they pocketed one of their balls.

### 6/6/23

Added the ability to place the cue ball back on the board if a player pocketed it (and added a cheat to do the same).

### 6/7/23

Added the ability to win/lose the game when the 8 ball is pocketed.

### 6/10/23

Fixed bug with arrow changing size after game reset

## Working features
 * Accurate modeling of the balls using physics(friction and collisions)
 * Ability to angle the shot of the cue ball by dragging the mouse
 * Ability to adjust strength of the shot using a slider
 * Ability to fire the ball by pressing ENTER key
 * Ability to score(pocket) balls into the 6 holes and disappear from the table (*)
 * Playable by two players; turns alternate between two players, although a player's turn continues if they pocket one of their balls
 * Clicking to place the cue ball anywhere on the table if it has been pocketed by the other player
 * Either player can win the game (by pocketing the 8 ball after all of their other balls, or if the other player pocketed the 8 ball before pocketing all of their other balls)
 * Ball tracker that displays all remaining balls on the board
 * Keyboard cheats (press 0 to place cue ball) and templates (press 2 and 3 for quick winning/losing endgames, press 1 to return to normal game)
 * Restart after winning by pressing 4

## Bugs
 * Sometimes, instead of going into the hole and disappearing from the table, a ball will continue moving until its off the screen. You will be able to continue playing, but that player will not be able to win (the ball will not have registered as being pocketed). This does not happen often, but it usually happens with high velocity balls.

## Content Resources
 * https://www.myphysicslab.com/engine2D/collision-methods-en.html
 * https://www.real-world-physics-problems.com/physics-of-billiards.html
 * https://ekiefl.github.io/2020/04/24/pooltool-theory/
 * https://www.101computing.net/elastic-collision-in-a-pool-game/
 * https://en.wikipedia.org/wiki/Billiard_ball
 * https://en.wikipedia.org/wiki/Billiard_table#Pool_tables
 * https://www.coolmathgames.com/0-8-ball-pool
