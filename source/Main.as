package 
{
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.*;
	import flash.display.Sprite;
	import org.flixel.FlxGame;
	import org.flixel.FlxG;

	/**
	 * Flixel RPG Framework
	 * @author Josh Maines
	 * @site www.joshmaines.com
	 */
	/** This file is the entrance of the program, where everything starts.
	 * This is where we initiate the base systems of both Flixel and the RPG framework.
	*/
	public class Main extends Sprite
	{

		protected var wRatio:Number;
		protected var hRatio:Number;
		public var FlxCon:FlxGame;
		
		public function Main()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			FlxCon = new FlxGame(740, 480, StartState, 1, 60, 60); // See StartState.as for the starting level's code.
			Details.GUICon = new Sprite();
			addChild(FlxCon);
			addChild(Details.GUICon);
			FlxCon.x = 0;
			FlxCon.y = 0;
			Details.GUICon.x = 0;
			Details.GUICon.y = 0;
			FlxCon.forceDebugger = true;
			FlxCon.scaleX = 1;
			FlxCon.scaleY = 1;
			Details.GUICon.scaleX = 1;
			Details.GUICon.scaleY = 1;
			//GUICon.addChild(MoveNode);
			//stage.addEventListener(Event.RESIZE, window_resized);
			//stage.addEventListener(Event., window_resized);
		}

		protected function window_resized(FlashEvent:Event = null):void
		{
			wRatio = stage.stageWidth / Details.gameResOX;
			hRatio = stage.stageHeight / Details.gameResOY;
			if (wRatio > hRatio) {
				FlxCon.scaleX = wRatio;
				FlxCon.scaleY = hRatio;
				FlxCon.x = 0;
				//FlxCon.x = Math.floor(stage.stageWidth/2-Details.gameResOX/2);
				FlxCon.y = 0;
			} else {
				FlxCon.scaleX = wRatio;
				FlxCon.scaleY = wRatio;
				FlxCon.x = 0;
				FlxCon.y = 0;
				//FlxCon.y = Math.floor(((Details.gameResOY * wRatio)-Details.gameResOY)/2);
			}
		}
		
	}

}