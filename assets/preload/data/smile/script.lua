function onUpdate()
   shakin = getPropertyFromClass('ClientPrefs','shaking')

   if shakin then
      cameraShake('camGame', 0.0008, 999999)
      cameraShake('camHUD', 0.0008, 999999)
   end
end

local curSection = 0;
local stepDev = 0;

function onCreatePost()
   setProperty('introSoundsSuffix','');
end

function onStepHit()
   if curStep % 16 == 0 then
      curSection = math.floor(curStep / 16);
   end

   stepDev = math.floor(curStep % 16) + 1;
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
      doTweenAlpha('itm1','camHUD',alph,duration,'linear')
   elseif num == 1 then
      doTweenAlpha('itm1','timeBarBG',alph,duration,'linear')
      doTweenAlpha('itm2','timeBar',alph,duration,'linear')
      doTweenAlpha('itm3','timeTxt',alph,duration,'linear')
      doTweenAlpha('itm4','botplayTxt',alph,duration,'linear')
      doTweenAlpha('itm9','scoreTxt',alph,duration,'linear')
      doTweenAlpha('itm10','missesTxt',alph,duration);
      doTweenAlpha('itm11','accuracyTxt',alpha,duration);
      doTweenAlpha('itm12','ratingTxt',alpha,duration);
      doTweenAlpha('itm13','sickTxt',alpha,duration);
      doTweenAlpha('itm14','goodTxt',alpha,duration);
      doTweenAlpha('itm15','badTxt',alpha,duration);
      doTweenAlpha('itm16','shitTxt',alpha,duration);
   elseif num == 2 then
      doTweenAlpha('itm1','timeBarBG',alph,duration,'linear')
      doTweenAlpha('itm2','timeBar',alph,duration,'linear')
      doTweenAlpha('itm3','timeTxt',alph,duration,'linear')
   end
end