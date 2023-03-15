sayoIdle = true

function onCreate()
	makeAnimatedLuaSprite('SilSayori', 'characters/silhouette_sayo', -200, 150);
	addAnimationByPrefix('SilSayori', 'idle', 'Sayo Idle nrw test', 30, false);
	addAnimationByPrefix('SilSayori', 'singLEFT', 'Sayo Sing Note Left', 24, false);
	addAnimationByPrefix('SilSayori', 'singDOWN', 'Sayo Sing Note Down', 24, false);
	addAnimationByPrefix('SilSayori', 'singUP', 'Sayo Sing Note Up', 24, false);
	addAnimationByPrefix('SilSayori', 'singRIGHT', 'Sayo Sing Note Right', 24, false);
    setProperty('SilSayori.flipX', false);
    setObjectOrder('SilSayori', 0);
	objectPlayAnimation('SilSayori', 'idle', true);
	setProperty('SilSayori.alpha', 0);
	addLuaSprite('SilSayori', false);

    idleOffsets = {'0', '0'}
    leftOffsets = {'-32', '-2'}
    downOffsets = {'-88', '-44'}
    upOffsets = {'-51', '73'}
    rightOffsets = {'-98', '-8'}
end

local sayoAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == "Sayori Note" then
		sayoIdle = false
		objectPlayAnimation('SilSayori', sayoAnims[direction + 1], false);

	if direction == 0 then
		setProperty('SilSayori.offset.x', leftOffsets[1]);
		setProperty('SilSayori.offset.y', leftOffsets[2]);

    elseif direction == 1 then
		setProperty('SilSayori.offset.x', downOffsets[1]);
		setProperty('SilSayori.offset.y', downOffsets[2]);

	elseif direction == 2 then
		setProperty('SilSayori.offset.x', upOffsets[1]);
		setProperty('SilSayori.offset.y', upOffsets[2]);

	elseif direction == 3 then
		setProperty('SilSayori.offset.x', rightOffsets[1]);
		setProperty('SilSayori.offset.y', rightOffsets[2]);

	if isSustainNote then
		objectPlayAnimation('SilSayori', sayoAnims[direction + 1], true);
			end
		end
	end
end

function onBeatHit()
	-- triggered 4 times per section
	if curBeat % 2 == 0  and sayoIdle then
		objectPlayAnimation('SilSayori', 'idle');
		setProperty('SilSayori.offset.x', idleOffsets[1]);
		setProperty('SilSayori.offset.y', idleOffsets[2]);
	end
	sayoIdle = true
end

function onCountdownTick(counter)
	-- counter = 0 -> "Three"
	-- counter = 1 -> "Two"
	-- counter = 2 -> "One"
	-- counter = 3 -> "Go!"
	-- counter = 4 -> Nothing happens lol, tho it is triggered at the same time as onSongStart i think
	if counter % 2 == 0 then
	if sayoIdle == true then
		objectPlayAnimation('SilSayori', 'idle');
		setProperty('SilSayori.offset.x', idleOffsets[1]);
		setProperty('SilSayori.offset.y', idleOffsets[2]);
		end
	end
end

function onStepHit()
if curStep == 2410 then
doTweenAlpha('SayoriAppear', 'SilSayori', 0.6, 2, 'circOut');
end
end