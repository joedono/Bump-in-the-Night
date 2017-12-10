SCREEN_WIDTH = 800;
SCREEN_HEIGHT = 600;

CAMERA_LEFT_BOUND = 200;
CAMERA_RIGHT_BOUND = SCREEN_WIDTH - CAMERA_LEFT_BOUND;
CAMERA_TOP_BOUND = 200;
CAMERA_BOTTOM_BOUND = SCREEN_HEIGHT - CAMERA_TOP_BOUND;

PLAYER_SPEED = 100;
PLAYER_RUN_SPEED = 200;
FLASHLIGHT_TURN_SPEED = 3;

UP_KEY = "w";
DOWN_KEY = "s";
LEFT_KEY = "a";
RIGHT_KEY = "d";

UP_LIGHT_KEY = "up";
DOWN_LIGHT_KEY = "down";
LEFT_LIGHT_KEY = "left";
RIGHT_LIGHT_KEY = "right";

FLASHLIGHT_TOGGLE_KEY = " ";
RUN_KEY = "lshift";

HUD_HEIGHT = 100;

PORTAL_WIDTH = 16;
PORTAL_HEIGHT = 16;

WALL_WIDTH = 16;
WALL_HEIGHT = 16;

DOOR_OPEN_TIMER = 0.3;
DOOR_THICKNESS = 5;
DOOR_LENGTH = 48;

ITEM_WIDTH = 16;
ITEM_HEIGHT = 16;
ITEM_GLOW_RATE = 5;

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

DEBUG_LIGHTING_ENABLED = true;
DEBUG_DRAW_PORTALS = true;
DEBUG_MOUSE_POSITION = true;