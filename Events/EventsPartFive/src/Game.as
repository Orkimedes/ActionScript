package
{
	import fl.controls.Button;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author Nikk
	 */
	[SWF(width="360", height="150")]
	 
	public class Game extends Sprite 
	{
		[Embed(source = "../lib/sounds/danger.mp3")]
		private var DangerousSound:Class;
		//
		private var sound:Sound;
		private var start:Button;
		private var timer:AppTimer;
		
		public function Game()
		{
			this.stage.scaleMode = StageScaleMode.NO_SCALE;
			this.stage.align = StageAlign.TOP_LEFT;
			this.graphics.lineStyle(1, 0x999999);
			this.graphics.drawRect(0, 0, this.stage.stageWidth - 1, this.stage.stageHeight - 1);
			
			sound = new DangerousSound;
			
			start = new Button();
			start.label = 'start';
			start.x = 40;
			start.y = 40;
			start.addEventListener(MouseEvent.CLICK, startHandler);
			addChild(start);
			//
			timer = new AppTimer();
			
			
		}
	}
	
}