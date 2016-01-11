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
		
		public function MainView() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private var parentView:Sprite;
		private var childView1:Sprite;
		private var childView2:Sprite;
		private var subChildView:Sprite;
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			parentView = new Sprite();
			
			childView1 = new Sprite();
			childView1.graphics.beginFill(0xff0000, 1);
			childView1.graphics.drawRect(30, 30, 100, 100);
			childView1.graphics.endFill();
			
			childView2 = new Sprite();
			childView2.graphics.beginFill(0x00ff00, 1);
			childView2.graphics.drawRect(160, 30, 100, 100);
			childView2.graphics.endFill();
			
			subChildView = new Sprite();
			subChildView.graphics.beginFill(0x0000ff, 1);
			subChildView.graphics.drawRect(30, 160, 100, 100);
			subChildView.graphics.endFill();
			
			this.addChild(parentView);
			parentView.addChild(childView1);
			parentView.addChild(childView2);
			childView1.addChild(subChildView);
			
			parentView.addEventListener(MouseEvent.CLICK, parentClickHandler, false);// событие прослушивается в фазе захвата
			childView1.addEventListener(MouseEvent.CLICK, childView1ClickHandler01);
			childView2.addEventListener(MouseEvent.CLICK, childView1ClickHandler02,false); //приоритет - теперь это событие выполнится раньше
			stage.addEventListener(MouseEvent.CLICK, stageClickHandler);
			subChildView.addEventListener(MouseEvent.CLICK, subChildViewClickHandler);
		}
		
		private function parentClickHandler(e:MouseEvent):void
		{
			trace('parentClickHandler');
		}
		
		private function childView1ClickHandler01(e:MouseEvent):void
		{
			trace('childView1ClickHandler01');
		}
		private function childView1ClickHandler02(e:MouseEvent):void
		{
			trace('childView1ClickHandler02');
		}
		
		private function stageClickHandler(e:MouseEvent):void
		{
			trace('stageClickHandler');
			trace('end');
		}
		private function subChildViewClickHandler(e:MouseEvent):void
		{
			trace('subChildViewClickHandler');
		}
	}
	
}