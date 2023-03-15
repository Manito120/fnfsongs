function onCreate()
	-- background shit
	makeLuaSprite('bfplatform', 'platform', 800, 700);
	setScrollFactor('platform', 1, 1);
	scaleObject('bfplatform', 0.5, 0.5)

	makeLuaSprite('dojobg', 'dojobg', -700, 0)

	makeLuaSprite('angynesseffect', 'angyness_effect', -200, -100)
	scaleObject('angynesseffect', 0.7, 0.7)
	setScrollFactor('angynesseffect', 0, 0)
	setBlendMode('angynesseffect', 'DARKEN')

	if not lowQuality then
		makeLuaSprite('vignette', 'vignette', -200, -100)
		scaleObject('vignette', 0.7, 0.7)
		setScrollFactor('vignette', 0, 0)
		setBlendMode('vignette', 'OVERLAY')
	end

	addLuaSprite('dojobg', false)
	addLuaSprite('bfplatform', false)
	addLuaSprite('angynesseffect', true)
	addLuaSprite('vignette', true)

	setProperty('angynesseffect.alpha', 0)
	
	precacheImage('Apple')
	precacheImage('Watermelon')
	precacheImage('Pear')
	precacheImage('Peach')
end

function onUpdate()
	triggerEvent('Camera Follow Pos', 600, 600)
	setProperty('cameraSpeed', 10)
end

function onCountdownTick(counter)
	if counter == 0 then
		for i=7,4,-1 do
			noteTweenX('note' .. i .. 'tween', i, i*112+300, 1, 'cubeInOut')
		end
	end
end

function onSongStart()
	for i=3,0,-1 do
		noteTweenAlpha('note' .. i .. 'alphatween', i, 0, 1, 'linear')
	end
end