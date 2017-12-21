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
  nextobjectid = 101,
  properties = {},
  tilesets = {
    {
      name = "Attic",
      firstgid = 1,
      filename = "../../wip/config/attic.tsx",
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../../image/floor1.png",
      imagewidth = 32,
      imageheight = 32,
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
      tilecount = 1,
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
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
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
          width = 32,
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
          x = 2208,
          y = 288,
          width = 32,
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
          x = 128,
          y = 450.166,
          width = 160,
          height = 29.834,
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
          width = 32,
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
          height = 128,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 448,
          y = 384,
          width = 192,
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
          width = 192,
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
          x = 608,
          y = 288,
          width = 160,
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
          height = 128,
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
          x = 1568,
          y = 352,
          width = 64,
          height = 320,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 15,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1440,
          y = 352,
          width = 64,
          height = 320,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 16,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1696,
          y = 352,
          width = 64,
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
          x = 1824,
          y = 352,
          width = 64,
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
          x = 1952,
          y = 352,
          width = 64,
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
          x = 2080,
          y = 352,
          width = 64,
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
          x = 32,
          y = 736,
          width = 160,
          height = 64,
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
          height = 64,
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
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 23,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 128,
          y = 896,
          width = 480,
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
          y = 896,
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
          height = 64,
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
          y = 800,
          width = 96,
          height = 384,
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
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 30,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1984,
          y = 736,
          width = 224,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 31,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1696,
          y = 928,
          width = 32,
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
          x = 1728,
          y = 928,
          width = 288,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 33,
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 2112,
          y = 928,
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
          x = 2016,
          y = 928,
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
          height = 160,
          rotation = 0,
          visible = true,
          properties = {
            ["dx"] = 250,
            ["dy"] = 345,
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
          x = 992,
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
          x = 2016,
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
          x = 1248,
          y = 288,
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
          y = 352,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "54"
          }
        },
        {
          id = 54,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 64,
          y = 352,
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
          x = 64,
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
          x = 352,
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
          x = 352,
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
          x = 352,
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
          x = 256,
          y = 704,
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
          x = 256,
          y = 832,
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
          x = 64,
          y = 832,
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
          x = 64,
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
          x = 64,
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
          y = 1024,
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
          y = 832,
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
          y = 704,
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
          y = 704,
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
          y = 832,
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
            ["connections"] = "78,80,83"
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
            ["connections"] = "75,79,81"
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
            ["connections"] = "95,96,81,97"
          }
        },
        {
          id = 83,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1376,
          y = 672,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "79,96,84"
          }
        },
        {
          id = 84,
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
            ["connections"] = "83,85"
          }
        },
        {
          id = 85,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1536,
          y = 320,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "84,86,96"
          }
        },
        {
          id = 86,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1664,
          y = 320,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "85,87,95"
          }
        },
        {
          id = 87,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1792,
          y = 320,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "86,88,94"
          }
        },
        {
          id = 88,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1920,
          y = 320,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "87,89,93"
          }
        },
        {
          id = 89,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 2048,
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
          x = 2144,
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
          x = 2144,
          y = 672,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "92,90"
          }
        },
        {
          id = 92,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 2016,
          y = 672,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "91,93,89"
          }
        },
        {
          id = 93,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1888,
          y = 672,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "92,94,88,97"
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
            ["connections"] = "93,95,87"
          }
        },
        {
          id = 95,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1632,
          y = 672,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "94,86,96,82"
          }
        },
        {
          id = 96,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1504,
          y = 672,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "83,85,95,82"
          }
        },
        {
          id = 97,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 1888,
          y = 832,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "82,93,98"
          }
        },
        {
          id = 98,
          name = "",
          type = "path",
          shape = "rectangle",
          x = 2048,
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
          x = 2048,
          y = 1088,
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
          y = 1088,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["connections"] = "99"
          }
        }
      }
    }
  }
}
