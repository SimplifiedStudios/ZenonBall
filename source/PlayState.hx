package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxState;
import flixel.input.keyboard.FlxKey;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	// * Character Controller
	var player:FlxSprite;
	var walkingValue = 10;
	var jumpingValue = 100;
	var movementDirection = 0; // 0 = Null, 1 = Left, 2 = right
	// * Ball controller
	var ball:FlxSprite;
	var isCarried = false;
	var throwValue = 100;
	// * Ground Controller
	var groundLevel = 700;

	override public function create()
	{
		super.create();

		player = new FlxSprite();
		player.makeGraphic(30, 50, FlxColor.WHITE);
		player.screenCenter(X);
		player.x += 200;
		add(player);

		ball = new FlxSprite();
		ball.makeGraphic(30, 30, FlxColor.RED);
		ball.screenCenter(X);
		add(ball);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		playerController();
		ballController();
	}

	public function ballController()
	{
		if (isCarried == false)
		{
			if (ball.y != groundLevel)
			{
				ball.y += 10;
			}

			if (ball.y > groundLevel)
			{
				ball.y = 600;
			}
		}
		else
		{
			ball.x = player.x;
			ball.y = player.y - 15;
		}
	}

	public function playerController()
	{
		if (player.y != groundLevel)
		{
			player.y += 10;
		}

		if (FlxG.keys.anyPressed([FlxKey.LEFT]))
		{
			player.x -= walkingValue;
			movementDirection = 1;
		}

		if (FlxG.keys.anyPressed([FlxKey.RIGHT]))
		{
			player.x += walkingValue;
			movementDirection = 2;
		}

		if (FlxG.keys.anyPressed([FlxKey.SPACE]))
		{
			player.y -= jumpingValue;
		}

		if (FlxG.keys.anyPressed([FlxKey.E]))
		{
			if (isCarried == false)
			{
				return;
			}
			else
			{
				isCarried = false;
				ball.y += 200;
				if (movementDirection == 1)
				{
					ball.x -= 400;
				}
				else if (movementDirection == 2)
				{
					ball.x += 400;
				}
			}
		}

		if (FlxG.keys.anyPressed([FlxKey.Q]))
		{
			if (isCarried)
			{
				isCarried = false;
				ball.x -= 50;
				ball.y -= 300;
			}
		}

		if (isCarried)
		{
			return;
		}
		else
		{
			FlxG.collide(ball, player, giveBallToPlayer);
		}
	}

	public function giveBallToPlayer(ball:FlxSprite, player:FlxSprite)
	{
		if (isCarried)
		{
			return;
		}
		else
		{
			isCarried = true;
		}
	}
}
