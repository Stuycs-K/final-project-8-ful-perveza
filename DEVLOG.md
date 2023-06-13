# Dev Log

## Working features
- Basic Tetris game. Pieces fit together, rotate, and shift correctly. Lines clear correctly and game over is working
- Score, levels, and high score
- Start menu and pause button
- A “mercy” last-second delay system before the piece is placed
- A piece outline of where the piece will be placed
- Hold piece mechanic
- Displaying side pieces
- Zone mechanic
- Hard drop mechanic
- Heaven vs Hell mode option
- Better piece generation


## Broken features / bugs
- Broken features
 - None
- Bugs
 - On the first piece of a run with high score set to 0, high score updates to 1 or 2 instead of waiting to be updated at the end of the run. Recording high score after that works fine, however.
 - Piece movement can feel somewhat stiff, especially when played at fast speeds. Fine and precise movement can be hindered.
 - Gaming over in zone does not

## Content resources
- Tetris Wiki: https://tetris.wiki/Tetris.wiki Helped clarify some of the specific details about building Tetris, such as randomly generating pieces.
- Processing reference: https://processing.org/reference/
