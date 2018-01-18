--[[
Moves randomly. Sets fire to the ground and runs away from the player upon seeing them.
Randomly sets fire to random squares in the house that spread and block passage.
Touching the fire kills the player.
The player can pick up a bucket and use it to put out several blocks of fire.
Bucket refills gradually if the player stands still.
Immediately knows where the player is upon using the cell phone and will continuously pursue them.
Use the taser to last until the cops arrive

States:
Idle - Hasn't seen player and player hasn't called police. Randomly walk around investigating things
Walk - Moving randomly around the level
Spotted - Sees the player. Alert for a little bit, then run away
Fleeing - Is running away from the player.
Panicked - Player has called the police. Continuously pursue the player directly.
Stunned - Stunned by the player
]]

Monster_Arsonist = Class {__includes = Monster,
	init = function(self, parentManager, soundEffects, player, curFloor, x, y)
		Monster.init(self);
		self.parentManager = parentManager;
		self.soundEffects = soundEffects;
		self.player = player;
		self.curFloor = curFloor;
		self.box = {
			x = x,
			y = y,
			w = MONSTER_ARSONIST_WIDTH,
			h = MONSTER_ARSONIST_HEIGHT
		};

		BumpWorld:add(self, self.box.x, self.box.y, self.box.w, self.box.h);




		self.panicked = false;
		self.state = "idle";
		self.stateTimer = 5;
		self.monsterType = "arsonist";
		self.type = "monster";
		self.active = true;
	end
};

function Monster_Arsonist:update(dt)

end

function Monster_Arsonist:draw()

end