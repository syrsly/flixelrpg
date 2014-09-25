package 
{
	import org.flixel.*;
	
	/**
	 * Flixel RPG Framework
	 * @author Josh Maines
	 * @site www.joshmaines.com
	 */
	/** This file is an extension of the Main.as entrance file that runs through the Flixel engine.
	 * This is where we tell Flixel what to do at the start of the game.
	*/
	public class StartState extends FlxState
	{
		
		override public function create():void
		{
			// Add text to the screen that says the game title and version and tells the player how to continue.
			FlxG.stage.displayState = "fullScreenInteractive";
			var t:FlxText;
			t = new FlxText(0,FlxG.height/2-50,FlxG.width,"LightStone");
			t.size = 18;
			t.alignment = "center";
			add(t);
			t = new FlxText(0,FlxG.height/2,FlxG.width,"version 0.2");
			t.size = 16;
			t.alignment = "center";
			add(t);
			t = new FlxText(FlxG.width/2-50,FlxG.height-20,100,"click or press A to continue");
			t.alignment = "center";
			add(t);
			
			Details.beginData(); //See Details.as file for the code behind this mysterious function.

			FlxG.mouse.show();
		}

		override public function update():void
		{
			super.update(); // Run the FlxState update function before any code this extended class adds.

			if(FlxG.mouse.justPressed() || FlxG.keys.justReleased("A"))
			{
				FlxG.mouse.hide();
				FlxG.switchState(new Introduction()); //Go to next screen.  See Introduction.as for the code that this function calls.
			}
		}
	}
	
}