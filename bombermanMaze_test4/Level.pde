class Level {
  //data
  Tile[][] tiles;

  int tilesHigh, tilesWide;
  int x_block, y_block;

  //constructor
  Level(String fileToLoad, color theBackground) {
    //load background
    background(theBackground);


    //load level data
    String lines[] = loadStrings(fileToLoad);

    tilesHigh = lines.length;
    tilesWide = lines[0].length();

    float tileWidth = width/tilesWide;
    float tileHeight = height/tilesHigh;


    tiles = new Tile[tilesWide][tilesHigh];

    for (int y = 0; y < tilesHigh; y++) {
      for (int x = 0; x < tilesWide; x++) {
        char tileType = lines[y].charAt(x);
        tiles[x][y] = new Tile(x*tileWidth, y*tileHeight, tileWidth, tileHeight, tileType);
        if (tiles[x][y].isAccessible == false) {
          x_block = x;
          y_block = y;
        }
      }
    }
  }
  //functions
  void display() {


    for (int y = 0; y < tilesHigh; y++) {
      for (int x = 0; x < tilesWide; x++) {
        tiles[x][y].display();
      }
    }
  }
}