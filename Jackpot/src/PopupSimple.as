package 
{
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Nikk
	 */
	public class PopupSimple 
	{
		protected var _cont:MovieClip;
		
		public function PopupSimple(content:MovieClip) 
		{
			_cont = content;
		}
		
		public function show(parentCont:DisplayObjectContainer):void
		{
			if (parentCont && _cont) {
				parentCont.addChild(_cont);
			}
		}
		
		public function close():void
		{
			if (_cont && _cont.parent) {
					_cont.parent.removeChild(_cont);
			}
		}
		
	}

}