package 
{
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Nikk
	 */
	public class AppTimer extends Sprite
	{
		private var timerTextField:TextField;
		private var systemTimer:Timer;
		
		public function AppTimer() 
		{
			super();
			//текстовое поле для вывода времени таймера
			timerTextField = new TextField();
			timerTextField.defaultTextFormat = new TextFormat('Tahoma', 12);
			this.addChild(timerTextField);
			//
			systemTimer = new Timer(1000);
			systemTimer.addEventListener(TimerEvent.TIMER,
		}
		
	}

}