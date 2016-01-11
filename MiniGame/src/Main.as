package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Nikk
	 */
	public class Main extends Sprite 
	{
		public var mainGameWindow:MovieClip;
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			var popup:MovieClip = new  miniGamePopup();
			addChild(popup);
			//http://help.adobe.com/ru_RU/FlashPlatform/reference/actionscript/3/flash/display/Loader.html
		}
		
	}
	
}