# Work Log

## Logan Fu

### 5/22/23

Start of project, Day 1. Made empty class files for TetrisPlayer and TetrisGame and filled out simple get/set methods. 
Made drawBoard make a grid with colors for specific pieces. Need to finalize setup() and startGame(). 

### 5/23/23

Made a basic start screen, with a boolean to toggle the start of a game, completing phase 1. Started with making pieces with the
I piece, and sucessfully made it rotate using an origin and 3D array containing rotations. But rotating with the 3D array method poses potential issues with
shifting in cardinal directions. Need to experiment and work on shifting the piece in cardinal directions.

### 5/24/23

Made the shift code (left, right, down) work for the IPiece. The same methods should apply well to the other pieces. Need to finalize testing on piece movement
when other pieces are done, including a proper controller input class. Then need to test an automatic falling mechanic for the game. We should be on track to finish 
phase 2 and 3 before or during Friday (5/26), and have the weekend to start developing TetrisGame class with the different game boards and game states.

### 5/25/23

Made a proper controller class for smoother cardinal inputs. Phase 2 is completed. Tomorrow, we should be able to complete phase 3 with falling pieces and generating
new random pieces with relative ease, unless unexpected issues come up. Phase 4 should be able to be started over the weekend of 5/27, which will be critical for the MVP due 6/2.

### 5/26/23

Made pieces automatically shift down, and generate a new piece when it reached the bottom. Phase 3 is completed. 

## Arshan Pervez

### 5/22/23

Beginning of project. Made empty class file for Piece and created get/set/constuctor methods. Began to work on tetrominos/shifting and rotating of them.

### 5/23/23

Continued to work on tetrominos and shifting/rotating. Created 2D arrays of tetrominos and created initial methods for rotating and shifting (may have to be reworked due to complexity of certain shapes of pieces).

### 5/24/23

Designed rotation arrays for all tetrominos. Rotation looks to have worked, still need to focus now on shifting left and right for certain pieces, as well as their rotations at far lefts/rights.
info
