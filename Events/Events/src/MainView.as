package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Nikk
	 */
	public class MainView extends Sprite 
	{
		private var parentView:Sprite;
		private var childView1:Sprite;
		private var childView2:Sprite;
		private var subChildView:Sprite;
		
		public function MainView() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			var clip1:Sprite = new Sprite();
			clip1.graphics.beginFill(0xff0000, 1);
			clip1.graphics.drawRect(0, 0, 100, 100);
			clip1.graphics.endFill();
			clip1.x = 10;
			clip1.y = 10;
			clip1.name = 'red'; //свойство name аналогично ID во flash IDE
			this.addChild(clip1);
			clip1.addEventListener(MouseEvent.CLICK, clickHandler);
			
			var clip2:Sprite = new Sprite();
			clip2.graphics.beginFill(0x00ff00, 1);
			clip2.graphics.drawRect(0, 0, 100, 100);
			clip2.graphics.endFill();
			clip2.x = 150;
			clip2.y = 10;
			clip2.name = 'green';
			this.addChild(clip2);
			clip2.addEventListener(MouseEvent.CLICK, clickHandler);
		}
		
		private function clickHandler(event:MouseEvent):void {
			var traceTarget:Sprite = event.target as Sprite; // зачем это все?
			trace('clickHandler');
			trace(traceTarget.name);
		}

	}
	
}