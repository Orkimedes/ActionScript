package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Nikk
	 */
	[SWF(width="1920", height="960")]
	public class JackpotMain extends Sprite 
	{
		
		private var mainBackground:MainBackgroundPopup;
		private var _pp		:PopupSimple;
		private var _pp2	:PopupSimple;
		private var machine:Machine;
		public function JackpotMain() 
		{
			//старый метод вызова
			/*
			//var bg:MovieClip = new machine_background();
			var popup:MovieClip = new eligibility_screen_popup();
			//addChild(bg);
			addChild(popup);
			popup.x = 10;
			popup.y = 10;
			
			var bs:ButtonSimple = new ButtonSimple(popup.do_btn);
			bs.addEventListener(MouseEvent.CLICK, onClick);
			//popup.do_btn.addEventListener(MouseEvent.CLICK, onDoButtonClick);
			
			*/
			_pp = new PopupSimple(new eligibility_screen_popup());
			_pp2 = new PopupSimple(new jackpot_info_popup());
			machine = new Machine(new machine_background());
			mainBackground = new MainBackgroundPopup(new main_bg());
			mainBackground.show(this);
			mainBackground._machine01.addEventListener('openIlegibilityScreen', switchToMachine);

		}
		
		private function switchToMachine(event:Event):void
        {
            machine.show(this);
			_pp.show(this);
        }
		
		
		
	}
	
}