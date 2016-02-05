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
	[SWF(width="1920", height="960")]
	public class JackpotMain extends Sprite 
	{
		
		public function JackpotMain() 
		{
			//var bg:MovieClip = new machine_background();
			var popup:MovieClip = new eligibility_screen_popup();
			//addChild(bg);
			addChild(popup);
			popup.x = 10;
			popup.y = 10;
			
			var bs:ButtonSimple = new ButtonSimple(popup.do_btn);
			bs.addEventListener(MouseEvent.CLICK, onClick);
			//popup.do_btn.addEventListener(MouseEvent.CLICK, onDoButtonClick);
		}
		
		
		private function onClick(e:MouseEvent):void 
		{
			trace("click");
			remove();
		}
		
		public function remove():void
			{
			if (parent)
			{
			parent.removeChild(this);
			}
			}
		
	}
	
}