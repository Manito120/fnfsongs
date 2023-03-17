
function onCreatePost()

    setProperty('camFollowPos.y', getProperty('camFollowPos.y') - 100);
    
end

function onCreate()

    makeLuaSprite('Sky', 'mbiist/BlueSkys', -600, -250)
    makeLuaSprite('Cloud', 'mbiist/Clouds', -450, -250)
    setScrollFactor('Cloud', 0.5, 0.5);
    makeLuaSprite('MethBG', 'mbiist/BackgroundMeth', -700, 100)
    setScrollFactor('MethBG', 0.8, 0.8);
    makeAnimatedLuaSprite('Smokes', 'mbiist/SmokesMeth', 730, -100)
    addAnimationByPrefix('Smokes', 'SmokesMoving', 'SmokesMeth', 24, false)
    setScrollFactor('Smokes', 0.8, 0.8);
    makeLuaSprite('bartop','',0,0)
    makeGraphic('bartop',1280,100,'000000')
    addLuaSprite('bartop',true)
    setScrollFactor('bartop',0,0)
    setObjectCamera('bartop','hud')
    makeLuaSprite('barbot','',0,620)
    makeGraphic('barbot',1280,100,'000000')
    addLuaSprite('barbot',true)
    setScrollFactor('barbot',0,0)
    setObjectCamera('barbot','hud')

    addLuaSprite('Sky', false)
    addLuaSprite('Cloud', false)
    addLuaSprite('MethBG', false)
    addLuaSprite('Smokes', false)
    addLuaSprite('barbot',true)
    addLuaSprite('bartop',true)

end