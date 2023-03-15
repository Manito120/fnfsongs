yuriIdle = true

function onCreate()
	makeAnimatedLuaSprite('SilYuri', 'characters/silhouette_yuri', 1100, 100);
	addAnimationByPrefix('SilYuri', 'idle', 'Yuri Idle0', 24, false);
	addAnimationByPrefix('SilYuri', 'singLEFT', 'Yuri Sing Note Left', 24, false);
	addAnimationByPrefix('SilYuri', 'singDOWN', 'Yuri Sing Note Down', 24, false);
	addAnimationByPrefix('SilYuri', 'singUP', 'Yuri Sing Note Up', 24, false);
	addAnimationByPrefix('SilYuri', 'singRIGHT', 'Yuri Sing Note Right', 24, false);
    setProperty('SilYuri.flipX', true);
    setObjectOrder('SilYuri', 0);
	objectPlayAnimation('SilYuri', 'idle', true);
	addLuaSprite('SilYuri', false);
	setProperty('SilYuri.alpha', 0);

    idleOffsets = {'0', '0'}
    leftOffsets = {'19', '-20'}
    downOffsets = {'23', '-19'}
    upOffsets = {'8', '24'}
    rightOffsets = {'1', '1'}
end

local yuriAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == "Yuri Note" then
		yuriIdle = false
		objectPlayAnimation('SilYuri', yuriAnims[direction + 1], false);

	if direction == 0 then
		setProperty('SilYuri.offset.x', leftOffsets[1]);
		setProperty('SilYuri.offset.y', leftOffsets[2]);

    elseif direction == 1 then
		setProperty('SilYuri.offset.x', downOffsets[1]);
		setProperty('SilYuri.offset.y', downOffsets[2]);

	elseif direction == 2 then
		setProperty('SilYuri.offset.x', upOffsets[1]);
		setProperty('SilYuri.offset.y', upOffsets[2]);

	elseif direction == 3 then
		setProperty('SilYuri.offset.x', rightOffsets[1]);
		setProperty('SilYuri.offset.y', rightOffsets[2]);

	if isSustainNote then
		objectPlayAnimation('SilYuri', yuriAnims[direction + 1], true);
			end
		end
	end
end

function onBeatHit()
	-- triggered 4 times per section
	if curBeat % 2 == 0  and yuriIdle then
		objectPlayAnimation('SilYuri', 'idle');
		setProperty('SilYuri.offset.x', idleOffsets[1]);
		setProperty('SilYuri.offset.y', idleOffsets[2]);
	end
	yuriIdle = true
end

function onCountdownTick(counter)
	-- counter = 0 -> "Three"
	-- counter = 1 -> "Two"
	-- counter = 2 -> "One"
	-- counter = 3 -> "Go!"
	-- counter = 4 -> Nothing happens lol, tho it is triggered at the same time as onSongStart i think
	if counter % 2 == 0 then
	if yuriIdle == true then
		objectPlayAnimation('SilYuri', 'idle');
		setProperty('SilYuri.offset.x', idleOffsets[1]);
		setProperty('SilYuri.offset.y', idleOffsets[2]);
		end
	end
end
function onStepHit()
if curStep == 2602 then
doTweenAlpha('YuriAppear', 'SilYuri', 0.6, 2, 'circOut');
end
end