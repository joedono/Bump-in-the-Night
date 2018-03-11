SCREEN_WIDTH = 1600;
SCREEN_HEIGHT = 900;
SCREEN_WIDTH_WHOLE_HOUSE = 5000;
SCREEN_HEIGHT_WHOLE_HOUSE = 3800;
FULLSCREEN = false;

-- Debug Variables
DRAW_BOXES = false;
DRAW_PORTALS = false;
DRAW_PATHS = false;
DRAW_LIGHTS = true;
KILL_PLAYER = true;
FREEZE_PLAYER = true;
DRAW_MONSTER_PATH = false;
DRAW_MONSTER_SENSES = false;
DRAW_ENTIRE_HOUSE = false;
LOAD_SAVE_ENABLED = false;
HELP_TEXT_ENABLED = false;

KEY_LEFT = "a";
KEY_RIGHT = "d";
KEY_UP = "w";
KEY_DOWN = "s";
KEY_MENU_LEFT = "left";
KEY_MENU_RIGHT = "right";
KEY_MENU_UP = "up";
KEY_MENU_DOWN = "down";
KEY_FLASHLIGHT = "f";
KEY_RUN = "lshift";
KEY_ITEM_LEFT = "q";
KEY_ITEM_RIGHT = "e";
KEY_ITEM_USE = "r";
KEY_QUIT = "escape";
KEY_PAUSE = "return";

KEY_LIGHT_LEFT = "left";
KEY_LIGHT_RIGHT = "right";
KEY_LIGHT_UP = "up";
KEY_LIGHT_DOWN = "down";

MASTER_VOLUME = 1;
MASTER_BRIGHTNESS = 0;

GAMEPAD_LEFT = "dpleft";
GAMEPAD_RIGHT = "dpright";
GAMEPAD_UP = "dpup";
GAMEPAD_DOWN = "dpdown";
GAMEPAD_FLASHLIGHT = "b";
GAMEPAD_RUN = ""; -- Handled by left and right trigger
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

PLAYER_SCALE = 1;
PLAYER_WIDTH = 32 * PLAYER_SCALE;
PLAYER_HEIGHT = 32 * PLAYER_SCALE;
PLAYER_WALK_SPEED = 200;
PLAYER_RUN_SPEED = 400;
PLAYER_TURN_SPEED = 5;
PLAYER_FROZEN_METER = 20;

DOOR_OPEN_TIMER = 0.3;
DOOR_THICKNESS = 32;
DOOR_LENGTH = 96;
DOOR_OFFSET = 0;

ITEM_WORLD_SCALE = 1;
ITEM_IMAGE_WIDTH = 32;
ITEM_IMAGE_HEIGHT = 32;
ITEM_WIDTH = ITEM_IMAGE_WIDTH * ITEM_WORLD_SCALE;
ITEM_HEIGHT = ITEM_IMAGE_HEIGHT * ITEM_WORLD_SCALE;
ITEM_GLOW_RATE = 2;

HUD_SCALE = 1;
HUD_HEIGHT = 100 * HUD_SCALE;

INVENTORY_ITEM_X = 20;
INVENTORY_ITEM_Y = 520;
INVENTORY_ITEM_WIDTH = 60;
INVENTORY_ITEM_HEIGHT = 60;

PATH_NODE_SIZE = 32;

MONSTER_SCALE = 1;
MONSTER_SPAWN_FLOOR = 1;
MONSTER_SPAWN_X = 1104;
MONSTER_SPAWN_Y = 1392;

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
MONSTER_WOLF_TURN_SPEED = 3;

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
MONSTER_PANTHER_TURN_SPEED = 3;

MONSTER_BURGLAR_WIDTH = 32 * MONSTER_SCALE;
MONSTER_BURGLAR_HEIGHT = 32 * MONSTER_SCALE;
MONSTER_BURGLAR_WALK_SPEED = 200;
MONSTER_BURGLAR_CHASE_SPEED = 450;
MONSTER_BURGLAR_PANIC_WALK_SPEED = 400;
MONSTER_BURGLAR_PANIC_CHASE_SPEED = 600;
MONSTER_BURGLAR_HUNT_CHANCE = 50;
MONSTER_BURGLAR_SIGHT_DISTANCE = 600;
MONSTER_BURGLAR_SIGHT_CONE = math.pi * 1/4;
MONSTER_BURGLAR_TURN_SPEED = 5;

MONSTER_ARSONIST_WIDTH = 32 * MONSTER_SCALE;
MONSTER_ARSONIST_HEIGHT = 32 * MONSTER_SCALE;
MONSTER_ARSONIST_WALK_SPEED = 150;
MONSTER_ARSONIST_FLEE_SPEED = 600;
MONSTER_ARSONIST_PANIC_CHASE_SPEED = 500;
MONSTER_ARSONIST_SIGHT_DISTANCE = 500;
MONSTER_ARSONIST_SIGHT_CONE = math.pi * 1/4;
MONSTER_ARSONIST_TURN_SPEED = 5;
MONSTER_ARSONIST_FIRE_CHANCE = 100;
MONSTER_ARSONIST_CALM_FIRE_SETTING = 3;
MONSTER_ARSONIST_PANIC_FIRE_SETTING = 3;
MONSTER_ARSONIST_MAX_PATH = 15;

MONSTER_KILLER_WIDTH = 32 * MONSTER_SCALE;
MONSTER_KILLER_HEIGHT = 32 * MONSTER_SCALE;
MONSTER_KILLER_WALK_SPEED = 150;
MONSTER_KILLER_CHASE_SPEED = 300;
MONSTER_KILLER_PANIC_WALK_SPEED = 450;
MONSTER_KILLER_PANIC_CHASE_SPEED = 475;
MONSTER_KILLER_CHASE_TIMER = 5;
MONSTER_KILLER_SIGHT_DISTANCE = 350;
MONSTER_KILLER_SIGHT_CONE = math.pi * 1/4;
MONSTER_KILLER_TURN_SPEED = 5;
MONSTER_KILLER_HUNT_CHANCE = 100;
MONSTER_KILLER_RELOAD_TIMER = 3;
MONSTER_KILLER_CALM_HIT_CHANCE = 60;
MONSTER_KILLER_PANICKED_HIT_CHANCE = 30;

MONSTER_VAMPIRE_WIDTH = 32 * MONSTER_SCALE;
MONSTER_VAMPIRE_HEIGHT = 32 * MONSTER_SCALE;
MONSTER_VAMPIRE_WALK_SPEED = 200;
MONSTER_VAMPIRE_STALK_SPEED = 150;
MONSTER_VAMPIRE_FREEZE_DISTANCE = 400;
MONSTER_VAMPIRE_SIGHT_DISTANCE = 350;
MONSTER_VAMPIRE_SIGHT_CONE = math.pi * 1/4;
MONSTER_VAMPIRE_EYES_PLAYER_DISTANCE = 400;
MONSTER_VAMPIRE_HUNT_CHANCE = 50;
MONSTER_VAMPIRE_TURN_SPEED = 5;

MONSTER_GHOST_WIDTH = 32 * MONSTER_SCALE;
MONSTER_GHOST_HEIGHT = 32 * MONSTER_SCALE;
MONSTER_GHOST_CHASE_SPEED = 300;
MONSTER_GHOST_TURN_SPEED = 5;
MONSTER_GHOST_FADEIN_TIMER = 3;
MONSTER_GHOST_CHASE_TIMER = 5;
MONSTER_GHOST_FADEOUT_TIMER = 4;
MONSTER_GHOST_SPAWN_RANGE = 100;

SHOTGUN_RANGE = 75;
SHOTGUN_MIN_SIZE = 30;

STAKE_RANGE = 60;
STAKE_MIN_SIZE = 25;

TASER_SCALE = 1.5;
TASER_RANGE = 70 * TASER_SCALE;
TASER_MIN_SIZE = 30 * TASER_SCALE;
TASER_TIMER = 5;

FIRE_SPREAD_TIMER = 2;
WATER_SPLASH_SCALE = 2;
WATER_SPLASH_WIDTH = 62 * WATER_SPLASH_SCALE;
WATER_SPLASH_HEIGHT = 32 * WATER_SPLASH_SCALE;

POLICE_TIMER = 45;
BOOK_BANISHMENT_TIMER = 45;

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
		["scroll"] = {x = 96, y = 96},
		["shovel"] = {x = 128, y = 96}
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
		["scroll"] = {x = 180, y = 180},
		["shovel"] = {x = 240, y = 180}
	}
};

SCENARIO_ITEMS = {
	["wolf"] = {"meat", "trap", "shotgun", "shotgun_rounds"},
	["panther"] = {"meat", "trap", "shotgun", "shotgun_rounds"},
	["burglar"] = {"taser", "cellphone_dead", "cellphone_battery"},
	["arsonist"] = {"taser", "cellphone_dead", "cellphone_battery", "bucket"},
	["killer"] = {"cellphone_dead", "cellphone_battery"},
	["vampire"] = {"stake", "cross"},
	["ghost"] = {"shovel", "lighter"},
	["alien"] = {"music_box", "battery", "foil"},
	["zombie"] = {"axe", "shotgun", "shotgun_rounds", "gasoline", "lighter"},
	["elder_god"] = {"crystal", "scroll"}
};

SCENARIO_SELECTION = {
	{"wolf", "panther", "burglar", "arsonist"},
	{"killer", "random", "vampire"},
	{"ghost", "alien", "zombie", "elder_god"}
};

--SCENARIO_ALL = {"wolf", "panther", "burglar", "arsonist", "killer", "vampire", "ghost", "alien", "zombie", "elder_god"};
SCENARIO_ALL = {"wolf", "panther", "burglar", "arsonist", "killer", "vampire", "ghost"};
SCENARIO_COMPLETED = {
	["wolf"] = true,
	["panther"] = true,
	["burglar"] = true,
	["arsonist"] = true,
	["killer"] = true,
	["vampire"] = true,
	["ghost"] = true,
	["alien"] = false
};

SCENARIO_DESCRIPTION = {
	["Wolf"] = "Three wolves are looking for a snack. They like meat and have keen ears. Stay quiet if you want to survive.",
	["Panther"] = "A panther is looking for a midnight meal. It likes meat and can hunt by smell. Stay quiet and keep moving or else it'll catch up with you.",
	["Burglar"] = "Someone has broken in to your house looking for valuables. They won't hesitate to kill anyone in their way. Call the cops and hold out until they arrive.",
	["Arsonist"] = "An arsonist has chosen to burn your house down. He won't mind killing you either. Call the cops and make sure your house is still standing when they arrive.",
	["Killer"] = "A serial killer has chosen you for his next victim. After removing any means for his prey to fight back, he stalks them with his gun until he can end them. Keep your cool and call the cops.",
	["Vampire"] = "Your house has become home to a hungry vampire. He can freeze you with a look or if you get too close. Find some divine protection before driving a stake through his heart.",
	["Ghost"] = "The spirit of your house has awoken. It can't see you in the dark, but it can hear you. Find the book of rituals and read the spell to banish it back to the netherworld.",
	["Alien"] = "",
	["Zombie"] = "",
	["Elder God"] = "",
	["Random"] = ""
}