package;

import flixel.FlxState;

class PlayState extends FlxState
{
	/* 
		This is a project where I try and make a square to be able to hit a another square which will act like a ball.
	 */
	// * Character controller
	public player:Player;
	override public function create()
	{
		player = new Player(0, 700, 700)
	}
}
