package
{	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author me
	 */
	public class Main extends Sprite 
	{
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			var popup:MovieClip = new new_game_unlocked_pop_up_86();
			addChild(popup);
			popup.x = 10;
			popup.y = 10;
			
			popup.do_btn.addEventListener(MouseEvent.CLICK, onDoButtonClick);
		}
		
		private function onDoButtonClick(event:MouseEvent):void {
			var popup:MovieClip = event.currentTarget as MovieClip;
			
			if (contains(popup)) {
				removeChild(popup);
			}
		}
		
	}
	
}