function onCreate()
   makeLuaSprite('blacking','',-200,-200)
   makeGraphic('blacking',1920,1080,'000000')
   setObjectCamera('blacking','camOther')
   addLuaSprite('blacking',true)

   makeLuaText('cutsceneTxt','',1000,135,580)
   setTextFont('cutsceneTxt','vcr.ttf')
   setTextSize('cutsceneTxt',30)
   setProperty('cutsceneTxt.alpha',0)
   setObjectCamera('cutsceneTxt','camHUD')
   addLuaText('cutsceneTxt',false)
end

function onCreatePost()
   setProperty('gfGroup.visible', false)
   setProperty('introSoundsSuffix', '-suicide')
end

function onSongStart()
   doTweenAlpha('blackfuck','blacking',0,10,'linear')
end

function onUpdate()
   cameraShake('camGame', 0.001, 999999)
   cameraShake('camHUD', 0.001, 999999)
end

local curSection = 0;
local stepDev = 0;

function onStepHit()
   if curStep % 16 == 0 then
      curSection = math.floor(curStep / 16);
   end

   stepDev = math.floor(curStep % 16) + 1;

   if curSection >= 8 and curSection <= 15 or curSection >= 56 and curSection <= 71 then
      if curStep % 8 == 0 then
         addCamZoom(0.12, 0.034)
      end
   end
   if curSection >= 16 and curSection <= 22 or curSection >= 32 and curSection <= 39 or curSection >= 73 and curSection <= 88 then
      if curStep % 4 == 0 then
         addCamZoom(0.14, 0.035)
      end
   end

   if curStep == 384 then
      doTweenAlpha('bfat', 'boyfriendGroup', 0.6, 2)
      doTweenZoom('screenZoom', 'camGame', getProperty('defaultCamZoom') + 0.45, 8, 'cubeIn')
   end
   if curStep == 443 then
      doTweenAlpha('bfat', 'boyfriendGroup', 1, 1)
      doTweenZoom('screenTween', 'camGame', getProperty('defaultCamZoom'), 2, 'circOut')
   end
   if curStep == 768 then
      itemFade(0, 0, 1)
      fadeDadStrum(0, 1)
      fadeBfStrum(0, 1)
      doTweenAlpha('textTween','cutsceneTxt',1,0.5)
      setTextString('cutsceneTxt','Huch')
   end
   if curStep == 772 then
      setTextString('cutsceneTxt','Huch little')
   end
   if curStep == 776 then
      setTextString('cutsceneTxt','Huch little human')
   end
   if curStep == 784 then
      setTextString('cutsceneTxt','Dont say a word...')
   end
   if curStep == 796 then
      doTweenAlpha('textTween','cutsceneTxt',0,0.5)
   end
   if curStep == 800 then
      doTweenAlpha('textTween','cutsceneTxt',1,0.5)
      setTextString('cutsceneTxt',"Mickey's gonna witch this whole")
   end
   if curStep == 816 then
      setTextString('cutsceneTxt','World')
   end
   if curStep == 820 then
      doTweenColor('textColor','cutsceneTxt','FF0000',0.5)
      setTextString('cutsceneTxt','World Bu..')
   end
   if curStep == 824 then
      setTextString('cutsceneTxt','World Burn')
   end
   if curStep == 829 then
      doTweenAlpha('textTween','cutsceneTxt',0,0.2)
   end
   if curStep == 832 then
      setTextColor('cutsceneTxt','FFFFFF')
      doTweenAlpha('textTween','cutsceneTxt',1,0.2)
      setTextString('cutsceneTxt','So just relax and...')
   end
   if curStep == 848 then
      setTextString('cutsceneTxt','And close your eyes...')
   end
   if curStep == 860 then
      doTweenAlpha('textTween','cutsceneTxt',0,0.25)
   end
   if curStep == 864 then
      doTweenAlpha('textTween','cutsceneTxt',1,1)
      setTextString('cutsceneTxt',"Now it's time for...")
   end
   if curStep == 876 then
      doTweenColor('textColor1','cutsceneTxt','FF0000',1.5,'cubeInOut')
   end
   if curStep == 880 then
      setTextString('cutsceneTxt','YOU..')
   end
   if curStep == 884 then
      doTweenAlpha('textTween','cutsceneTxt',0,0.4)
   end
   if curStep == 888 then
      itemFade(0, 1, 1.5)
      fadeDadStrum(1, 1.5)
      fadeBfStrum(1, 1.5)
      setProperty('cutsceneTxt.alpha',1)
      setTextString('cutsceneTxt','YOU TO..')
   end
   if curStep == 892 then
      doTweenAlpha('textTween','cutsceneTxt',0,0.4)
   end
   if curStep == 896 then
      setTextSize('cutsceneTxt',200)
      setProperty('cutsceneTxt.y', 300)
      doTweenAlpha('textTween1','cutsceneTxt',1,1)
      runTimer('lolText',1)
      setTextFont('cutsceneTxt','waltographUI.ttf')
      setTextString('cutsceneTxt','DIE')
   end
   if curStep == 1168 then
      itemFade(1, 0, 1)
   end
   if curStep == 1424 then
      setProperty('camGame.alpha', 0)
      doTweenAlpha('hudFade', 'camHUD', 0, 1.5)
   end
   if curStep == 1600 then
      setProperty('camGame.alpha', 0)
   end
end

function onTweenCompleted(t)
   if t == 'textColor' then
      setTextColor('cutsceneTxt','FF0000')
      cancelTween('textColor')
   end
   if t == 'textColor1' then
      setTextColor('cutsceneTxt','FF0000')
      cancelTween('textColor1')
   end
end

function onTimerCompleted(t)
   if t == 'lolText' then
      doTweenAlpha('textTween1','cutsceneTxt',0,0.4)
   end
end

function opponentNoteHit()
   if getProperty('dad.curCharacter') == 'suicide-mouse' then
      triggerEvent("Screen Shake", "0.2,0.015", "0.2,0.015")
   end
end

function fadeDadStrum(alph, time)
   runHaxeCode([[
      game.opponentStrums.forEach(function(spr)
      {
         FlxTween.tween(spr, {alpha: ]]..alph..[[}, ]]..time..[[);
      })
   ]])
end

function fadeBfStrum(alph, time)
   runHaxeCode([[
      game.playerStrums.forEach(function(spr)
      {
         FlxTween.tween(spr, {alpha: ]]..alph..[[}, ]]..time..[[);
      })
   ]])
end

function addCamZoom(game, hud)
   triggerEvent('Add Camera Zoom', ""..game.."", ""..hud.."")
end

function itemFade(num, alph, duration)
   if num == 0 then
      doTweenAlpha('itm1','timeBarBG',alph,duration,'linear')
      doTweenAlpha('itm2','timeBar',alph,duration,'linear')
      doTweenAlpha('itm3','timeTxt',alph,duration,'linear')
      doTweenAlpha('itm4','botplayTxt',alph,duration,'linear')
      doTweenAlpha('itm5','healthBarBG',alph,duration,'linear')
      doTweenAlpha('itm6','healthBar',alph,duration,'linear')
      doTweenAlpha('itm7','iconP1',alph,duration,'linear')
      doTweenAlpha('itm8','iconP2',alph,duration,'linear')
      doTweenAlpha('itm9','scoreTxt',alph,duration,'linear')
   elseif num == 1 then
      doTweenAlpha('itm1','timeBarBG',alph,duration,'linear')
      doTweenAlpha('itm2','timeBar',alph,duration,'linear')
      doTweenAlpha('itm3','timeTxt',alph,duration,'linear')
      doTweenAlpha('itm4','botplayTxt',alph,duration,'linear')
      doTweenAlpha('itm9','scoreTxt',alph,duration,'linear')
   elseif num == 2 then
      doTweenAlpha('itm1','timeBarBG',alph,duration,'linear')
      doTweenAlpha('itm2','timeBar',alph,duration,'linear')
      doTweenAlpha('itm3','timeTxt',alph,duration,'linear')
   end
end