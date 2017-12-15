SCREEN_WIDTH = 1600;
SCREEN_HEIGHT = 900;
FULLSCREEN = false;

KEY_LEFT = "a";
KEY_RIGHT = "d";
KEY_UP = "w";
KEY_DOWN = "s";
KEY_RUN = "lshift";
KEY_QUIT = "escape";
KEY_PAUSE = "return";

KEY_LIGHT_UP = "up";
KEY_LIGHT_DOWN = "down";
KEY_LIGHT_LEFT = "left";
KEY_LIGHT_RIGHT = "right";

CAMERA_START_X = 1140;
CAMERA_START_Y = 1086;
CAMERA_LEFT_BOUND = 600;
CAMERA_RIGHT_BOUND = SCREEN_WIDTH - CAMERA_LEFT_BOUND;
CAMERA_TOP_BOUND = 400;
CAMERA_BOTTOM_BOUND = SCREEN_HEIGHT - CAMERA_TOP_BOUND;

TILE_SIZE = 32;
FLOOR_WIDTH = 70 * TILE_SIZE;
FLOOR_HEIGHT = 48 * TILE_SIZE;
FLOOR_GAP = 500;

PLAYER_SCALE = 2;
PLAYER_IMAGE_WIDTH = 20;
PLAYER_IMAGE_HEIGHT = 20;
PLAYER_WIDTH = 20 * PLAYER_SCALE;
PLAYER_HEIGHT = 20 * PLAYER_SCALE;
PLAYER_WALK_SPEED = 200;
PLAYER_RUN_SPEED = 400;
PLAYER_INITIAL_DIMENSIONS = {
  x = 1030,
  y = 1360,
  w = PLAYER_WIDTH,
  h = PLAYER_HEIGHT
};

DOOR_OPEN_TIMER = 0.3;
DOOR_THICKNESS = 10;
DOOR_LENGTH = 96;
DOOR_OFFSET = 12;

ITEM_WORLD_SCALE = 2;
ITEM_IMAGE_WIDTH = 16;
ITEM_IMAGE_HEIGHT = 16;
ITEM_WIDTH = ITEM_IMAGE_WIDTH * ITEM_WORLD_SCALE;
ITEM_HEIGHT = ITEM_IMAGE_HEIGHT * ITEM_WORLD_SCALE;

INVENTORY_ITEM_X = 20;
INVENTORY_ITEM_Y = 520;
INVENTORY_ITEM_WIDTH = 60;
INVENTORY_ITEM_HEIGHT = 60;

INVENTORY_MAP = {
	world = {
		["meat"] = {x = 0, y = 0},
		["trap"] = {x = 16, y = 0},
		["shotgun"] = {x = 32, y = 0},
		["shotgun_rounds"] = {x = 48, y = 0},
		["taser"] = {x = 64, y = 0},
		["cellphone_dead"] = {x = 80, y = 0},
		["cellphone_live"] = {x = 0, y = 16},
		["cellphone_battery"] = {x = 16, y = 16},
		["bucket"] = {x = 32, y = 16},
		["fuse"] = {x = 48, y = 16},
		["book"] = {x = 64, y = 16},
		["cross"] = {x = 80, y = 16},
		["stake"] = {x = 0, y = 32},
		["knife"] = {x = 16, y = 32},
		["music_box"] = {x = 32, y = 32},
		["battery"] = {x = 48, y = 32},
		["foil"] = {x = 64, y = 32},
		["axe"] = {x = 80, y = 32},
		["gasoline"] = {x = 0, y = 48},
		["lighter"] = {x = 16, y = 48},
		["crystal"] = {x = 32, y = 48},
		["scroll"] = {x = 48, y = 48}
	},
	held = {
		["meat"] = {x = 0, y = 0},
		["trap"] = {x = 60, y = 0},
		["shotgun"] = {x = 120, y = 0},
		["shotgun_rounds"] = {x = 180, y = 0},
		["taser"] = {x = 240, y = 0},
		["cellphone_dead"] = {x = 300, y = 0},
		["cellphone_live"] = {x = 0, y = 60},
		["cellphone_battery"] = {x = 60, y = 60},
		["bucket"] = {x = 120, y = 60},
		["fuse"] = {x = 180, y = 60},
		["book"] = {x = 240, y = 60},
		["cross"] = {x = 300, y = 60},
		["stake"] = {x = 0, y = 120},
		["knife"] = {x = 60, y = 120},
		["music_box"] = {x = 120, y = 120},
		["battery"] = {x = 180, y = 120},
		["foil"] = {x = 240, y = 120},
		["axe"] = {x = 300, y = 120},
		["gasoline"] = {x = 0, y = 180},
		["lighter"] = {x = 60, y = 180},
		["crystal"] = {x = 120, y = 180},
		["scroll"] = {x = 180, y = 180}
	}
};

SCENARIO_ITEMS = {
  ["wolf"] = {"meat", "trap", "shotgun", "shotgun_rounds"}
}

-- Debug Variables
DRAW_BOXES = true;