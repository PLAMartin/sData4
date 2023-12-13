# sData4

App to help review data in Core Data supporting Scarper app.

Data tables include:

- Block: Playable grids (max 8 x 8 cells) are comprised of blocks. Blocks are: Colour 1, Colour 2, Colour 3, Colour 4, Colour 5, Space, Black, White, ArrowUp, ArrowDown, ArrowLeft, ArrowRight, Rotate90Clockwise, Rotate90AntiClockwise and Rotate180 and Random.
- Blocktype: Each block is a blocktype. The blocktypes are: Colour, Space, Black, White, Arrow, Rotate and Random.
- Box: A box relates to a Series, Episode and Variant, in that hierarchical order. A box can and usually does have a grid (max 8 x 8 cells) in it.
- Colour: A colour is defined according to the RGB colour model, i.e. additive Red, Green and Blue components. Each RGB colour component is a value between 0 and 255. Additionally, the opacity is defined, expressed as a decimal value between 0 and 1.
- Episode: Each episode has a sequential integer value of 1 or more. Each episode is associated with a series and has variants associated with it.
- Grid: 
- Palette: A set of colours which are chosen to work well together, e.g. the colour blocks in a grid.
- PalettePart:
- Part:
- Seed:
- Series: Each series has a sequential integer value of 1 or more.
- SeriesEpisode:
- Setup: In the setup phase of a grid (based on a seed) defines which the block starts in each grid cell.
- Spawn:
- Target:
- User:
- UserPalette:
- Variant:

Phil Martin
