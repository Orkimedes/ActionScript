package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Nikk
	 */
	public class MainBackgroundPopup extends PopupSimple 
	{
		private var _doBtn:ButtonSimple;
		
		public function MainBackgroundPopup(content:MovieClip) 
		{
			super(content);
			_doBtn = new ButtonSimple(content.do_btn);
			_doBtn.addEventListener(MouseEvent.CLICK, onClick);
			//popup.do_btn.addEventListener(MouseEvent.CLICK, onDoButtonClick);
		}
		
		private function onClick(e:Event):void 
		{
			_doBtn.removeEventListener(MouseEvent.CLICK, onClick);
			close();
		}
		
	}

}