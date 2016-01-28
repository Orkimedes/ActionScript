package
{
	import fl.controls.Button;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.media.Sound;
	
	/**
	 * ...
	 * @author Nikk
	 */
	[SWF(width="1000", height="800")]
	 
	public class Game extends Sprite 
	{
	[Embed(source = "../lib/sounds/danger.mp3")]
		private var DangerousSound:Class;
		//
		private var sound:Sound;
		private var start:Button;
		
	
	}
	
}