package 
{
	import flash.events.Event;
	/**
	 * ...
	 * @author Nikk
	 */
	public class AppTimerEvent extends Event
	{
		public static const TICK:String = 'appTimerTick';
		public static const COMPLETE:String = 'appTimerComplete';
		public var remained:Number;
		public var danger:Boolean;
		//
		public function AppTimerEvent(type:String) 
		{
			super(type);
		}
		
	}

}