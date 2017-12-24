return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "1.0.3",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 70,
  height = 48,
  tilewidth = 32,
  tileheight = 32,
  nextobjectid = 115,
  properties = {},
  tilesets = {
    {
      name = "Main Floor",
      firstgid = 1,
      filename = "../../wip/config/main-floor.tsx",
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../../image/tiles/tilesetHouse.png",
      imagewidth = 288,
      imageheight = 416,
      transparentcolor = "#ffffff",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 32,
        height = 32
      },
      properties = {},
      terrains = {},
      tilecount = 117,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "Floor",
      x = 0,
      y = 0,
      width = 70,
      height = 48,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87,
        87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87,
        87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87,
        87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87,
        87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87,
        87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87,
        87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87,
        87, 1, 2, 5, 5, 5, 5, 5, 3, 4, 87, 1, 2, 5, 5, 5, 5, 3, 4, 87, 87, 87, 87, 87, 1, 2, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 3, 4, 87, 1, 2, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 3, 4, 87,
        87, 10, 11, 14, 14, 14, 14, 14, 12, 13, 87, 10, 11, 14, 14, 14, 14, 12, 13, 87, 87, 87, 87, 87, 10, 11, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 12, 13, 87, 10, 11, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 12, 13, 87,
        87, 19, 20, 23, 23, 23, 23, 23, 21, 22, 87, 19, 20, 23, 23, 23, 23, 21, 22, 87, 87, 87, 87, 87, 19, 20, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 21, 22, 87, 19, 20, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 21, 22, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 24, 25, 1, 2, 5, 3, 4, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 24, 25, 10, 11, 14, 12, 13, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 16, 32, 17, 59, 59, 59, 16, 32, 17, 59, 59, 59, 16, 32, 17, 59, 59, 59, 16, 32, 17, 59, 24, 25, 87,
        87, 26, 27, 59, 15, 16, 32, 32, 32, 31, 87, 26, 27, 59, 15, 16, 32, 30, 31, 19, 20, 23, 21, 22, 28, 29, 32, 17, 18, 59, 59, 15, 16, 32, 32, 32, 17, 18, 59, 24, 25, 87, 26, 27, 24, 25, 87, 26, 27, 59, 59, 25, 87, 26, 59, 59, 59, 25, 87, 26, 59, 59, 59, 25, 87, 26, 59, 24, 25, 87,
        87, 26, 27, 59, 33, 34, 5, 5, 5, 5, 5, 35, 36, 59, 33, 34, 5, 5, 5, 35, 36, 59, 33, 34, 5, 5, 5, 35, 36, 59, 59, 24, 25, 87, 87, 87, 26, 27, 59, 24, 25, 87, 26, 27, 24, 25, 87, 26, 27, 59, 59, 25, 87, 26, 59, 59, 59, 25, 87, 26, 59, 59, 59, 25, 87, 26, 59, 24, 25, 87,
        87, 26, 27, 59, 42, 43, 14, 14, 14, 14, 14, 44, 45, 59, 42, 43, 14, 14, 14, 44, 45, 59, 42, 43, 14, 14, 14, 44, 45, 59, 59, 24, 25, 87, 87, 87, 26, 27, 59, 24, 25, 87, 26, 27, 24, 25, 87, 26, 27, 59, 59, 25, 87, 26, 59, 59, 59, 25, 87, 26, 59, 59, 59, 25, 87, 26, 59, 24, 25, 87,
        87, 26, 27, 59, 51, 52, 23, 23, 23, 23, 23, 53, 54, 59, 51, 52, 23, 23, 23, 53, 54, 59, 51, 52, 23, 23, 23, 53, 54, 59, 59, 24, 25, 87, 87, 87, 26, 27, 59, 24, 25, 87, 26, 27, 24, 25, 87, 26, 27, 59, 59, 25, 87, 26, 59, 59, 59, 25, 87, 26, 59, 59, 59, 25, 87, 26, 59, 24, 25, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 87, 87, 26, 27, 59, 33, 34, 5, 35, 36, 24, 25, 87, 26, 27, 59, 59, 25, 87, 26, 59, 59, 59, 25, 87, 26, 59, 59, 59, 25, 87, 26, 59, 24, 25, 87,
        87, 26, 27, 15, 16, 32, 32, 32, 32, 17, 18, 59, 59, 15, 16, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 17, 18, 59, 24, 25, 87, 87, 87, 26, 27, 59, 42, 43, 14, 44, 45, 24, 25, 87, 26, 27, 59, 59, 25, 87, 26, 59, 59, 59, 25, 87, 26, 59, 59, 59, 25, 87, 26, 59, 24, 25, 87,
        87, 26, 27, 33, 34, 5, 5, 5, 5, 35, 36, 59, 59, 33, 34, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 35, 36, 59, 24, 25, 87, 87, 87, 26, 27, 59, 51, 52, 23, 53, 54, 24, 25, 87, 26, 27, 59, 59, 25, 87, 26, 59, 59, 59, 25, 87, 26, 59, 59, 59, 25, 87, 26, 59, 24, 25, 87,
        87, 26, 27, 42, 43, 14, 14, 14, 14, 44, 45, 59, 59, 42, 43, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 44, 45, 59, 24, 25, 87, 87, 87, 26, 27, 59, 59, 59, 59, 59, 59, 33, 34, 5, 35, 36, 59, 59, 34, 5, 35, 59, 59, 59, 34, 5, 35, 59, 59, 59, 34, 5, 35, 59, 24, 25, 87,
        87, 26, 27, 51, 52, 23, 23, 23, 23, 53, 54, 59, 59, 51, 52, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 53, 54, 59, 24, 25, 87, 87, 87, 26, 27, 59, 59, 59, 59, 59, 59, 42, 43, 14, 44, 45, 59, 59, 43, 14, 44, 59, 59, 59, 43, 14, 44, 59, 59, 59, 43, 14, 44, 59, 24, 25, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 87, 87, 26, 27, 59, 59, 59, 59, 59, 59, 51, 52, 23, 53, 54, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 87, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 25, 87,
        87, 28, 29, 32, 32, 32, 17, 18, 59, 59, 59, 15, 16, 32, 32, 32, 32, 17, 18, 59, 59, 15, 16, 32, 32, 32, 17, 18, 59, 59, 59, 24, 25, 87, 87, 87, 26, 27, 59, 59, 59, 15, 16, 32, 32, 32, 17, 18, 59, 59, 59, 15, 16, 32, 32, 32, 17, 18, 59, 59, 15, 16, 32, 32, 32, 32, 32, 30, 31, 87,
        87, 1, 2, 5, 5, 5, 35, 36, 59, 59, 59, 33, 34, 5, 5, 5, 5, 35, 36, 59, 59, 33, 34, 5, 5, 5, 35, 36, 59, 59, 59, 24, 25, 87, 87, 87, 26, 27, 59, 59, 59, 33, 34, 4, 87, 1, 35, 36, 59, 59, 59, 33, 34, 5, 5, 5, 35, 36, 59, 59, 33, 34, 5, 5, 5, 5, 5, 3, 4, 87,
        87, 10, 11, 14, 14, 14, 44, 45, 59, 59, 59, 42, 43, 14, 14, 14, 14, 44, 45, 59, 59, 42, 43, 14, 14, 14, 44, 45, 59, 59, 59, 24, 25, 87, 87, 87, 26, 27, 59, 59, 59, 42, 66, 13, 87, 10, 69, 45, 59, 59, 59, 42, 43, 14, 14, 14, 44, 45, 59, 59, 42, 43, 14, 14, 14, 14, 14, 12, 13, 87,
        87, 19, 20, 23, 23, 23, 53, 54, 59, 59, 59, 51, 52, 23, 23, 23, 23, 53, 54, 59, 59, 51, 52, 23, 23, 23, 53, 54, 59, 59, 59, 24, 25, 87, 87, 87, 26, 27, 59, 59, 59, 51, 21, 22, 87, 26, 20, 54, 59, 59, 59, 51, 52, 23, 23, 23, 53, 54, 59, 59, 51, 52, 23, 23, 23, 23, 23, 21, 22, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 87, 87, 26, 27, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 87, 87, 26, 27, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87,
        87, 26, 27, 59, 15, 16, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 17, 18, 59, 15, 16, 32, 32, 32, 32, 32, 17, 18, 59, 24, 25, 87, 87, 87, 26, 27, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 15, 16, 32, 32, 32, 32, 32, 32, 32, 32, 17, 18, 59, 15, 16, 32, 30, 31, 87,
        87, 26, 27, 59, 33, 34, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 35, 36, 59, 33, 34, 5, 5, 5, 5, 5, 35, 36, 59, 24, 25, 87, 87, 87, 26, 27, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 24, 25, 87, 1, 2, 5, 5, 5, 5, 5, 35, 36, 59, 33, 34, 5, 3, 4, 87,
        87, 26, 27, 59, 42, 43, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 44, 45, 59, 42, 43, 14, 14, 14, 14, 14, 44, 45, 59, 24, 25, 87, 87, 87, 26, 27, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 24, 25, 87, 10, 11, 14, 14, 14, 14, 14, 44, 45, 59, 42, 43, 14, 12, 13, 87,
        87, 26, 27, 59, 51, 52, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 53, 54, 59, 59, 52, 23, 23, 23, 23, 23, 53, 54, 59, 24, 25, 87, 87, 87, 26, 27, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 24, 25, 87, 19, 20, 23, 23, 23, 23, 23, 53, 54, 59, 51, 52, 23, 21, 22, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 87, 87, 26, 27, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87,
        87, 26, 27, 15, 16, 32, 32, 32, 17, 59, 59, 59, 16, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 17, 18, 59, 24, 25, 87, 87, 87, 26, 27, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87,
        87, 26, 27, 33, 34, 5, 5, 5, 35, 36, 59, 59, 34, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 35, 36, 59, 33, 34, 5, 5, 5, 35, 36, 59, 59, 59, 59, 33, 34, 5, 35, 36, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87,
        87, 26, 27, 42, 43, 14, 14, 14, 44, 45, 59, 59, 43, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 44, 45, 59, 42, 43, 14, 14, 14, 44, 45, 59, 59, 59, 59, 42, 43, 14, 44, 45, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87,
        87, 26, 27, 51, 52, 23, 23, 23, 53, 54, 59, 59, 52, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 53, 54, 59, 51, 52, 23, 23, 23, 53, 54, 59, 59, 59, 59, 51, 52, 23, 53, 54, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87,
        87, 28, 29, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 30, 31, 87, 28, 29, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 30, 31, 87,
        87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87,
        87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87,
        87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87,
        87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87,
        87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87,
        87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87,
        87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87,
        87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87
      }
    },
    {
      type = "objectgroup",
      name = "Wall",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 1,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 0,
          y = 0,
          width = 2240,
          height = 288,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 2,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 0,
          y = 1248,
          width = 2240,
          height = 288,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 3,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 0,
          y = 288,
          width = 64,
          height = 960,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 2176,
          y = 288,
          width = 64,
          height = 960,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 160,
          y = 384,
          width = 128,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 288,
          y = 288,
          width = 96,
          height = 192,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 128,
          y = 544,
          width = 192,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 480,
          y = 384,
          width = 160,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 736,
          y = 384,
          width = 160,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 10,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 576,
          y = 288,
          width = 224,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 448,
          y = 544,
          width = 480,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1024,
          y = 384,
          width = 160,
          height = 800,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 13,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1280,
          y = 288,
          width = 96,
          height = 288,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 14,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1440,
          y = 352,
          width = 96,
          height = 320,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 17,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1632,
          y = 352,
          width = 96,
          height = 320,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 18,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1824,
          y = 352,
          width = 96,
          height = 320,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 19,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 2016,
          y = 352,
          width = 96,
          height = 320,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 20,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 64,
          y = 736,
          width = 160,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 21,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 384,
          y = 736,
          width = 160,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 22,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 704,
          y = 736,
          width = 160,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 23,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 160,
          y = 928,
          width = 448,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 24,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 704,
          y = 928,
          width = 224,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 25,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 128,
          y = 1088,
          width = 160,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 26,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 384,
          y = 1088,
          width = 544,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 27,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1344,
          y = 736,
          width = 160,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 28,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1376,
          y = 832,
          width = 96,
          height = 352,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 29,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1664,
          y = 736,
          width = 160,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 30,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1952,
          y = 736,
          width = 224,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 31,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1664,
          y = 928,
          width = 96,
          height = 320,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 32,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1760,
          y = 928,
          width = 224,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 33,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 2080,
          y = 928,
          width = 96,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      name = "Door H",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 38,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1984,
          y = 960,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      name = "Door V",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {}
    },
    {
      type = "objectgroup",
      name = "Portals",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 35,
          name = "Stairs Down",
          type = "portal",
          shape = "rectangle",
          x = 256,
          y = 288,
          width = 32,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {
            ["dx"] = 288,
            ["dy"] = 352,
            ["room"] = 2
          }
        }
      }
    },
    {
      type = "objectgroup",
      name = "Item",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 41,
          name = "",
          type = "",
          shape = "rectangle",
          x = 672,
          y = 416,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 42,
          name = "",
          type = "",
          shape = "rectangle",
          x = 608,
          y = 736,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 43,
          name = "",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 864,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 44,
          name = "",
          type = "",
          shape = "rectangle",
          x = 960,
          y = 1056,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 45,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1536,
          y = 352,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 46,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1760,
          y = 384,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 47,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1920,
          y = 352,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 48,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2112,
          y = 352,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 49,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2112,
          y = 1152,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 50,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1792,
          y = 1152,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 51,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1216,
          y = 320,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 52,
          name = "",
          type = "",
          shape = "rectangle",
          x = 288,
          y = 1152,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 112,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1600,
          y = 1184,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 113,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1312,
          y = 864,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      name = "Paths",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 53,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 192,
          y = 320,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "54",
            ["multifloor"] = true,
            ["multifloorID"] = 153,
            ["multifloorIndex"] = 2
          }
        },
        {
          id = 54,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 96,
          y = 320,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "53,55"
          }
        },
        {
          id = 55,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 96,
          y = 480,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "54,56,57"
          }
        },
        {
          id = 56,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 384,
          y = 512,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "55,59,58,61"
          }
        },
        {
          id = 57,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 64,
          y = 672,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "55,62"
          }
        },
        {
          id = 58,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 384,
          y = 672,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "62,56,71"
          }
        },
        {
          id = 59,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 416,
          y = 320,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "56,60"
          }
        },
        {
          id = 60,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 512,
          y = 320,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "59"
          }
        },
        {
          id = 61,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 672,
          y = 480,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "56,76"
          }
        },
        {
          id = 62,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 288,
          y = 672,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "57,58,63"
          }
        },
        {
          id = 63,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 288,
          y = 864,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "62,64"
          }
        },
        {
          id = 64,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 96,
          y = 864,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "63,65"
          }
        },
        {
          id = 65,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 96,
          y = 1024,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "64,66,68"
          }
        },
        {
          id = 66,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 96,
          y = 1184,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "65,67"
          }
        },
        {
          id = 67,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 320,
          y = 1184,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "66,68,75"
          }
        },
        {
          id = 68,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 320,
          y = 1056,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "65,69,67"
          }
        },
        {
          id = 69,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 640,
          y = 1024,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "70,68,74"
          }
        },
        {
          id = 70,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 640,
          y = 864,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "71,63,73,69"
          }
        },
        {
          id = 71,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 640,
          y = 672,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "58,72,70"
          }
        },
        {
          id = 72,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 960,
          y = 672,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "76,71,73"
          }
        },
        {
          id = 73,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 960,
          y = 864,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "72,70,74"
          }
        },
        {
          id = 74,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 960,
          y = 1024,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "73,69,75"
          }
        },
        {
          id = 75,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 960,
          y = 1184,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "74,67,80"
          }
        },
        {
          id = 76,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 960,
          y = 480,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "61,77,72"
          }
        },
        {
          id = 77,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 960,
          y = 320,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "76,78"
          }
        },
        {
          id = 78,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1216,
          y = 320,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "77,79"
          }
        },
        {
          id = 79,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1216,
          y = 640,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "78,96,83"
          }
        },
        {
          id = 80,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1216,
          y = 1184,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "83,75,81"
          }
        },
        {
          id = 81,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1568,
          y = 1184,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "80,82"
          }
        },
        {
          id = 82,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1568,
          y = 864,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "95,81,97"
          }
        },
        {
          id = 83,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1248,
          y = 960,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "79,80"
          }
        },
        {
          id = 86,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1408,
          y = 320,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "87,114"
          }
        },
        {
          id = 87,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1568,
          y = 320,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "86,88,95"
          }
        },
        {
          id = 88,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1760,
          y = 320,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "87,89,94"
          }
        },
        {
          id = 89,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1952,
          y = 320,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "88,90,92"
          }
        },
        {
          id = 90,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 2112,
          y = 320,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "89,91"
          }
        },
        {
          id = 91,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 2112,
          y = 672,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "90,92"
          }
        },
        {
          id = 92,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1952,
          y = 672,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "91,89,93"
          }
        },
        {
          id = 93,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1888,
          y = 704,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "92,94,97"
          }
        },
        {
          id = 94,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1760,
          y = 672,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "93,95,88"
          }
        },
        {
          id = 95,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1568,
          y = 672,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "114,87,94,82"
          }
        },
        {
          id = 96,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1312,
          y = 640,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "79,114,83"
          }
        },
        {
          id = 97,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1888,
          y = 864,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "93,82,98"
          }
        },
        {
          id = 98,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 2016,
          y = 864,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "97,99"
          }
        },
        {
          id = 99,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 2016,
          y = 1120,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "98,100"
          }
        },
        {
          id = 100,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1824,
          y = 1120,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "99"
          }
        },
        {
          id = 114,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1408,
          y = 672,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "86,96,95"
          }
        }
      }
    }
  }
}
