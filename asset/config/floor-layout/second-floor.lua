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
  nextobjectid = 374,
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
        87, 1, 2, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 3, 4, 87, 1, 2, 5, 5, 5, 3, 4, 87, 1, 2, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 3, 4, 87, 1, 2, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 3, 4, 87,
        87, 10, 11, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 12, 13, 87, 10, 11, 14, 14, 14, 12, 13, 87, 10, 11, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 12, 13, 87, 10, 11, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 12, 13, 87,
        87, 19, 20, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 21, 22, 87, 19, 20, 23, 23, 23, 21, 22, 87, 19, 20, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 21, 22, 87, 19, 20, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 21, 22, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 24, 25, 87, 26, 27, 59, 15, 16, 32, 32, 32, 32, 32, 17, 18, 59, 24, 25, 87, 26, 27, 59, 15, 16, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 17, 18, 59, 24, 25, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 24, 25, 87, 26, 27, 59, 33, 34, 5, 5, 3, 4, 87, 26, 27, 59, 24, 25, 87, 26, 27, 59, 33, 34, 5, 3, 4, 87, 1, 2, 5, 3, 4, 87, 1, 2, 5, 5, 5, 5, 5, 5, 35, 36, 59, 24, 25, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 24, 25, 87, 26, 27, 59, 42, 43, 14, 14, 12, 13, 87, 26, 27, 59, 24, 25, 87, 26, 27, 59, 42, 43, 14, 12, 13, 87, 10, 11, 14, 12, 13, 87, 10, 11, 14, 14, 14, 14, 14, 14, 44, 45, 59, 24, 25, 87,
        87, 26, 27, 15, 16, 32, 32, 32, 32, 32, 32, 17, 18, 59, 24, 25, 87, 26, 27, 59, 15, 16, 30, 31, 87, 26, 27, 59, 51, 52, 23, 23, 21, 22, 87, 26, 27, 59, 24, 25, 87, 26, 27, 59, 51, 52, 23, 21, 22, 87, 19, 20, 23, 21, 22, 87, 19, 20, 23, 23, 23, 23, 23, 23, 53, 54, 59, 24, 25, 87,
        87, 26, 27, 24, 25, 87, 1, 2, 5, 5, 5, 35, 36, 59, 33, 34, 5, 35, 36, 59, 33, 34, 5, 5, 5, 35, 36, 59, 59, 59, 59, 59, 33, 34, 5, 35, 36, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87,
        87, 26, 27, 24, 25, 87, 10, 11, 14, 14, 14, 44, 45, 59, 42, 43, 14, 44, 45, 59, 42, 43, 14, 14, 14, 44, 45, 59, 59, 59, 59, 59, 42, 43, 14, 44, 45, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87,
        87, 26, 27, 24, 25, 87, 19, 20, 23, 23, 23, 53, 54, 59, 51, 52, 23, 53, 54, 59, 51, 52, 23, 23, 23, 53, 54, 59, 59, 59, 59, 59, 51, 52, 23, 53, 54, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87,
        87, 26, 27, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87,
        87, 26, 27, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 28, 29, 32, 17, 18, 59, 24, 25, 87, 26, 27, 59, 24, 25, 87, 26, 27, 59, 15, 16, 32, 32, 32, 32, 32, 32, 30, 31, 87,
        87, 26, 27, 24, 25, 87, 28, 29, 32, 32, 32, 17, 18, 59, 59, 16, 32, 17, 59, 59, 15, 16, 32, 32, 32, 32, 32, 32, 32, 32, 17, 18, 59, 59, 59, 59, 59, 59, 33, 34, 5, 5, 5, 5, 35, 36, 59, 33, 34, 5, 35, 36, 59, 33, 34, 5, 35, 36, 59, 33, 34, 5, 5, 5, 5, 5, 5, 3, 4, 87,
        87, 26, 27, 33, 34, 5, 5, 5, 5, 5, 5, 35, 36, 59, 24, 25, 87, 26, 27, 59, 24, 25, 87, 1, 2, 5, 5, 5, 5, 5, 35, 36, 59, 59, 59, 59, 59, 59, 42, 43, 14, 14, 14, 14, 44, 45, 59, 42, 43, 14, 44, 45, 59, 42, 43, 14, 44, 45, 59, 42, 43, 14, 14, 14, 14, 14, 14, 12, 13, 87,
        87, 26, 27, 42, 43, 14, 14, 14, 14, 14, 14, 44, 45, 59, 24, 25, 87, 26, 27, 59, 24, 25, 87, 10, 11, 14, 14, 14, 14, 14, 44, 45, 59, 59, 59, 59, 59, 59, 51, 52, 23, 23, 23, 23, 53, 54, 59, 51, 52, 23, 53, 54, 59, 51, 52, 23, 53, 54, 59, 51, 52, 23, 23, 23, 23, 23, 23, 21, 22, 87,
        87, 26, 27, 51, 52, 23, 23, 23, 23, 23, 23, 53, 54, 59, 24, 25, 87, 26, 27, 59, 24, 25, 87, 19, 20, 23, 23, 23, 23, 23, 53, 54, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 15, 16, 32, 32, 32, 32, 17, 18, 59, 15, 16, 32, 17, 18, 59, 15, 16, 32, 17, 18, 59, 15, 16, 32, 32, 32, 32, 17, 18, 24, 25, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 24, 25, 87, 26, 27, 59, 59, 15, 16, 32, 17, 18, 59, 59, 59, 59, 59, 59, 24, 25, 87, 1, 2, 5, 35, 36, 59, 24, 25, 87, 26, 27, 59, 24, 25, 87, 26, 27, 59, 33, 34, 5, 3, 4, 87, 26, 27, 24, 25, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 24, 25, 87, 26, 27, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 24, 25, 87, 10, 11, 14, 44, 45, 59, 24, 25, 87, 26, 27, 59, 24, 25, 87, 26, 27, 59, 42, 43, 14, 12, 13, 87, 26, 27, 24, 25, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 24, 25, 87, 26, 27, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 24, 25, 87, 19, 20, 23, 53, 54, 59, 24, 25, 87, 26, 27, 59, 24, 25, 87, 26, 27, 59, 51, 52, 23, 21, 22, 87, 26, 27, 24, 25, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 24, 25, 87, 26, 27, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 24, 25, 87, 26, 27, 24, 25, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 24, 25, 87, 26, 27, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 24, 25, 87, 26, 27, 24, 25, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 24, 25, 87, 26, 27, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 24, 25, 87, 26, 27, 24, 25, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 24, 25, 87, 26, 27, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 24, 25, 87, 26, 27, 24, 25, 87,
        87, 26, 27, 59, 15, 16, 32, 32, 32, 32, 32, 17, 18, 59, 24, 25, 87, 26, 27, 59, 24, 25, 87, 26, 27, 59, 15, 16, 31, 87, 26, 27, 59, 59, 59, 59, 59, 59, 24, 25, 87, 28, 29, 32, 32, 32, 32, 30, 31, 87, 26, 27, 59, 24, 25, 87, 28, 29, 32, 17, 18, 59, 24, 25, 87, 26, 27, 24, 25, 87,
        87, 26, 27, 59, 24, 25, 87, 1, 2, 5, 5, 35, 36, 59, 33, 34, 5, 35, 36, 59, 33, 34, 5, 35, 36, 59, 33, 34, 5, 5, 35, 36, 59, 59, 59, 59, 59, 59, 33, 34, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 35, 36, 59, 33, 34, 5, 5, 5, 5, 35, 36, 59, 33, 34, 5, 35, 36, 24, 25, 87,
        87, 26, 27, 59, 24, 25, 87, 10, 11, 14, 14, 44, 45, 59, 42, 43, 14, 44, 45, 59, 42, 43, 14, 44, 45, 59, 42, 43, 14, 14, 44, 45, 59, 59, 59, 59, 59, 59, 42, 43, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 44, 45, 59, 42, 43, 14, 14, 14, 14, 44, 45, 59, 42, 43, 14, 44, 45, 24, 25, 87,
        87, 26, 27, 59, 24, 25, 87, 19, 20, 23, 23, 53, 54, 59, 51, 52, 23, 53, 54, 59, 51, 52, 23, 53, 54, 59, 51, 52, 23, 23, 53, 54, 59, 59, 59, 59, 59, 59, 51, 52, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 53, 54, 59, 51, 52, 23, 23, 23, 23, 53, 54, 59, 51, 52, 23, 53, 54, 24, 25, 87,
        87, 26, 27, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87,
        87, 26, 27, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87,
        87, 26, 27, 59, 24, 25, 87, 26, 27, 59, 15, 16, 32, 32, 32, 32, 32, 32, 32, 32, 17, 18, 59, 59, 59, 15, 16, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 17, 18, 59, 59, 59, 59, 15, 16, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 30, 31, 87,
        87, 26, 27, 59, 33, 34, 5, 35, 36, 59, 24, 25, 87, 1, 2, 5, 5, 3, 4, 87, 26, 27, 59, 59, 59, 33, 34, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 35, 36, 59, 59, 59, 59, 33, 34, 5, 5, 3, 4, 87, 1, 2, 5, 5, 5, 5, 5, 5, 3, 4, 87, 87, 87, 87,
        87, 26, 27, 59, 42, 43, 14, 44, 45, 59, 24, 25, 87, 10, 11, 14, 14, 12, 13, 87, 26, 27, 59, 59, 59, 42, 43, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 44, 45, 59, 59, 59, 59, 42, 43, 14, 14, 12, 13, 87, 10, 11, 14, 14, 14, 14, 14, 14, 12, 13, 87, 87, 87, 87,
        87, 26, 27, 59, 51, 52, 23, 53, 54, 59, 24, 25, 87, 19, 20, 23, 23, 21, 22, 87, 26, 27, 59, 59, 59, 51, 52, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 53, 54, 59, 59, 59, 59, 51, 52, 23, 23, 21, 22, 87, 19, 20, 23, 23, 23, 23, 23, 23, 21, 22, 87, 87, 87, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 24, 25, 87, 87, 87, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 59, 59, 59, 24, 25, 87, 87, 87, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 15, 16, 32, 32, 17, 18, 59, 59, 59, 59, 59, 59, 59, 59, 15, 16, 32, 32, 32, 32, 32, 32, 32, 32, 32, 17, 18, 59, 24, 25, 87, 26, 27, 59, 15, 16, 32, 32, 32, 30, 31, 87, 87, 87, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 24, 25, 87, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 87, 1, 2, 5, 5, 5, 5, 5, 35, 36, 59, 24, 25, 87, 26, 27, 59, 33, 34, 5, 5, 5, 3, 4, 87, 87, 87, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 26, 27, 59, 59, 24, 25, 87, 26, 27, 59, 59, 59, 24, 25, 87, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 87, 10, 11, 14, 14, 14, 14, 14, 44, 45, 59, 24, 25, 87, 26, 27, 59, 42, 43, 14, 14, 14, 12, 13, 87, 87, 87, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 33, 34, 5, 35, 36, 59, 59, 33, 34, 5, 35, 36, 59, 59, 59, 24, 25, 87, 87, 28, 29, 32, 32, 32, 32, 32, 32, 32, 32, 30, 31, 87, 87, 19, 20, 23, 23, 23, 23, 23, 53, 54, 59, 33, 34, 5, 35, 36, 59, 51, 52, 23, 23, 23, 21, 34, 5, 3, 4, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 42, 43, 14, 44, 45, 59, 59, 42, 43, 14, 44, 45, 59, 59, 59, 24, 25, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 42, 43, 14, 44, 45, 59, 59, 59, 59, 59, 59, 42, 43, 14, 12, 13, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 51, 52, 23, 53, 54, 59, 59, 51, 52, 23, 53, 54, 59, 59, 59, 24, 25, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 51, 52, 23, 53, 54, 59, 59, 59, 59, 59, 59, 51, 52, 23, 21, 22, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87,
        87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 26, 27, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 24, 25, 87,
        87, 28, 29, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 30, 31, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 28, 29, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 30, 31, 87,
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
          id = 35,
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
          id = 36,
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
          id = 37,
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
          id = 38,
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
          x = 224,
          y = 224,
          width = 160,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 42,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 480,
          y = 64,
          width = 96,
          height = 256,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 43,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 672,
          y = 224,
          width = 160,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 44,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 736,
          y = 64,
          width = 96,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 46,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1056,
          y = 224,
          width = 96,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 47,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 928,
          y = 128,
          width = 224,
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
          x = 1248,
          y = 64,
          width = 96,
          height = 416,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 49,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1344,
          y = 384,
          width = 96,
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
          x = 1536,
          y = 224,
          width = 96,
          height = 256,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 52,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1440,
          y = 128,
          width = 640,
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
          x = 1728,
          y = 224,
          width = 96,
          height = 256,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 55,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1920,
          y = 384,
          width = 256,
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
          x = 1248,
          y = 576,
          width = 96,
          height = 352,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 57,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1536,
          y = 576,
          width = 96,
          height = 352,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 58,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1344,
          y = 832,
          width = 192,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 59,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1344,
          y = 576,
          width = 96,
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
          x = 1728,
          y = 576,
          width = 96,
          height = 352,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 61,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 2016,
          y = 576,
          width = 96,
          height = 352,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 63,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1920,
          y = 576,
          width = 96,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 65,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1824,
          y = 832,
          width = 96,
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
          x = 2080,
          y = 1024,
          width = 96,
          height = 352,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 68,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1600,
          y = 1024,
          width = 480,
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
          x = 1728,
          y = 1120,
          width = 96,
          height = 256,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 71,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1920,
          y = 1216,
          width = 160,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 72,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 832,
          y = 1024,
          width = 576,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 73,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1280,
          y = 1216,
          width = 128,
          height = 256,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 74,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1408,
          y = 1216,
          width = 224,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 77,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 960,
          y = 1312,
          width = 320,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 79,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 832,
          y = 1216,
          width = 128,
          height = 256,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 81,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 576,
          y = 1120,
          width = 96,
          height = 256,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 82,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 352,
          y = 1024,
          width = 320,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 83,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 352,
          y = 1120,
          width = 96,
          height = 256,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 86,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 864,
          y = 832,
          width = 128,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 87,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 896,
          y = 608,
          width = 96,
          height = 224,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 88,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 768,
          y = 416,
          width = 224,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 89,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 672,
          y = 416,
          width = 96,
          height = 512,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 90,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 480,
          y = 416,
          width = 96,
          height = 512,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 93,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 224,
          y = 416,
          width = 160,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 94,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 160,
          y = 832,
          width = 224,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 95,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 160,
          y = 928,
          width = 96,
          height = 192,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 129,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 128,
          y = 224,
          width = 96,
          height = 288,
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
          id = 96,
          name = "",
          type = "",
          shape = "rectangle",
          x = 384,
          y = 256,
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
          x = 576,
          y = 256,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 98,
          name = "",
          type = "",
          shape = "rectangle",
          x = 832,
          y = 160,
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
          x = 1440,
          y = 416,
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
          x = 1440,
          y = 608,
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
          x = 1632,
          y = 864,
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
          y = 416,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 104,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1824,
          y = 608,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 105,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1920,
          y = 864,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 106,
          name = "",
          type = "",
          shape = "rectangle",
          x = 384,
          y = 448,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 107,
          name = "",
          type = "",
          shape = "rectangle",
          x = 384,
          y = 864,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 108,
          name = "",
          type = "",
          shape = "rectangle",
          x = 256,
          y = 1056,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 109,
          name = "",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 864,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 110,
          name = "",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 1056,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 111,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1824,
          y = 1248,
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
          x = 1632,
          y = 1248,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 114,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1344,
          y = 160,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 115,
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
          id = 123,
          name = "",
          type = "",
          shape = "rectangle",
          x = 768,
          y = 864,
          width = 96,
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
          x = 1152,
          y = 160,
          width = 96,
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
          x = 1632,
          y = 320,
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
          id = 116,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1280,
          y = 480,
          width = 32,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 117,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2048,
          y = 480,
          width = 32,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 118,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2048,
          y = 928,
          width = 32,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 119,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1760,
          y = 1376,
          width = 32,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 120,
          name = "",
          type = "",
          shape = "rectangle",
          x = 608,
          y = 1376,
          width = 32,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 121,
          name = "",
          type = "",
          shape = "rectangle",
          x = 384,
          y = 1376,
          width = 32,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 122,
          name = "",
          type = "",
          shape = "rectangle",
          x = 928,
          y = 512,
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
          id = 126,
          name = "Stairs Up",
          type = "portal",
          shape = "rectangle",
          x = 224,
          y = 320,
          width = 32,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {
            ["dx"] = 192,
            ["dy"] = 320,
            ["room"] = 4
          }
        },
        {
          id = 127,
          name = "Stairs Down",
          type = "portal",
          shape = "rectangle",
          x = 960,
          y = 1280,
          width = 320,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["dx"] = 1088,
            ["dy"] = 1152,
            ["room"] = 1
          }
        },
        {
          id = 131,
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
            ["dx"] = 2112,
            ["dy"] = 1280,
            ["room"] = 3
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
          id = 133,
          name = "",
          type = "",
          shape = "rectangle",
          x = 608,
          y = 96,
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
          x = 864,
          y = 224,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 135,
          name = "",
          type = "",
          shape = "rectangle",
          x = 800,
          y = 544,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 136,
          name = "",
          type = "",
          shape = "rectangle",
          x = 832,
          y = 768,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 137,
          name = "",
          type = "",
          shape = "rectangle",
          x = 320,
          y = 576,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 138,
          name = "",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 768,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 139,
          name = "",
          type = "",
          shape = "rectangle",
          x = 416,
          y = 96,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 140,
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
          id = 141,
          name = "",
          type = "",
          shape = "rectangle",
          x = 480,
          y = 1152,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 142,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1440,
          y = 1408,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 143,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1952,
          y = 704,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 144,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1376,
          y = 768,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 145,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1376,
          y = 256,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 146,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1856,
          y = 256,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 147,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2048,
          y = 288,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 149,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2016,
          y = 1152,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 326,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1664,
          y = 256,
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
          id = 150,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 608,
          y = 128,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "151"
          }
        },
        {
          id = 151,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 608,
          y = 352,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "150,152,167,176"
          }
        },
        {
          id = 152,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 416,
          y = 352,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "153,151,154,158"
          }
        },
        {
          id = 153,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 288,
          y = 352,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "152",
            ["multifloor"] = true,
            ["multifloorID"] = 53,
            ["multifloorIndex"] = 4
          }
        },
        {
          id = 154,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 416,
          y = 128,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "152,155"
          }
        },
        {
          id = 155,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 64,
          y = 128,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "154,156"
          }
        },
        {
          id = 156,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 64,
          y = 544,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "155,157,158,159"
          }
        },
        {
          id = 157,
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
            ["connections"] = "156,158,159,160"
          }
        },
        {
          id = 158,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 416,
          y = 544,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "156,157,159,152"
          }
        },
        {
          id = 159,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 416,
          y = 736,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "156,157,158,168"
          }
        },
        {
          id = 160,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 96,
          y = 960,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "157,161"
          }
        },
        {
          id = 161,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 96,
          y = 1152,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "160,162,163"
          }
        },
        {
          id = 162,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 288,
          y = 1152,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "161,163,166"
          }
        },
        {
          id = 163,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 224,
          y = 1408,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "161,162,164"
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
            ["connections"] = "163,165,327"
          }
        },
        {
          id = 165,
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
            ["connections"] = "164,215"
          }
        },
        {
          id = 166,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 288,
          y = 960,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "162,168"
          }
        },
        {
          id = 167,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 608,
          y = 960,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "168,151,169"
          }
        },
        {
          id = 168,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 416,
          y = 960,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "159,166,167"
          }
        },
        {
          id = 169,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 704,
          y = 992,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "167,170,215"
          }
        },
        {
          id = 170,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 800,
          y = 960,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "169,171,202"
          }
        },
        {
          id = 171,
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
            ["connections"] = "170,172"
          }
        },
        {
          id = 172,
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
            ["connections"] = "171,175"
          }
        },
        {
          id = 175,
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
            ["connections"] = "211,172,202"
          }
        },
        {
          id = 176,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 992,
          y = 352,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "151,177,210,211,178"
          }
        },
        {
          id = 177,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 992,
          y = 256,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "176,178"
          }
        },
        {
          id = 178,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 864,
          y = 256,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "181,177,176"
          }
        },
        {
          id = 181,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 864,
          y = 96,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "178,182"
          }
        },
        {
          id = 182,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1184,
          y = 96,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "181,183"
          }
        },
        {
          id = 183,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1184,
          y = 224,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "182,210"
          }
        },
        {
          id = 184,
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
            ["connections"] = "187,198,185,211"
          }
        },
        {
          id = 185,
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
            ["connections"] = "184,194,196,219"
          }
        },
        {
          id = 186,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1664,
          y = 256,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "219"
          }
        },
        {
          id = 187,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1472,
          y = 256,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "188,184"
          }
        },
        {
          id = 188,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1376,
          y = 256,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "187,189"
          }
        },
        {
          id = 189,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1344,
          y = 64,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "188,190"
          }
        },
        {
          id = 190,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1632,
          y = 64,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "189,191"
          }
        },
        {
          id = 191,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 2144,
          y = 64,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "190,192"
          }
        },
        {
          id = 192,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 2112,
          y = 288,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "191,193"
          }
        },
        {
          id = 193,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1856,
          y = 288,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "192,194"
          }
        },
        {
          id = 194,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1856,
          y = 512,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "185,193,195,221"
          }
        },
        {
          id = 195,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1856,
          y = 736,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "194,214"
          }
        },
        {
          id = 196,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1664,
          y = 704,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "185,197"
          }
        },
        {
          id = 197,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1664,
          y = 960,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "196,213,217"
          }
        },
        {
          id = 198,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1472,
          y = 736,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "184"
          }
        },
        {
          id = 199,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 2112,
          y = 512,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "221,200"
          }
        },
        {
          id = 200,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 2112,
          y = 960,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "199,213"
          }
        },
        {
          id = 202,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1088,
          y = 960,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "175,170,217"
          }
        },
        {
          id = 204,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1664,
          y = 1152,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "218,205"
          }
        },
        {
          id = 205,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1664,
          y = 1312,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "206,207,204"
          }
        },
        {
          id = 206,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1472,
          y = 1376,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "205,207"
          }
        },
        {
          id = 207,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1664,
          y = 1408,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "205,206,208"
          }
        },
        {
          id = 208,
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
            ["connections"] = "207,209,222"
          }
        },
        {
          id = 209,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1856,
          y = 1152,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "208,328"
          }
        },
        {
          id = 210,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1184,
          y = 352,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "176,183,211"
          }
        },
        {
          id = 211,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1088,
          y = 512,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "210,184,175,176"
          }
        },
        {
          id = 213,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1952,
          y = 960,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "197,214,200"
          }
        },
        {
          id = 214,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1952,
          y = 736,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "195,213"
          }
        },
        {
          id = 215,
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
            ["connections"] = "169,165,216"
          }
        },
        {
          id = 216,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1088,
          y = 1152,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "215,218",
            ["multifloor"] = true,
            ["multifloorID"] = 203,
            ["multifloorIndex"] = 1
          }
        },
        {
          id = 217,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1472,
          y = 960,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "197,202,218"
          }
        },
        {
          id = 218,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1472,
          y = 1152,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "204,216,217"
          }
        },
        {
          id = 219,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1664,
          y = 384,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "185,186"
          }
        },
        {
          id = 221,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1984,
          y = 512,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "194,199"
          }
        },
        {
          id = 222,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1984,
          y = 1408,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "208",
            ["multifloor"] = true,
            ["multifloorID"] = 182,
            ["multifloorIndex"] = 3
          }
        },
        {
          id = 327,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 480,
          y = 1184,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "164"
          }
        },
        {
          id = 328,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 2016,
          y = 1152,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "209"
          }
        }
      }
    }
  }
}
