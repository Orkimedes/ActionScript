package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Nikk
	 */
	[SWF(width="1024", height="768")]
	public class JackpotMain extends Sprite 
	{
		
		public function JackpotMain() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			var popup:MovieClip = new eligibility_screen_popup();
			addChild(popup);
			popup.x = 10;
			popup.y = 10;
			
			//popup.do_btn.addEventListener(MouseEvent.CLICK, onDoButtonClick);
		}
		
		
	}
	
}