# APCS Final Project
THIS DOCUMENT IS REQUIRED
## Group Info
- Arshan Pervez
- Logan Fu

## Overview
Our project is a remake of Tetris, complete with all tetrominos and scorekeeping.
This program is meant to be played like normal Tetris. Shift and rotate pieces in 
order to complete lines. Completing lines will cause the lines to dissappear, giving
you more room to place new pieces. Try to clear more lines at once to score more points.
As you progress and your score gets higher, your pieces will fall down faster as the levels 
get more difficult. A game over is reached when no new pieces can enter the screen.

## Instructions
Required Libraries in Processing:
  - Sound by the Processing Foundation

Start Screen:
  - Level: Select a level from 1-10 to start with by clicking on "UP" or "DOWN". The higher the level, the faster the pieces fall automatically.
  - Mode: Select a mode by either clicking on the blue or red box.
    - Heaven: Standard random piece generation (generates and shuffles a bag of the seven pieces), hold piece available, and next pieces are visible. This is the basic standard for modern Tetris.
    - Hell: Chaotic random piece generation (generates each piece with a 1/7 chance every time, usually leads to unlucky streaks), hold piece disabled, and next pieces are invisible.

Controls:
  - Left arrow: Move piece to the left
  - Right arrow: Move piece to the right
  - Down arrow: Accelerate piece downward
  - Z: Rotate piece left
  - X: Rotate pieces right
  - C: Hold current piece
  - Spacebar: Hard drop pieces (piece fits down instantly)
