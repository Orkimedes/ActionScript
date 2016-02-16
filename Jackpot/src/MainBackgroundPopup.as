package 
{
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Nikk
	 */
	public class MainBackgroundPopup
	{
		protected var _cont:MovieClip;
		public var _machine01:ButtonSimple;
		public var _machine02:ButtonSimple;
		
		public function MainBackgroundPopup(content:MovieClip) 
		{
			_cont = content;
			_machine01 = new ButtonSimple(content.machine01);
			_machine02 = new ButtonSimple(content.machine02);
			_machine01.addEventListener(MouseEvent.CLICK, closePopup);
			_machine02.addEventListener(MouseEvent.CLICK, closePopup);
		}
		
		public function show(parentCont:DisplayObjectContainer):void
		{
			if (parentCont && _cont) {
				parentCont.addChild(_cont);
				//_cont.x = (_cont.stage.stageWidth - _cont.width) / 2;
				//_cont.y = (_cont.stage.stageHeight -_cont.height) / 2;
			}
		}
		
		
		public function close():void
		{
			if (_cont && _cont.parent) {
					_cont.parent.removeChild(_cont);
			}
		}
		public function closePopup(e:Event):void 
		{
			_machine01.dispatchEvent(new Event('openIlegibilityScreen'));
			_machine01.removeEventListener(MouseEvent.CLICK, closePopup);
			_machine02.removeEventListener(MouseEvent.CLICK, closePopup);
			close();
		}
	}

}
/*package 
* 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	

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

}*/