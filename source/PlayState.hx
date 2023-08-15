package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.input.keyboard.FlxKey;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	/* 
		This is a project where I try and make a square to be able to hit a another square which will act like a ball.
	 */
	// * Character controller
	var groundLevel = 700;
	var player:FlxSprite;
	var movementMultiplier = 10;
	var jumpMultiplier = 50;

	// * Ball Controller
	var ball:FlxSprite;
	var currentPlayerDirection = 0; // 0 = Not Moved, 1 = left, 2 = right.

	override public function create()
	{
		player = new FlxSprite();
		player.makeGraphic(80, 20, FlxColor.WHITE);
		add(player);

		ball = new FlxSprite();
		ball.makeGraphic(30, 30, FlxColor.RED);
		ball.screenCenter(X);
		ball.y += 150;
		add(ball);
	}

	override public function update(elapsed:Float)
	{
		// Player Controller
		playerManager();
		// Ball Controller
		ballController();
	}

	public function ballCollision(Obj1:FlxSprite, Obj2:FlxSprite)
	{
		if (currentPlayerDirection == 1)
		{
			Obj1.y -= 200;
			Obj1.x -= 50;
		}
		else if (currentPlayerDirection == 2)
		{
			Obj1.y -= 200;
			Obj1.x += 50;
		}
	}

	public function ballController()
	{
		if (ball.y != groundLevel)
		{
			ball.y += 5;
		}

		FlxG.collide(ball, player, ballCollision);
	}

	public function playerManager()
	{
		if (player.y != groundLevel)
		{
			player.y += 10;
		}

		if (FlxG.keys.anyPressed([FlxKey.LEFT]))
		{
			player.x -= 10;
			currentPlayerDirection = 1;
		}

		if (FlxG.keys.anyPressed([FlxKey.RIGHT]))
		{
			player.x += 10;
			currentPlayerDirection = 2;
		}

		if (FlxG.keys.anyPressed([FlxKey.O]))
		{
			player.x = ball.x - 100;
			player.y -= 20;
		}

		// if (FlxG.keys.anyPressed([FlxKey.B]))
		// {
		// 	ball.x = player.x += 100;
		// 	ball.y = player.y -= 10;
		// }
	}
}
