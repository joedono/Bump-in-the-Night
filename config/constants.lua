SCREEN_WIDTH = 1600;
SCREEN_HEIGHT = 900;
SCREEN_WIDTH_WHOLE_HOUSE = 5000;
SCREEN_HEIGHT_WHOLE_HOUSE = 3800;
FULLSCREEN = false;

-- Debug Variables
DRAW_BOXES = false;
DRAW_PORTALS = true;
DRAW_PATHS = false;
DRAW_LIGHTS = true;
KILL_PLAYER = true;
DRAW_MONSTER_PATH = false;
DRAW_MONSTER_SENSES = false;
DRAW_ENTIRE_HOUSE = false;
LOAD_SAVE_ENABLED = false;

KEY_LEFT = "a";
KEY_RIGHT = "d";
KEY_UP = "w";
KEY_DOWN = "s";
KEY_MENU_LEFT = "left";
KEY_MENU_RIGHT = "right";
KEY_MENU_UP = "up";
KEY_MENU_DOWN = "down";
KEY_FLASHLIGHT = "";
KEY_RUN = "lshift";
KEY_ITEM_LEFT = "q";
KEY_ITEM_RIGHT = "e";
KEY_ITEM_USE = "f";
KEY_QUIT = "escape";
KEY_PAUSE = "return";

KEY_LIGHT_LEFT = "left";
KEY_LIGHT_RIGHT = "right";
KEY_LIGHT_UP = "up";
KEY_LIGHT_DOWN = "down";

GAMEPAD_LEFT = "dpleft";
GAMEPAD_RIGHT = "dpright";
GAMEPAD_UP = "dpup";
GAMEPAD_DOWN = "dpdown";
GAMEPAD_FLASHLIGHT = "";
GAMEPAD_RUN = "";
GAMEPAD_ITEM_LEFT = "leftshoulder";
GAMEPAD_ITEM_RIGHT = "rightshoulder";
GAMEPAD_ITEM_USE = "a";
GAMEPAD_START = "start";
GAMEPAD_QUIT = "back";

GAMEPAD_DEADZONE = 0.75;

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
  x = 1090,
  y = 1290,
  w = PLAYER_WIDTH,
  h = PLAYER_HEIGHT
};

DOOR_OPEN_TIMER = 0.3;
DOOR_THICKNESS = 32;
DOOR_LENGTH = 96;
DOOR_OFFSET = 0;

ITEM_WORLD_SCALE = 1;
ITEM_IMAGE_WIDTH = 32;
ITEM_IMAGE_HEIGHT = 32;
ITEM_WIDTH = ITEM_IMAGE_WIDTH * ITEM_WORLD_SCALE;
ITEM_HEIGHT = ITEM_IMAGE_HEIGHT * ITEM_WORLD_SCALE;
ITEM_GLOW_RATE = 10;

HUD_SCALE = 1;
HUD_HEIGHT = 100 * HUD_SCALE;

INVENTORY_ITEM_X = 20;
INVENTORY_ITEM_Y = 520;
INVENTORY_ITEM_WIDTH = 60;
INVENTORY_ITEM_HEIGHT = 60;

PATH_NODE_SIZE = 1;

MONSTER_SCALE = 1;

MONSTER_WOLF_WIDTH = 32 * MONSTER_SCALE;
MONSTER_WOLF_HEIGHT = 32 * MONSTER_SCALE;
MONSTER_WOLF_WALK_SPEED = 200;
MONSTER_WOLF_INVESTIGATE_SPEED = 300;
MONSTER_WOLF_ACTIVE_CHASE_SPEED = 500;
MONSTER_WOLF_PASSIVE_CHASE_SPEED = 400;
MONSTER_WOLF_RUN_HEAR_DISTANCE = 500;
MONSTER_WOLF_WALK_HEAR_DISTANCE = 200;
MONSTER_WOLF_SIGHT_DISTANCE = 500;
MONSTER_WOLF_SIGHT_CONE = math.pi * 1/4;

MONSTER_PANTHER_WIDTH = 32 * MONSTER_SCALE;
MONSTER_PANTHER_HEIGHT = 32 * MONSTER_SCALE;
MONSTER_PANTHER_WALK_SPEED = 200;
MONSTER_PANTHER_INVESTIGATE_SPEED = 300;
MONSTER_PANTHER_ACTIVE_CHASE_SPEED = 500;
MONSTER_PANTHER_PASSIVE_CHASE_SPEED = 400;
MONSTER_PANTHER_TRAPPED_CHASE_SPEED = 100;
MONSTER_PANTHER_RUN_HEAR_DISTANCE = 500;
MONSTER_PANTHER_SIGHT_DISTANCE = 350;
MONSTER_PANTHER_SIGHT_CONE = math.pi * 1/4;
MONSTER_PANTHER_HUNT_CHANCE = 25;
MONSTER_PANTHER_EYES_PLAYER_DISTANCE = 400;

SHOTGUN_RANGE = 75;
SHOTGUN_MIN_SIZE = 30;

INVENTORY_MAP = {
	world = {
		["meat"] = {x = 0, y = 0},
		["trap"] = {x = 32, y = 0},
		["shotgun"] = {x = 64, y = 0},
		["shotgun_rounds"] = {x = 96, y = 0},
		["taser"] = {x = 128, y = 0},
		["cellphone_dead"] = {x = 160, y = 0},
		["cellphone_live"] = {x = 0, y = 32},
		["cellphone_battery"] = {x = 32, y = 32},
		["bucket"] = {x = 64, y = 32},
		["fuse"] = {x = 96, y = 32},
		["book"] = {x = 128, y = 32},
		["cross"] = {x = 160, y = 32},
		["stake"] = {x = 0, y = 64},
		["knife"] = {x = 32, y = 64},
		["music_box"] = {x = 64, y = 64},
		["battery"] = {x = 96, y = 64},
		["foil"] = {x = 128, y = 64},
		["axe"] = {x = 160, y = 64},
		["gasoline"] = {x = 0, y = 96},
		["lighter"] = {x = 32, y = 96},
		["crystal"] = {x = 64, y = 96},
		["scroll"] = {x = 96, y = 96}
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

SCENARIO_SELECTION = {
  {"wolf", "panther", "wolf", "wolf"},
  {"wolf", "random", "wolf"},
  {"wolf", "wolf", "wolf", "wolf"}
};

-- SCENARIO_SELECTION = {
--   {"wolf", "panther", "burgler", "arson"},
--   {"killer", "random", "vampire"},
--   {"ghost", "alien", "zombie", "elder_god"}
-- };

SCENARIO_ALL = {"wolf", "panther", "burgler", "arson", "killer", "vampire", "ghost", "alien", "zombie", "elder_god"};
SCENARIO_COMPLETED = {};

SCENARIO_ITEMS = {
  ["wolf"] = {"meat", "trap", "shotgun", "shotgun_rounds"},
  ["panther"] = {"meat", "trap", "shotgun", "shotgun_rounds"},
  ["burgler"] = {"taser", "cellphone_dead", "cellphone_battery"},
  ["arson"] = {"taser", "cellphone_dead", "cellphone_battery", "bucket"},
  ["killer"] = {"taser", "cellphone_dead", "cellphone_battery", "fuse"},
  ["vampire"] = {"book", "stake", "knife", "cross"},
  ["ghost"] = {"book"},
  ["alien"] = {"music_box", "battery", "foil"},
  ["zombie"] = {"axe", "shotgun", "shotgun_rounds", "gasoline", "lighter"},
  ["elder_god"] = {"crystal", "scroll"}
};