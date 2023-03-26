function onCreate()
   makeLuaSprite('blacking','',-200,-200)
   makeGraphic('blacking',1920,1080,'000000')
   setObjectCamera('blacking','camOther')
   addLuaSprite('blacking',true)
end

function onTimerCompleted(t)
   if t == 'camAngle' then
      runTimer('camlol',1.3)
      doTweenAngle('cam1Angle','camHUD',5,2,'backinout')
   elseif t == 'camlol' then
      runTimer('camAngle',1.3)
      doTweenAngle('cam2Angle','camHUD',-5,2,'backinout')
   end
end

function onSongStart()
   doTweenAlpha('blackfuck','blacking',0,1)
end

function onUpdate()
   cameraShake('camGame', 0.001, 999999)
   cameraShake('camHUD', 0.001, 999999)
end

function happyMouse()
   runTimer('camAngle',1.3)
   doTweenAngle('cam2Angle','camHUD',-5,2,'backinout')
end

local curSection = 0;
local stepDev = 0;

function onStepHit()
   if curStep % 16 == 0 then
      curSection = math.floor(curStep / 16);
   end

   stepDev = math.floor(curStep % 16) + 1;

   if curSection >= 4 and curSection <= 11 or curSection >= 20 and curSection <= 26 then
      if curStep % 4 == 0 then
         addCamZoom(0.1, 0.04)
      end
   end

   if curSection >= 12 and curSection <= 19 then
      if curStep % 8 == 0 then
         addCamZoom(0.08, 0.035)
      end
   end

   if curSection >= 28 and curSection <= 43 then
      if curStep % 4 == 0 then
         addCamZoom(0.2, 0.08)
      end
   end

   if curStep == 440 then
      itemFade(0, 0, 0.15)
      fadeBfStrum(0, 0.15)
      fadeDadStrum(0, 0.15)
   end
   if curStep == 448 then
      itemFade(0, 1, 0.1)
      fadeBfStrum(1, 0.1)
      fadeDadStrum(1, 0.1)
      happyMouse()
   end
   if curStep == 832 then
      itemFade(0, 0, 2)
      fadeBfStrum(0, 2)
      fadeDadStrum(0, 2)
      doTweenAlpha('cameraFade','camGame',0,2)
   end
end

function opponentNoteHit()
   if getProperty('dad.curCharacter') == 'mouse-happy' then
      triggerEvent('Screen Shake', '0.2, 0.035', '0.2, 0.035')
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