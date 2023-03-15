local allowCountdownEnd = false;
function onEndSong()
    if not allowCountdownEnd and isStoryMode and not seenCutscene then
        startVideo('ending');   
        allowCountdownEnd = true;
        return Function_Stop;
    end
    return Function_Continue;
end