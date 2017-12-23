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
  nextobjectid = 269,
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
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59
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
          x = 64,
          y = 224,
          width = 352,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 41,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 512,
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
          x = 128,
          y = 416,
          width = 96,
          height = 960,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 44,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 320,
          y = 320,
          width = 96,
          height = 128,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 47,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 608,
          y = 224,
          width = 64,
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
          x = 768,
          y = 224,
          width = 352,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 49,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1024,
          y = 64,
          width = 96,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 50,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1216,
          y = 224,
          width = 704,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 54,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1728,
          y = 64,
          width = 96,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 57,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1824,
          y = 416,
          width = 192,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 58,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1824,
          y = 512,
          width = 96,
          height = 416,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 61,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1216,
          y = 832,
          width = 608,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 63,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1216,
          y = 512,
          width = 96,
          height = 224,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 66,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1408,
          y = 608,
          width = 192,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 67,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1504,
          y = 512,
          width = 96,
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
          x = 1216,
          y = 416,
          width = 512,
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
          x = 1696,
          y = 1312,
          width = 288,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 74,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1696,
          y = 1024,
          width = 160,
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
          x = 1504,
          y = 1024,
          width = 96,
          height = 448,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 80,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1952,
          y = 1024,
          width = 224,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 86,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 512,
          y = 416,
          width = 544,
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
          x = 512,
          y = 512,
          width = 96,
          height = 416,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 88,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 608,
          y = 832,
          width = 32,
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
          x = 736,
          y = 832,
          width = 320,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 90,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 960,
          y = 512,
          width = 96,
          height = 224,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 94,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 704,
          y = 512,
          width = 96,
          height = 224,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 95,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 224,
          y = 1024,
          width = 96,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 96,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 416,
          y = 1024,
          width = 320,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 97,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 640,
          y = 1120,
          width = 96,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 98,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 640,
          y = 1376,
          width = 96,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 102,
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
          id = 103,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 832,
          y = 1120,
          width = 96,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 104,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1312,
          y = 1120,
          width = 96,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 105,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 832,
          y = 1216,
          width = 128,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 106,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1280,
          y = 1216,
          width = 128,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 107,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 864,
          y = 1312,
          width = 96,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 108,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1280,
          y = 1312,
          width = 96,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 256,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 800,
          y = 640,
          width = 64,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 259,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 2016,
          y = 160,
          width = 96,
          height = 768,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 261,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1760,
          y = 1120,
          width = 96,
          height = 192,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 263,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 2080,
          y = 1312,
          width = 96,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 264,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 832,
          y = 64,
          width = 96,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      name = "Door H",
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 109,
          name = "",
          type = "",
          shape = "rectangle",
          x = 416,
          y = 256,
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
          x = 224,
          y = 416,
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
          x = 320,
          y = 1056,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 116,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1600,
          y = 1056,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 117,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1600,
          y = 1344,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 118,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1984,
          y = 1344,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 120,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1856,
          y = 1056,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 122,
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
          id = 125,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1728,
          y = 448,
          width = 96,
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
          x = 1920,
          y = 256,
          width = 96,
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
          x = 672,
          y = 256,
          width = 96,
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
          x = 640,
          y = 864,
          width = 96,
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
          x = 864,
          y = 672,
          width = 96,
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
          x = 1312,
          y = 640,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 265,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1120,
          y = 256,
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
          id = 129,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2048,
          y = 64,
          width = 32,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 136,
          name = "",
          type = "",
          shape = "rectangle",
          x = 992,
          y = 736,
          width = 32,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 137,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1248,
          y = 736,
          width = 32,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 140,
          name = "",
          type = "",
          shape = "rectangle",
          x = 672,
          y = 1280,
          width = 32,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 141,
          name = "",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 1376,
          width = 32,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 266,
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
          id = 268,
          name = "",
          type = "",
          shape = "rectangle",
          x = 864,
          y = 128,
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
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 143,
          name = "Stairs Up",
          type = "portal",
          shape = "rectangle",
          x = 928,
          y = 1120,
          width = 32,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {
            ["dx"] = 2060,
            ["dy"] = 2160,
            ["room"] = 2
          }
        },
        {
          id = 144,
          name = "Stairs Up",
          type = "portal",
          shape = "rectangle",
          x = 1280,
          y = 1120,
          width = 32,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {
            ["dx"] = 2060,
            ["dy"] = 2160,
            ["room"] = 2
          }
        },
        {
          id = 145,
          name = "Stairs Down",
          type = "portal",
          shape = "rectangle",
          x = 1920,
          y = 512,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["dx"] = 4200,
            ["dy"] = 700,
            ["room"] = 3
          }
        },
        {
          id = 146,
          name = "Stairs Down",
          type = "portal",
          shape = "rectangle",
          x = 64,
          y = 64,
          width = 32,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {
            ["dx"] = 240,
            ["dy"] = 280,
            ["room"] = 3
          }
        },
        {
          id = 148,
          name = "Shute",
          type = "portal",
          shape = "rectangle",
          x = 608,
          y = 512,
          width = 96,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {
            ["dx"] = 2680,
            ["dy"] = 1400,
            ["room"] = 3
          }
        }
      }
    },
    {
      type = "objectgroup",
      name = "Item",
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 152,
          name = "",
          type = "",
          shape = "rectangle",
          x = 960,
          y = 96,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 153,
          name = "",
          type = "",
          shape = "rectangle",
          x = 832,
          y = 544,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 154,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1440,
          y = 544,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 155,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1344,
          y = 160,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 156,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1760,
          y = 768,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 157,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1856,
          y = 96,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 158,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1664,
          y = 96,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 159,
          name = "",
          type = "",
          shape = "rectangle",
          x = 256,
          y = 960,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 162,
          name = "",
          type = "",
          shape = "rectangle",
          x = 288,
          y = 1344,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 163,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2016,
          y = 1440,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 164,
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
          id = 165,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2112,
          y = 1248,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 166,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1888,
          y = 1248,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 167,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1696,
          y = 1248,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 168,
          name = "",
          type = "",
          shape = "rectangle",
          x = 544,
          y = 1408,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 267,
          name = "",
          type = "",
          shape = "rectangle",
          x = 672,
          y = 96,
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
          id = 170,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 160,
          y = 128,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "171"
          }
        },
        {
          id = 171,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 448,
          y = 128,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "170,194"
          }
        },
        {
          id = 172,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 768,
          y = 1408,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "189,174"
          }
        },
        {
          id = 173,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 256,
          y = 480,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "175,195,196,178"
          }
        },
        {
          id = 174,
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
            ["connections"] = "172,203,241"
          }
        },
        {
          id = 175,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 448,
          y = 480,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "194,173,195,196"
          }
        },
        {
          id = 176,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1120,
          y = 960,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "239,201,240"
          }
        },
        {
          id = 178,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 256,
          y = 352,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "173,179"
          }
        },
        {
          id = 179,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 96,
          y = 352,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "178,180"
          }
        },
        {
          id = 180,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 96,
          y = 608,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "179,181"
          }
        },
        {
          id = 181,
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
            ["connections"] = "180,183"
          }
        },
        {
          id = 183,
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
            ["connections"] = "181,184"
          }
        },
        {
          id = 184,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 256,
          y = 1408,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "183,185,188"
          }
        },
        {
          id = 185,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 256,
          y = 1216,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "184,238"
          }
        },
        {
          id = 186,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 352,
          y = 960,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "195,196,192,238"
          }
        },
        {
          id = 187,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 544,
          y = 1152,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "188,238"
          }
        },
        {
          id = 188,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 544,
          y = 1312,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "184,187,238,189"
          }
        },
        {
          id = 189,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 768,
          y = 1312,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "188,172,239"
          }
        },
        {
          id = 190,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1248,
          y = 1152,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "203"
          }
        },
        {
          id = 191,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 960,
          y = 1152,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "203"
          }
        },
        {
          id = 192,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 672,
          y = 960,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "186,234,239"
          }
        },
        {
          id = 193,
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
            ["connections"] = "234"
          }
        },
        {
          id = 194,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 448,
          y = 352,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "171,175,236"
          }
        },
        {
          id = 195,
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
            ["connections"] = "173,175,186,196"
          }
        },
        {
          id = 196,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 288,
          y = 736,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "173,175,186,195"
          }
        },
        {
          id = 198,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 704,
          y = 160,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "236,221"
          }
        },
        {
          id = 201,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1120,
          y = 768,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "225,235,213,176"
          }
        },
        {
          id = 202,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 896,
          y = 576,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "235"
          }
        },
        {
          id = 203,
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
            ["connections"] = "191,190,174"
          }
        },
        {
          id = 204,
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
            ["connections"] = "205,231,230"
          }
        },
        {
          id = 205,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1888,
          y = 960,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "204,206,242"
          }
        },
        {
          id = 206,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1632,
          y = 960,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "205,207,240"
          }
        },
        {
          id = 207,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1632,
          y = 1184,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "206,208"
          }
        },
        {
          id = 208,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1632,
          y = 1408,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "207,209"
          }
        },
        {
          id = 209,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 2016,
          y = 1408,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "208,211"
          }
        },
        {
          id = 211,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 2016,
          y = 1248,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "209,212,242"
          }
        },
        {
          id = 212,
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
            ["connections"] = "211,242"
          }
        },
        {
          id = 213,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1344,
          y = 768,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "201,218,214"
          }
        },
        {
          id = 214,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1568,
          y = 768,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "213,217"
          }
        },
        {
          id = 215,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1472,
          y = 352,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "225,232"
          }
        },
        {
          id = 216,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1760,
          y = 544,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "217,232"
          }
        },
        {
          id = 217,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1760,
          y = 768,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "214,216"
          }
        },
        {
          id = 218,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1344,
          y = 544,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "213,233"
          }
        },
        {
          id = 219,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1408,
          y = 128,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "223,224"
          }
        },
        {
          id = 221,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 960,
          y = 160,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "198"
          }
        },
        {
          id = 223,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1152,
          y = 128,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "219,225"
          }
        },
        {
          id = 224,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1632,
          y = 128,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "219"
          }
        },
        {
          id = 225,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1152,
          y = 352,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "201,236,215,223"
          }
        },
        {
          id = 226,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1952,
          y = 96,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "227,237"
          }
        },
        {
          id = 227,
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
            ["connections"] = "226,228"
          }
        },
        {
          id = 228,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 2112,
          y = 416,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "227,229"
          }
        },
        {
          id = 229,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 2112,
          y = 736,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "228,230"
          }
        },
        {
          id = 230,
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
            ["connections"] = "204,229"
          }
        },
        {
          id = 231,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1952,
          y = 576,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "204"
          }
        },
        {
          id = 232,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1760,
          y = 352,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "215,216,237"
          }
        },
        {
          id = 233,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1440,
          y = 544,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "218"
          }
        },
        {
          id = 234,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 672,
          y = 768,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "193,235,192"
          }
        },
        {
          id = 235,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 896,
          y = 768,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "201,234,202"
          }
        },
        {
          id = 236,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 704,
          y = 352,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "194,198,225"
          }
        },
        {
          id = 237,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1952,
          y = 352,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "226,232"
          }
        },
        {
          id = 238,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 352,
          y = 1152,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "185,187,188,186"
          }
        },
        {
          id = 239,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 768,
          y = 960,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "189,192,176"
          }
        },
        {
          id = 240,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1440,
          y = 960,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "176,206,241"
          }
        },
        {
          id = 241,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1440,
          y = 1408,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "174,240"
          }
        },
        {
          id = 242,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1888,
          y = 1152,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "205,211,212"
          }
        }
      }
    }
  }
}
