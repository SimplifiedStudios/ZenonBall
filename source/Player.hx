package;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class Player extends FlxSprite
{
	public function new(x:Float, y:Float, GroundLevel:Int)
	{
		makeGraphic(50, 50, FlxColor.WHITE);
		super(x, y);
	}

	public override function update()
	{
		if (y != GroundLevel)
		{
			y += 10;
		}

		if (FlxG.keys.anyPressed([FlxKey.LEFT]))
		{
			x -= 10;
		}

		if (FlxG.keys.anyPressed([FlxKey.RIGHT]))
		{
			x += 10;
		}

		if (FlxG.keys.anyPressed([FlxKey.UP]))
		{
			if (y == GroundLevel)
			{
				y -= 50;
			}
		}
	}
}
