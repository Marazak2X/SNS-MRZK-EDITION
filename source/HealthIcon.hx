package;

import flixel.FlxSprite;
import openfl.utils.Assets as OpenFlAssets;

using StringTools;

class HealthIcon extends FlxSprite
{
	public var sprTracker:FlxSprite;
	private var isOldIcon:Bool = false;
	private var isPlayer:Bool = false;
	private var char:String = '';

	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();
		isOldIcon = (char == 'bf-old');
		this.isPlayer = isPlayer;
		changeIcon(char);
		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 12, sprTracker.y - 30);
	}

	public function swapOldIcon() {
		if(isOldIcon = !isOldIcon) changeIcon('bf-old');
		else changeIcon('bf');
	}

	private var iconOffsets:Array<Float> = [0, 0];
	public function changeIcon(char:String) {
		if(this.char != char) {
			switch (char)
			{
				default:
			        var name:String = 'icons/' + char;
			        if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'icons/icon-' + char; //Older versions of psych engine's support
			        if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'icons/icon-face'; //Prevents crash from missing icon
			        var file:Dynamic = Paths.image(name);

			        loadGraphic(file); //Load stupidly first for getting the file size
			        loadGraphic(file, true, Math.floor(width / 3), Math.floor(height)); //Then load it fr
			        iconOffsets[0] = (width - 150) / 3;
		            iconOffsets[1] = (width - 150) / 3;
			        iconOffsets[2] = (width - 150) / 3;
				    updateHitbox();

				    animation.add("losing", [1], 0, false, isPlayer);
				    animation.add("winning", [2], 0, false, isPlayer);
				    animation.add("idle", [0], 0, false, isPlayer);
				    animation.play("idle");
			        this.char = char;

			        antialiasing = ClientPrefs.globalAntialiasing;
			        if(char.endsWith('-pixel')) {
				        antialiasing = false;
			        }

				case 'sadmouse':
					var name:String = 'icons/' + char;
			        if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'icons/icon-' + char; //Older versions of psych engine's support
			        if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'icons/icon-face'; //Prevents crash from missing icon
			        var file:Dynamic = Paths.image(name);

			        loadGraphic(file); //Load stupidly first for getting the file size
			        loadGraphic(file, true, Math.floor(width / 2), Math.floor(height)); //Then load it fr
			        iconOffsets[0] = (width - 150) / 3;
		            iconOffsets[1] = (width - 150) / 3;
				    updateHitbox();

				    animation.add("losing", [1], 0, false, isPlayer);
				    animation.add("winning", [0], 0, false, isPlayer);
				    animation.add("idle", [0], 0, false, isPlayer);
				    animation.play("idle");
			        this.char = char;

			        antialiasing = ClientPrefs.globalAntialiasing;

				case 'neomouse':
					var name:String = 'icons/' + char;
			        if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'icons/icon-' + char; //Older versions of psych engine's support
			        if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'icons/icon-face'; //Prevents crash from missing icon
			        var file:Dynamic = Paths.image(name);

			        loadGraphic(file); //Load stupidly first for getting the file size
			        loadGraphic(file, true, Math.floor(width / 2), Math.floor(height)); //Then load it fr
			        iconOffsets[0] = (width - 150) / 3;
		            iconOffsets[1] = (width - 150) / 3;
				    updateHitbox();

				    animation.add("losing", [1], 0, false, isPlayer);
				    animation.add("winning", [0], 0, false, isPlayer);
				    animation.add("idle", [0], 0, false, isPlayer);
				    animation.play("idle");
			        this.char = char;

			        antialiasing = ClientPrefs.globalAntialiasing;

				case 'neohappy':
					var name:String = 'icons/' + char;
			        if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'icons/icon-' + char; //Older versions of psych engine's support
			        if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'icons/icon-face'; //Prevents crash from missing icon
			        var file:Dynamic = Paths.image(name);

			        loadGraphic(file); //Load stupidly first for getting the file size
			        loadGraphic(file, true, Math.floor(width / 2), Math.floor(height)); //Then load it fr
			        iconOffsets[0] = (width - 150) / 3;
		            iconOffsets[1] = (width - 150) / 3;
				    updateHitbox();

				    animation.add("losing", [1], 0, false, isPlayer);
				    animation.add("winning", [0], 0, false, isPlayer);
				    animation.add("idle", [0], 0, false, isPlayer);
				    animation.play("idle");
			        this.char = char;

			        antialiasing = ClientPrefs.globalAntialiasing;

				case 'happymouse':
					var name:String = 'icons/' + char;
			        if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'icons/icon-' + char; //Older versions of psych engine's support
			        if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'icons/icon-face'; //Prevents crash from missing icon
			        var file:Dynamic = Paths.image(name);

			        loadGraphic(file); //Load stupidly first for getting the file size
			        loadGraphic(file, true, Math.floor(width / 2), Math.floor(height)); //Then load it fr
			        iconOffsets[0] = (width - 150) / 3;
		            iconOffsets[1] = (width - 150) / 3;
				    updateHitbox();

				    animation.add("losing", [1], 0, false, isPlayer);
				    animation.add("winning", [0], 0, false, isPlayer);
				    animation.add("idle", [0], 0, false, isPlayer);
				    animation.play("idle");
			        this.char = char;

			        antialiasing = ClientPrefs.globalAntialiasing;

				case 'happymouse2':
					var name:String = 'icons/' + char;
			        if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'icons/icon-' + char; //Older versions of psych engine's support
			        if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'icons/icon-face'; //Prevents crash from missing icon
			        var file:Dynamic = Paths.image(name);

			        loadGraphic(file); //Load stupidly first for getting the file size
			        loadGraphic(file, true, Math.floor(width / 2), Math.floor(height)); //Then load it fr
			        iconOffsets[0] = (width - 150) / 3;
		            iconOffsets[1] = (width - 150) / 3;
				    updateHitbox();

				    animation.add("losing", [1], 0, false, isPlayer);
				    animation.add("winning", [0], 0, false, isPlayer);
				    animation.add("idle", [0], 0, false, isPlayer);
				    animation.play("idle");
			        this.char = char;

			        antialiasing = ClientPrefs.globalAntialiasing;

				case 'bipolarmouse':
					var name:String = 'icons/' + char;
			        if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'icons/icon-' + char; //Older versions of psych engine's support
			        if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'icons/icon-face'; //Prevents crash from missing icon
			        var file:Dynamic = Paths.image(name);

			        loadGraphic(file); //Load stupidly first for getting the file size
			        loadGraphic(file, true, Math.floor(width / 2), Math.floor(height)); //Then load it fr
			        iconOffsets[0] = (width - 150) / 3;
		            iconOffsets[1] = (width - 150) / 3;
				    updateHitbox();

				    animation.add("losing", [1], 0, false, isPlayer);
				    animation.add("winning", [0], 0, false, isPlayer);
				    animation.add("idle", [0], 0, false, isPlayer);
				    animation.play("idle");
			        this.char = char;

			        antialiasing = ClientPrefs.globalAntialiasing;

				case 'happy':
				    frames = Paths.getSparrowAtlas('icons/happyanim');

				    animation.addByPrefix("losing", "theHappyAnim", 24, true, isPlayer);
				    animation.addByPrefix("winning", "theMouseAnim", 24, true, isPlayer);
				    animation.addByPrefix("idle", "theMouseAnim", 24, true, isPlayer);
				    animation.play("idle");
				    this.char = char;

				    updateHitbox();

				    antialiasing = ClientPrefs.globalAntialiasing;

				case 'happy2':
				    frames = Paths.getSparrowAtlas('icons/happy2anim');

				    animation.addByPrefix("losing", "theWhatAnim", 24, true, isPlayer);
				    animation.addByPrefix("winning", "theHappyAnim", 24, true, isPlayer);
				    animation.addByPrefix("idle", "theHappyAnim", 24, true, isPlayer);
				    animation.play("idle");
				    this.char = char;

				    updateHitbox();

				    antialiasing = ClientPrefs.globalAntialiasing;

			    case 'really':
				    frames = Paths.getSparrowAtlas('icons/reallyanim');

				    animation.addByPrefix("losing", "theHurtAnim", 24, true, isPlayer);
				    animation.addByPrefix("winning", "theReallyAnim", 24, true, isPlayer);
				    animation.addByPrefix("idle", "theReallyAnim", 30, true, isPlayer);
				    animation.play("idle");
				    this.char = char;

				    updateHitbox();

				    antialiasing = ClientPrefs.globalAntialiasing;
		    }
		}
	}

	override function updateHitbox()
	{
		super.updateHitbox();
		offset.x = iconOffsets[0];
		offset.y = iconOffsets[1];

		if(char == 'really')
		{
			offset.x = iconOffsets[0] + 12;
			offset.y = iconOffsets[1] + 12.5;
		}
	}

	public function getCharacter():String {
		return char;
	}
}
