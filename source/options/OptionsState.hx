package options;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.FlxSubState;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxSave;
import haxe.Json;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;
import Controls;
import WindowsData;

using StringTools;

class OptionsState extends MusicBeatState
{
	var options:Array<String> = ['Controls', 'Adjust Delay and Combo', 'Misc', 'Graphics', 'Visuals and UI', 'Gameplay'];
	private var grpOptions:FlxTypedGroup<Alphabet>;
	private static var curSelected:Int = 0;
	public static var menuBG:FlxSprite;

	public static var isPause:Bool = false;

	function openSelectedSubstate(label:String) {
		switch(label) {
			case 'Misc':
				openSubState(new options.MiscSubState());
			case 'Controls':
				openSubState(new options.ControlsSubState());
			case 'Graphics':
				openSubState(new options.GraphicsSettingsSubState());
			case 'Visuals and UI':
				openSubState(new options.VisualsUISubState());
			case 'Gameplay':
				openSubState(new options.GameplaySettingsSubState());
			case 'Adjust Delay and Combo':
				LoadingState.loadAndSwitchState(new options.NoteOffsetState());
		}
	}

	var selectorLeft:Alphabet;
	var selectorRight:Alphabet;

	override function create() {
		#if desktop
		DiscordClient.changePresence("Options Menu", null);
		#end

		openfl.Lib.application.window.title = Main.appTitle + ' - ' + 'Options';

		if(isPause)
			FlxG.sound.playMusic(Paths.music('freakyMenu'));

		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		bg.color = 0xffcfcfcf;
		bg.updateHitbox();

		bg.screenCenter();
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);

		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		for (i in 0...options.length)
		{
			var optionText:Alphabet = new Alphabet(0, 0, options[i], true);
			optionText.screenCenter();
			optionText.y += (100 * (i - (options.length / 2))) + 50;
			grpOptions.add(optionText);
		}

		selectorLeft = new Alphabet(0, 0, '>', true);
		add(selectorLeft);
		selectorRight = new Alphabet(0, 0, '<', true);
		add(selectorRight);

		var daStat1:FlxSprite = new FlxSprite(0,0);
		daStat1.frames = Paths.getSparrowAtlas('daSTAT');
		daStat1.animation.addByPrefix('static','staticFLASH',24,true);
		daStat1.animation.play('static');
		daStat1.scrollFactor.set(0, 0);
		daStat1.alpha = 0.075;
		add(daStat1);

		var daStat2:FlxSprite = new FlxSprite(401,0);
		daStat2.frames = Paths.getSparrowAtlas('daSTAT');
		daStat2.animation.addByPrefix('static','staticFLASH',24,true);
		daStat2.animation.play('static');
		daStat2.scrollFactor.set(0, 0);
		daStat2.alpha = 0.075;
		add(daStat2);

		var daStat3:FlxSprite = new FlxSprite(802,0);
		daStat3.frames = Paths.getSparrowAtlas('daSTAT');
		daStat3.animation.addByPrefix('static','staticFLASH',24,true);
		daStat3.animation.play('static');
		daStat3.scrollFactor.set(0, 0);
		daStat3.alpha = 0.075;
		add(daStat3);

		var daStat4:FlxSprite = new FlxSprite(1203,0);
		daStat4.frames = Paths.getSparrowAtlas('daSTAT');
		daStat4.animation.addByPrefix('static','staticFLASH',24,true);
		daStat4.animation.play('static');
		daStat4.scrollFactor.set(0, 0);
		daStat4.alpha = 0.075;
		add(daStat4);

		var daStat5:FlxSprite = new FlxSprite(0,299);
		daStat5.frames = Paths.getSparrowAtlas('daSTAT');
		daStat5.animation.addByPrefix('static','staticFLASH',24,true);
		daStat5.animation.play('static');
		daStat5.scrollFactor.set(0, 0);
		daStat5.alpha = 0.075;
		add(daStat5);

		var daStat6:FlxSprite = new FlxSprite(401,299);
		daStat6.frames = Paths.getSparrowAtlas('daSTAT');
		daStat6.animation.addByPrefix('static','staticFLASH',24,true);
		daStat6.animation.play('static');
		daStat6.scrollFactor.set(0, 0);
		daStat6.alpha = 0.075;
		add(daStat6);

		var daStat7:FlxSprite = new FlxSprite(802,299);
		daStat7.frames = Paths.getSparrowAtlas('daSTAT');
		daStat7.animation.addByPrefix('static','staticFLASH',24,true);
		daStat7.animation.play('static');
		daStat7.scrollFactor.set(0, 0);
		daStat7.alpha = 0.075;
		add(daStat7);

		var daStat8:FlxSprite = new FlxSprite(1203,299);
		daStat8.frames = Paths.getSparrowAtlas('daSTAT');
		daStat8.animation.addByPrefix('static','staticFLASH',24,true);
		daStat8.animation.play('static');
		daStat8.scrollFactor.set(0, 0);
		daStat8.alpha = 0.075;
		add(daStat8);

		var daStat9:FlxSprite = new FlxSprite(0,598);
		daStat9.frames = Paths.getSparrowAtlas('daSTAT');
		daStat9.animation.addByPrefix('static','staticFLASH',24,true);
		daStat9.animation.play('static');
		daStat9.scrollFactor.set(0, 0);
		daStat9.alpha = 0.075;
		add(daStat9);

		var daStat10:FlxSprite = new FlxSprite(401,598);
		daStat10.frames = Paths.getSparrowAtlas('daSTAT');
		daStat10.animation.addByPrefix('static','staticFLASH',24,true);
		daStat10.animation.play('static');
		daStat10.scrollFactor.set(0, 0);
		daStat10.alpha = 0.075;
		add(daStat10);

		var daStat11:FlxSprite = new FlxSprite(802,598);
		daStat11.frames = Paths.getSparrowAtlas('daSTAT');
		daStat11.animation.addByPrefix('static','staticFLASH',24,true);
		daStat11.animation.play('static');
		daStat11.scrollFactor.set(0, 0);
		daStat11.alpha = 0.075;
		add(daStat11);

		var daStat12:FlxSprite = new FlxSprite(1203,598);
		daStat12.frames = Paths.getSparrowAtlas('daSTAT');
		daStat12.animation.addByPrefix('static','staticFLASH',24,true);
		daStat12.animation.play('static');
		daStat12.scrollFactor.set(0, 0);
		daStat12.alpha = 0.075;
		add(daStat12);

		if(!ClientPrefs.globalAntialiasing)
		{
			daStat1.visible = false;
			daStat2.visible = false;
			daStat3.visible = false;
			daStat4.visible = false;
			daStat5.visible = false;
			daStat6.visible = false;
			daStat7.visible = false;
			daStat8.visible = false;
			daStat9.visible = false;
			daStat10.visible = false;
			daStat11.visible = false;
			daStat12.visible = false;
		}

		var grain:FlxSprite = new FlxSprite();
		grain.frames = Paths.getSparrowAtlas('grainfix', 'mouse');
		grain.animation.addByPrefix('grain', 'grain', 12, true);
		grain.setGraphicSize(Std.int(grain.width * 1.25));
		grain.screenCenter();
		grain.antialiasing = ClientPrefs.globalAntialiasing;
        grain.scrollFactor.set(0, 0);
		grain.animation.play('grain');
		if(!ClientPrefs.lowQuality)
			add(grain);

		changeSelection();
		ClientPrefs.saveSettings();

		super.create();
	}

	override function closeSubState() {
		super.closeSubState();
		ClientPrefs.saveSettings();
	}

	override function update(elapsed:Float) {
		super.update(elapsed);

		if (controls.UI_UP_P) {
			changeSelection(-1);
		}
		if (controls.UI_DOWN_P) {
			changeSelection(1);
		}

		if (controls.BACK) {
			FlxG.sound.play(Paths.sound('cancelMenu'));
			if(isPause) {
				FlxG.sound.music.volume = 0;
				isPause = false;
				LoadingState.loadAndSwitchState(new PlayState());
			} else {
				MusicBeatState.switchState(new MainMenuState());
			}
		}

		if (controls.ACCEPT) {
			openSelectedSubstate(options[curSelected]);
		}
	}
	
	function changeSelection(change:Int = 0) {
		curSelected += change;
		if (curSelected < 0)
			curSelected = options.length - 1;
		if (curSelected >= options.length)
			curSelected = 0;

		var bullShit:Int = 0;

		for (item in grpOptions.members) {
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			if (item.targetY == 0) {
				item.alpha = 1;
				selectorLeft.x = item.x - 63;
				selectorLeft.y = item.y;
				selectorRight.x = item.x + item.width + 15;
				selectorRight.y = item.y;
			}
		}
		FlxG.sound.play(Paths.sound('scrollMenu'));
	}
}