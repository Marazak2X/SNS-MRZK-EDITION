function onCreate()
    local laneAlpha = getPropertyFromClass('ClientPrefs','laneAlpha');

    makeLuaSprite('oppoBlackLane','aBlackFuckBecauseAMakeGraphicdonotwork',92.5,-100)
    setObjectCamera('oppoBlackLane','camHUD')
    setObjectOrder('oppoBlackLane',getObjectOrder('healthBarBG')+10);
    setProperty('oppoBlackLane.alpha',laneAlpha);
    scaleObject('oppoBlackLane',0.35,2);
    addLuaSprite('oppoBlackLane',true)

    makeLuaSprite('playerBlackLane','aBlackFuckBecauseAMakeGraphicdonotwork',732.5,-100)
    setObjectCamera('playerBlackLane','camHUD')
    setObjectOrder('playerBlackLane',getObjectOrder('healthBarBG')+10);
    setProperty('playerBlackLane.alpha',laneAlpha);
    scaleObject('playerBlackLane',0.35,2);
    addLuaSprite('playerBlackLane',true)
end

local theTextX = 50;

function onCreatePost()
    if getPropertyFromClass('ClientPrefs','hudType') == 'Mrzk HUD' then
        setTextFont('scoreTxt','MilkyNice.ttf')
        setTextFont('missesTxt','MilkyNice.ttf')
        setTextFont('accuracyTxt','MilkyNice.ttf')
        setTextFont('ratingTxt','MilkyNice.ttf')

        local theTextY = -10;

        setTextSize('scoreTxt',22.5);
        setTextSize('missesTxt',22.5);
        setTextSize('accuracyTxt',22.5);
        setTextSize('ratingTxt',22.5);

        setTextSize('sickTxt',22.5);
        setTextSize('goodTxt',22.5);
        setTextSize('badTxt',22.5);
        setTextSize('shitTxt',22.5);

        setProperty('sickTxt.x',getProperty('sickTxt.x')+theTextX-25);
        setProperty('goodTxt.x',getProperty('goodTxt.x')+theTextX-25);
        setProperty('badTxt.x',getProperty('badTxt.x')+theTextX-25);
        setProperty('shitTxt.x',getProperty('shitTxt.x')+theTextX-25);

        setProperty('scoreTxt.x',getProperty('scoreTxt.x')-535+theTextX);
        setProperty('missesTxt.x',getProperty('missesTxt.x')-545+theTextX);
        setProperty('accuracyTxt.x',getProperty('accuracyTxt.x')-553+theTextX);
        setProperty('ratingTxt.x',getProperty('ratingTxt.x')-542.5+theTextX);

        setTextAlignment('scoreTxt','right');
        setTextAlignment('missesTxt','right');
        setTextAlignment('accuracyTxt','right');
        setTextAlignment('ratingTxt','right')

        setProperty('sickTxt.y',getProperty('sickTxt.y')-30+theTextY);
        setProperty('goodTxt.y',getProperty('goodTxt.y')-20+theTextY);
        setProperty('badTxt.y',getProperty('badTxt.y')-10+theTextY);
        setProperty('shitTxt.y',getProperty('shitTxt.y')+theTextY);

        setProperty('scoreTxt.y',getProperty('scoreTxt.y')-30+theTextY);
        setProperty('missesTxt.y',getProperty('missesTxt.y')-20+theTextY);
        setProperty('accuracyTxt.y',getProperty('accuracyTxt.y')-10+theTextY);
        setProperty('ratingTxt.y',getProperty('ratingTxt.y')+theTextY);
    end

    setProperty('grain.y',getProperty('grain.y')+1)
end

local theLaneX = -300;

function onSongStart()
    makeLuaSprite('songLane','songStartBar',0 + theLaneX,100);
    setObjectCamera('songLane','camOther');
    setObjectOrder('songLane',getObjectOrder('healthBarBG')+100)
    scaleObject('songLane',0.21,0.115);
    setProperty('songLane.alpha',1);
    addLuaSprite('songLane',true);

    doTweenX('songLTween1','songLane',0,1,'cubeOut');

    runTimer('fadeOut',3);

    if songName == 'A Fate Worse than Death' then
        --song name, -, Opponent.
        makeLuaText('songTxt','"'..songName..'"\n-\nHappy Mouse',1000,-365 + theLaneX,115);
        setTextFont('songTxt','vcr.ttf');
        setObjectCamera('songTxt','camOther');
        addLuaText('songTxt',true);

        doTweenX('songTTween','songTxt',-365,1,'cubeOut');
    elseif songName == 'Really Happy Legacy' then
        makeLuaText('songTxt','"'..songName..'"\n-\nSuicide Mouse',1000,-365 + theLaneX,115);
        setTextFont('songTxt','vcr.ttf');
        setObjectCamera('songTxt','camOther');
        addLuaText('songTxt',true);

        doTweenX('songTTween','songTxt',-365,1,'cubeOut');
    elseif songName == 'Unhappy' then
        makeLuaText('songTxt','"'..songName..'"\n-\nUnHappy Mouse',1000,-365 + theLaneX,115);
        setTextFont('songTxt','vcr.ttf');
        setObjectCamera('songTxt','camOther');
        addLuaText('songTxt',true);

        doTweenX('songTTween','songTxt',-365,1,'cubeOut');
    elseif songName == 'Happy' then
        makeLuaText('songTxt','"'..songName..'"\n-\nHappy Mouse',1000,-365 + theLaneX,115);
        setTextFont('songTxt','vcr.ttf');
        setObjectCamera('songTxt','camOther');
        addLuaText('songTxt',true);
        
        doTweenX('songTTween','songTxt',-365,1,'cubeOut');
    elseif songName == 'Really Happy' then
        makeLuaText('songTxt','"'..songName..'"\n-\nSuicide Mouse',1000,-365 + theLaneX,115);
        setTextFont('songTxt','vcr.ttf');
        setObjectCamera('songTxt','camOther');
        addLuaText('songTxt',true);
        
        doTweenX('songTTween','songTxt',-365,1,'cubeOut');
    elseif songName == 'Smile' or songName == 'Cycles' then
        makeLuaText('songTxt','"'..songName..'"\n-\n...',1000,-365 + theLaneX,115);
        setTextFont('songTxt','vcr.ttf');
        setObjectCamera('songTxt','camOther');
        addLuaText('songTxt',true);
        
        doTweenX('songTTween','songTxt',-365,1,'cubeOut');
    elseif songName == 'Happy-Neo' then
        makeLuaText('songTxt','"'..songName..'"\n-\nNeo Mouse',1000,-365 + theLaneX,115);
        setTextFont('songTxt','vcr.ttf');
        setObjectCamera('songTxt','camOther');
        addLuaText('songTxt',true);

        setProperty('songLane.color',getColorFromHex('0x991C7A'));
        setProperty('songTxt.color',getColorFromHex('0x00F7FF'));
        
        doTweenX('songTTween','songTxt',-365,1,'cubeOut');
    end
    setObjectOrder('songTxt',getObjectOrder('healthBarBG')+100)
end

function onTimerCompleted(t)
    if t == 'fadeOut' then
        doTweenX('songLTween1','songLane',0+theLaneX,1,'cubeInOut');
        doTweenX('songTTween','songTxt',-365+theLaneX,1,'cubeInOut');
    end
end

function onTweenCompleted(t)
    if t == 'songLTween1' then
        cancelTween('songLTween1');
    end
    if t == 'songLTween2' then
        cancelTween('songLTween2');
    end
    if t == 'songTTween' then
        cancelTween('songTTween');
    end
end