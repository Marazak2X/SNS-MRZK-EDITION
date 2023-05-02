function onCreate()
	makeLuaSprite('blacking','aBlackFuckBecauseAMakeGraphicdonotwork',0,0)
    setObjectCamera('blacking','camOther')
    addLuaSprite('blacking',true)

    makeLuaText('cutsceneTxt','Mouse Animations UNFINISHED!!',1000,135,520)
    setTextFont('cutsceneTxt','vcr.ttf')
    setTextSize('cutsceneTxt',30)
    setProperty('cutsceneTxt.alpha',1)
    setObjectCamera('cutsceneTxt','subtitles')
    addLuaText('cutsceneTxt',false)

    setObjectOrder('cutsceneTxt',getObjectOrder('healthBarBG')+50)

end

function onCreatePost()
	setProperty('grain.visible',false);
end

function onStepHit()
	if curStep == 897 then
		doTweenAlpha('blackAlpha','blacking',1,1);
	elseif curStep == 1009 then
		doTweenAlpha('blackAlpha','blacking',0,0.085);
	end
	if curStep == 1021 then
		doTweenAlpha('cma','camHUD',1,0.35);
	end
	if curStep == 1000 then
		setProperty('camHUD.alpha',0);
	end
	if curStep == 1537 then
		setProperty('blacking.alpha',1);
	end
	if curStep == 1550 then
		setProperty('camHUD.visible',false);
	end
	if curStep == 1666 then
		setProperty('blacking.alpha',0);
	elseif curStep == 1697 then
		doTweenAlpha('blackAlpha','blacking',1,1);
	end
end

function onSongStart()
	doTweenAlpha('blackAlpha','blacking',0,1)
	runTimer('fade',3);
end

function onTweenCompleted(t)
	if t == 'blackAlpha' then
		cancelTween('blackAlpha');
	end
end

function onTimerCompleted(t)
	if t == 'fade' then
		doTweenAlpha('cutsceneTxtA','cutsceneTxt',0,1);
	end
end