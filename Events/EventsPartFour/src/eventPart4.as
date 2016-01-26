package
{
    import flash.display.Sprite;
    import flash.events.MouseEvent;
    
    public class eventPart4 extends Sprite
    {
        public function eventPart4()
        {
            var parentView:Sprite = new Sprite();
            parentView.graphics.beginFill(0x2ea6bd, 1);
            parentView.graphics.drawRect(0, 0, 300, 300);
            parentView.graphics.endFill();
            parentView.x = 40;
            parentView.y = 40;
            this.addChild(parentView);
            parentView.addEventListener(MouseEvent.CLICK, parentClickHandler);
            //
            var childView:Sprite = new Sprite();
            childView.graphics.beginFill(0xffe330, 1);
            childView.graphics.drawRoundRect(0, 0, 120, 60, 20, 20);
            childView.graphics.endFill();
            childView.x = 90;
            childView.y = 120;
            parentView.addChild(childView);
            childView.addEventListener(MouseEvent.CLICK, childClickHandler);
			childView.addEventListener(MouseEvent.CLICK, childClickHandler02);
            //
        }
        
        private function parentClickHandler(event:MouseEvent):void
        {
            trace('parentClickHandler');
        }
        
        private function childClickHandler(event:MouseEvent):void
        {
            trace('childClickHandler');
            event.stopImmediatePropagation();
        }
		
		private function childClickHandler02(event:MouseEvent):void
		{
			trace('childClickHandler02');
		}
    }
}