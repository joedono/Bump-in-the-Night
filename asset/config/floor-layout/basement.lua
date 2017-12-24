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
  nextobjectid = 217,
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
        87, 1, 2, 5, 5, 5, 5, 3, 4, 87, 1, 2, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 3, 4, 87,
        87, 10, 11, 14, 14, 14, 14, 12, 13, 87, 10, 11, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 12, 13, 87,
        87, 19, 20, 23, 23, 23, 23, 21, 22, 87, 19, 20, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 21, 22, 87,
        87, 26, 27, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87,
        87, 26, 27, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 15, 16, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 17, 59, 59, 24, 25, 87,
        87, 26, 27, 59, 15, 16, 32, 30, 31, 87, 26, 27, 59, 33, 34, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 35, 36, 59, 24, 25, 87,
        87, 26, 27, 59, 33, 34, 5, 5, 5, 5, 35, 36, 59, 42, 43, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 44, 45, 59, 24, 25, 87,
        87, 26, 27, 59, 42, 43, 14, 14, 14, 14, 44, 45, 59, 51, 52, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 53, 54, 59, 24, 25, 87,
        87, 26, 27, 59, 51, 52, 23, 23, 23, 23, 53, 54, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 15, 16, 32, 17, 18, 59, 24, 25, 87,
        87, 26, 27, 59, 15, 16, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 17, 18, 59, 24, 25, 87, 26, 27, 59, 24, 25, 87,
        87, 26, 27, 59, 24, 25, 87, 1, 2, 5, 5, 5, 5, 5, 5, 3, 4, 87, 1, 2, 5, 5, 5, 5, 5, 5, 5, 5, 5, 3, 4, 87, 1, 2, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 3, 4, 87, 26, 27, 59, 24, 25, 87, 26, 27, 59, 24, 25, 87,
        87, 26, 27, 59, 24, 25, 87, 10, 11, 14, 14, 14, 14, 14, 14, 12, 13, 87, 10, 11, 14, 14, 14, 14, 14, 14, 14, 14, 14, 12, 13, 87, 10, 11, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 12, 13, 87, 26, 27, 59, 24, 25, 87, 26, 27, 59, 24, 25, 87,
        87, 26, 27, 59, 24, 25, 87, 19, 20, 23, 23, 23, 23, 23, 23, 21, 22, 87, 19, 20, 23, 23, 23, 23, 23, 23, 23, 23, 23, 33, 34, 5, 35, 36, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 21, 22, 87, 26, 27, 59, 24, 25, 87, 26, 27, 59, 24, 25, 87,
        87, 26, 27, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 42, 43, 14, 44, 45, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 24, 25, 87, 26, 27, 59, 24, 25, 87,
        87, 26, 27, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 51, 52, 23, 53, 54, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 24, 25, 87, 28, 29, 32, 30, 31, 87,
        87, 26, 27, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 33, 34, 5, 5, 5, 5, 3, 4, 87,
        87, 26, 27, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 42, 43, 14, 14, 14, 14, 12, 13, 87,
        87, 26, 27, 59, 24, 25, 87, 28, 29, 32, 32, 32, 17, 18, 59, 24, 25, 87, 28, 29, 32, 32, 32, 17, 59, 59, 15, 16, 32, 32, 32, 32, 17, 18, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 15, 16, 32, 32, 32, 32, 17, 59, 59, 15, 16, 30, 31, 87, 26, 27, 59, 51, 52, 23, 23, 23, 23, 21, 22, 87,
        87, 26, 27, 59, 33, 34, 5, 5, 5, 5, 5, 5, 35, 36, 59, 33, 34, 5, 5, 5, 5, 5, 5, 35, 36, 59, 33, 34, 5, 5, 5, 5, 35, 36, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 1, 2, 5, 35, 36, 59, 33, 34, 5, 5, 5, 35, 36, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87,
        87, 26, 27, 59, 42, 43, 14, 14, 14, 14, 14, 14, 44, 45, 59, 42, 43, 14, 14, 14, 14, 14, 14, 44, 45, 59, 42, 43, 14, 14, 14, 14, 44, 45, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 10, 11, 14, 44, 45, 59, 42, 43, 14, 14, 14, 44, 45, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87,
        87, 26, 27, 59, 51, 52, 23, 23, 23, 23, 23, 23, 53, 54, 59, 51, 52, 23, 23, 23, 23, 23, 23, 53, 54, 59, 51, 52, 23, 23, 23, 23, 53, 54, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 19, 20, 23, 53, 54, 59, 51, 52, 23, 23, 23, 53, 54, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87,
        87, 26, 27, 59, 59, 16, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 17, 59, 59, 59, 16, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 30, 31, 87, 26, 27, 59, 59, 16, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 17, 59, 59, 59, 59, 24, 25, 87,
        87, 26, 27, 59, 33, 34, 5, 5, 5, 5, 5, 3, 4, 87, 87, 87, 87, 87, 87, 1, 2, 5, 5, 5, 5, 5, 35, 36, 59, 33, 34, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 35, 36, 59, 24, 25, 87, 1, 2, 5, 5, 5, 5, 5, 5, 5, 35, 36, 59, 59, 59, 24, 25, 87,
        87, 26, 27, 59, 42, 43, 14, 14, 14, 14, 14, 12, 13, 87, 87, 87, 87, 87, 87, 10, 11, 14, 14, 14, 14, 14, 44, 45, 59, 42, 43, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 44, 45, 59, 24, 25, 87, 10, 11, 14, 14, 14, 14, 14, 14, 14, 44, 45, 59, 59, 59, 24, 25, 87,
        87, 26, 27, 59, 51, 52, 23, 23, 23, 23, 23, 21, 22, 87, 87, 87, 87, 87, 87, 19, 20, 23, 23, 23, 23, 23, 53, 54, 59, 51, 52, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 53, 54, 59, 24, 25, 87, 19, 20, 23, 23, 23, 23, 23, 23, 23, 53, 54, 59, 59, 59, 24, 25, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 87, 87, 87, 87, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 87, 87, 87, 87, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87,
        87, 28, 29, 32, 32, 32, 32, 32, 17, 59, 59, 24, 25, 87, 87, 87, 87, 87, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 15, 16, 32, 32, 32, 32, 17, 59, 59, 15, 16, 32, 32, 32, 32, 32, 32, 32, 17, 18, 59, 24, 25, 87, 26, 27, 59, 59, 59, 15, 16, 32, 17, 18, 59, 59, 59, 59, 24, 25, 87,
        87, 1, 2, 5, 5, 5, 5, 5, 35, 36, 59, 33, 34, 5, 5, 5, 3, 4, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 1, 2, 5, 35, 36, 59, 33, 34, 5, 5, 5, 5, 3, 4, 87, 26, 27, 59, 24, 25, 87, 26, 27, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 24, 25, 87,
        87, 10, 11, 14, 14, 14, 14, 14, 44, 45, 59, 42, 43, 14, 14, 14, 12, 13, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 10, 11, 14, 44, 45, 59, 42, 43, 14, 14, 14, 14, 12, 13, 87, 26, 27, 59, 24, 25, 87, 28, 29, 32, 32, 32, 30, 31, 87, 28, 29, 32, 32, 32, 32, 30, 31, 87,
        87, 19, 20, 23, 23, 23, 23, 23, 53, 54, 59, 51, 52, 23, 23, 23, 21, 22, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 19, 20, 23, 53, 54, 59, 51, 52, 23, 23, 23, 23, 21, 22, 87, 26, 27, 59, 24, 25, 87, 1, 2, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 3, 4, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 24, 25, 87, 10, 11, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 12, 13, 87,
        87, 26, 27, 59, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 16, 32, 32, 32, 17, 59, 59, 24, 25, 87, 26, 27, 59, 33, 34, 5, 35, 20, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 21, 22, 87,
        87, 26, 27, 59, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 24, 25, 87, 1, 2, 35, 36, 59, 24, 25, 87, 26, 27, 59, 42, 43, 14, 44, 45, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87,
        87, 26, 27, 59, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 24, 25, 87, 10, 11, 44, 45, 59, 24, 25, 87, 26, 27, 59, 51, 52, 23, 53, 54, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87,
        87, 26, 27, 59, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 24, 25, 87, 19, 20, 53, 54, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87,
        87, 26, 27, 59, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 59, 33, 34, 5, 35, 36, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 15, 16, 31, 87, 28, 29, 32, 32, 32, 30, 31, 87, 28, 29, 32, 32, 32, 32, 32, 32, 32, 17, 18, 59, 15, 16, 32, 32, 32, 17, 18, 59, 24, 25, 87,
        87, 26, 27, 59, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 59, 42, 43, 14, 44, 45, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 33, 34, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 35, 36, 59, 24, 25, 87, 87, 87, 26, 27, 59, 24, 25, 87,
        87, 26, 27, 59, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 59, 51, 52, 23, 53, 54, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 42, 43, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 44, 45, 59, 24, 25, 87, 87, 87, 26, 27, 59, 24, 25, 87,
        87, 26, 27, 59, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 51, 52, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 53, 54, 59, 24, 25, 87, 87, 87, 26, 27, 59, 24, 25, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 87, 87, 26, 27, 59, 24, 25, 87,
        87, 28, 29, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 30, 31, 87, 28, 29, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 30, 31, 87, 87, 87, 28, 29, 32, 30, 31, 87,
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
          id = 36,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 0,
          y = 0,
          width = 2240,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 37,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 0,
          y = 1472,
          width = 2240,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 38,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 0,
          y = 64,
          width = 64,
          height = 1408,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 39,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 2176,
          y = 64,
          width = 64,
          height = 1408,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 40,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 160,
          y = 160,
          width = 192,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 43,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 448,
          y = 128,
          width = 1632,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 45,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 160,
          y = 352,
          width = 1728,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 46,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1984,
          y = 320,
          width = 96,
          height = 288,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 47,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 2080,
          y = 512,
          width = 96,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 48,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1792,
          y = 448,
          width = 96,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 49,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1728,
          y = 608,
          width = 160,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 50,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1440,
          y = 608,
          width = 192,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 51,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1440,
          y = 704,
          width = 96,
          height = 192,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 52,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 2112,
          y = 800,
          width = 64,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 53,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1632,
          y = 800,
          width = 384,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 56,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1984,
          y = 1056,
          width = 192,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 57,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1632,
          y = 896,
          width = 96,
          height = 320,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 58,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1728,
          y = 1056,
          width = 160,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 60,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1152,
          y = 1312,
          width = 672,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 61,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1888,
          y = 992,
          width = 96,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 63,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1440,
          y = 1088,
          width = 96,
          height = 224,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 64,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1248,
          y = 992,
          width = 288,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 66,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 160,
          y = 448,
          width = 96,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 67,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 512,
          y = 608,
          width = 256,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 68,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 160,
          y = 800,
          width = 704,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 69,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 384,
          y = 896,
          width = 160,
          height = 192,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 70,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 544,
          y = 896,
          width = 96,
          height = 480,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 71,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 864,
          y = 608,
          width = 192,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 75,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 960,
          y = 992,
          width = 192,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 76,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 960,
          y = 1088,
          width = 96,
          height = 384,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 78,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1280,
          y = 1152,
          width = 64,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 79,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1184,
          y = 1152,
          width = 96,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 82,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 64,
          y = 992,
          width = 224,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 84,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 512,
          y = 448,
          width = 96,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 114,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 160,
          y = 608,
          width = 256,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 117,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 128,
          y = 1152,
          width = 352,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 118,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 128,
          y = 1312,
          width = 352,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 209,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1920,
          y = 1312,
          width = 160,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 211,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 960,
          y = 800,
          width = 480,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 212,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 960,
          y = 448,
          width = 96,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 213,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 256,
          y = 64,
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
          id = 92,
          name = "",
          type = "",
          shape = "rectangle",
          x = 352,
          y = 160,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 93,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2080,
          y = 160,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 94,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1632,
          y = 640,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 95,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2016,
          y = 832,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 96,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1152,
          y = 1024,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 97,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1344,
          y = 1184,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 99,
          name = "",
          type = "",
          shape = "rectangle",
          x = 288,
          y = 1024,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 100,
          name = "",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 832,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 101,
          name = "",
          type = "",
          shape = "rectangle",
          x = 768,
          y = 640,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 102,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1056,
          y = 1344,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 103,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1824,
          y = 1344,
          width = 96,
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
          x = 64,
          y = 192,
          width = 96,
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
          x = 416,
          y = 640,
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
      objects = {
        {
          id = 86,
          name = "",
          type = "",
          shape = "rectangle",
          x = 992,
          y = 512,
          width = 32,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 87,
          name = "",
          type = "",
          shape = "rectangle",
          x = 992,
          y = 704,
          width = 32,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 88,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1920,
          y = 896,
          width = 32,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 90,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1664,
          y = 1216,
          width = 32,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 91,
          name = "",
          type = "",
          shape = "rectangle",
          x = 576,
          y = 1376,
          width = 32,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 109,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2016,
          y = 224,
          width = 32,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 111,
          name = "",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 256,
          width = 32,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
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
          id = 105,
          name = "Stairs Up",
          type = "portal",
          shape = "rectangle",
          x = 224,
          y = 64,
          width = 32,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {
            ["dx"] = 160,
            ["dy"] = 128,
            ["room"] = 1
          }
        },
        {
          id = 107,
          name = "Stairs Up",
          type = "portal",
          shape = "rectangle",
          x = 2080,
          y = 480,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["dx"] = 1952,
            ["dy"] = 576,
            ["room"] = 1
          }
        },
        {
          id = 110,
          name = "Shute Exit",
          type = "",
          shape = "rectangle",
          x = 608,
          y = 448,
          width = 96,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {
            ["dx"] = 0,
            ["dy"] = 0,
            ["room"] = 0
          }
        },
        {
          id = 119,
          name = "Dumbwaiter",
          type = "portal",
          shape = "rectangle",
          x = 2080,
          y = 1376,
          width = 96,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {
            ["dx"] = 1984,
            ["dy"] = 1408,
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
          id = 122,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1344,
          y = 736,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 123,
          name = "",
          type = "",
          shape = "rectangle",
          x = 896,
          y = 480,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 124,
          name = "",
          type = "",
          shape = "rectangle",
          x = 288,
          y = 480,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 125,
          name = "",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 928,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 126,
          name = "",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 1408,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 127,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1376,
          y = 1248,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 128,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1088,
          y = 1120,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 129,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1760,
          y = 960,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 131,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1728,
          y = 480,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 132,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2112,
          y = 992,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 133,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1888,
          y = 256,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 134,
          name = "",
          type = "",
          shape = "rectangle",
          x = 384,
          y = 256,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 214,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2112,
          y = 1184,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 215,
          name = "",
          type = "",
          shape = "rectangle",
          x = 480,
          y = 1120,
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
          id = 135,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 160,
          y = 96,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "198",
            ["multifloor"] = true,
            ["multifloorID"] = 170,
            ["multifloorIndex"] = 1
          }
        },
        {
          id = 136,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 96,
          y = 576,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "197,137"
          }
        },
        {
          id = 137,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 96,
          y = 736,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "136,169,170"
          }
        },
        {
          id = 138,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 320,
          y = 1088,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "163,167,168"
          }
        },
        {
          id = 139,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 448,
          y = 512,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "140,170"
          }
        },
        {
          id = 140,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 320,
          y = 512,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "139"
          }
        },
        {
          id = 141,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 800,
          y = 544,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "156,157,142"
          }
        },
        {
          id = 142,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 736,
          y = 480,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "141"
          }
        },
        {
          id = 143,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1088,
          y = 544,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "156,144,190,184"
          }
        },
        {
          id = 144,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1088,
          y = 736,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "216,143,190,184"
          }
        },
        {
          id = 145,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1472,
          y = 512,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "146,190"
          }
        },
        {
          id = 146,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1664,
          y = 512,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "145,189"
          }
        },
        {
          id = 147,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1920,
          y = 640,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "148,191,196,195"
          }
        },
        {
          id = 148,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1920,
          y = 256,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "147,149,155"
          }
        },
        {
          id = 149,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 2112,
          y = 256,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "148,150,151"
          }
        },
        {
          id = 150,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 2112,
          y = 384,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "149",
            ["multifloor"] = true,
            ["multifloorID"] = 269,
            ["multifloorIndex"] = 1
          }
        },
        {
          id = 151,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 2112,
          y = 96,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "154,149"
          }
        },
        {
          id = 152,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 384,
          y = 96,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "153,154"
          }
        },
        {
          id = 153,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 384,
          y = 288,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "152,197,155"
          }
        },
        {
          id = 154,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1088,
          y = 96,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "151,152"
          }
        },
        {
          id = 155,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1088,
          y = 256,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "148,153"
          }
        },
        {
          id = 156,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 928,
          y = 544,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "141,143"
          }
        },
        {
          id = 157,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 800,
          y = 736,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "141,170,216"
          }
        },
        {
          id = 158,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 896,
          y = 928,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "166,172,159,160,216"
          }
        },
        {
          id = 159,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 832,
          y = 1152,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "158,166,161,160"
          }
        },
        {
          id = 160,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 704,
          y = 1152,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "158,159,166,161"
          }
        },
        {
          id = 161,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 704,
          y = 1408,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "160,164,159"
          }
        },
        {
          id = 162,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 96,
          y = 1408,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "163,164"
          }
        },
        {
          id = 163,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 96,
          y = 1120,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "138,162"
          }
        },
        {
          id = 164,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 480,
          y = 1408,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "162,167,161"
          }
        },
        {
          id = 166,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 704,
          y = 928,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "158,159,160"
          }
        },
        {
          id = 167,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 480,
          y = 1120,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "138,164"
          }
        },
        {
          id = 168,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 320,
          y = 928,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "169,138"
          }
        },
        {
          id = 169,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 96,
          y = 928,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "137,168"
          }
        },
        {
          id = 170,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 448,
          y = 736,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "137,139,157"
          }
        },
        {
          id = 171,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1568,
          y = 736,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "176,189"
          }
        },
        {
          id = 172,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1184,
          y = 928,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "158,176,173"
          }
        },
        {
          id = 173,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1184,
          y = 1088,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "172,174,177"
          }
        },
        {
          id = 174,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1376,
          y = 1120,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "175,173"
          }
        },
        {
          id = 175,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1376,
          y = 1248,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "174"
          }
        },
        {
          id = 176,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1568,
          y = 928,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "171,172,188"
          }
        },
        {
          id = 177,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1088,
          y = 1120,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "173,178"
          }
        },
        {
          id = 178,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1088,
          y = 1280,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "177,179"
          }
        },
        {
          id = 179,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1088,
          y = 1408,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "178,181"
          }
        },
        {
          id = 180,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1856,
          y = 1408,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "181,187"
          }
        },
        {
          id = 181,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1536,
          y = 1408,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "179,180"
          }
        },
        {
          id = 182,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 2112,
          y = 1280,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "183",
            ["multifloor"] = true,
            ["multifloorID"] = 222,
            ["multifloorIndex"] = 2
          }
        },
        {
          id = 183,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 2048,
          y = 1216,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "182,187"
          }
        },
        {
          id = 184,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1280,
          y = 704,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "143,144,190"
          }
        },
        {
          id = 186,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1760,
          y = 1248,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "187,188"
          }
        },
        {
          id = 187,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1856,
          y = 1216,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "180,186,183"
          }
        },
        {
          id = 188,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1568,
          y = 1248,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "176,186"
          }
        },
        {
          id = 189,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1664,
          y = 736,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "146,196,171"
          }
        },
        {
          id = 190,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1280,
          y = 544,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "143,144,184,145"
          }
        },
        {
          id = 191,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 2048,
          y = 640,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "147,195,196"
          }
        },
        {
          id = 192,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 2048,
          y = 928,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "195,193"
          }
        },
        {
          id = 193,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1792,
          y = 928,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "192"
          }
        },
        {
          id = 195,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 2048,
          y = 736,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "147,191,196,192"
          }
        },
        {
          id = 196,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1920,
          y = 736,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "147,191,195,189"
          }
        },
        {
          id = 197,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 96,
          y = 288,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "136,153,198"
          }
        },
        {
          id = 198,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 96,
          y = 96,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "135,197"
          }
        },
        {
          id = 216,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 896,
          y = 736,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "157,158,144"
          }
        }
      }
    }
  }
}
