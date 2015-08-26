package  
{
	import flash.display.*;
	import flash.text.*;
	import flash.geom.Matrix;
	import flash.text.TextField;
	import flash.events.Event;
	import flash.events.TextEvent;
	import flash.events.MouseEvent;
	import flash.filters.GlowFilter;
	
	public class Button extends Sprite 
	{	
		private const COLORS:Array = [0xFAD4DB, 0xEC748B, 0xC13A59, 0xA81230];
		private const COLORS2:Array = [0xcfd3e8, 0x9aa2cf, 0x4e5ba4, 0x3d4881];
		private const COLORS3:Array = [0x006400, 0x008000, 0x228b22, 0x2e8b57];
		private const ALPHAS:Array = [100, 100, 100, 100];
		private const RATIOS:Array = [0, 126, 127, 255];
		private const MATRIX:Matrix = new Matrix();

		private var labelBtn:TextField;
		private var myFormat:TextFormat = new TextFormat();
		private var labelGlow:GlowFilter = new GlowFilter(0xFFFFFF, .50, 4, 4, 3, 3);
		private var labelFilters:Array = [labelGlow];
		
		private var widthBtn:Number = 130;
		private	var heightBtn:Number = 30;
		
		public function Button() 
		{
			myFormat.align = "center";
			myFormat.font = "Tahoma";
			myFormat.size = 16;
			myFormat.color = 0xFFFFFF;	
			
			graphics.lineStyle(0, 0x820F26, 60, true, "none", "square", "round");
			
			//матрица для градиента
			MATRIX.createGradientBox(widthBtn, heightBtn, 90/180*Math.PI);

			graphics.beginGradientFill(GradientType.LINEAR, COLORS, ALPHAS, RATIOS, MATRIX);
			graphics.drawRect(0, 0, widthBtn, heightBtn);
			graphics.endFill();

			labelBtn = new TextField();
			labelBtn.width = widthBtn;
			labelBtn.height = heightBtn-5;
			labelBtn.y = 5;
			labelBtn.selectable = false;
			labelBtn.text = "Кнопка";
			labelBtn.setTextFormat(myFormat);
			labelBtn.filters = labelFilters;

			buttonMode = true;
			//this.useHandCursor = true;
			
			labelBtn.mouseEnabled = false;
			
			addChild(labelBtn);
			registerListeners();
		}
		
		// добавлены методы для добавления слушателей и для удаления слушателей, методы должны выполнять одну функцию, нужно четко разделять их на однозначные части
		private function registerListeners():void
		{
			addEventListener(MouseEvent.MOUSE_OVER, onMouseOver, false, 0, true);
			addEventListener(MouseEvent.MOUSE_OUT, onMouseOut, false, 0, true);
			addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		}
		
		public function destroy():void
		{
			removeEventListener(MouseEvent.MOUSE_OVER, onMouseOver); 	
			removeEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		}
		
		//setter-функция - установка текста кнопки
		public function set label(text:String):void
		{
			labelBtn.text = text;
			//восстанавливаем форматирование текста, т.к. оно сбрасывается при изменении текста
			labelBtn.setTextFormat(myFormat);
		}
		
		private function onMouseOver(e:MouseEvent):void
		{
			graphics.beginGradientFill(GradientType.LINEAR, COLORS2, ALPHAS, RATIOS, MATRIX);
			graphics.drawRect(0, 0, widthBtn, heightBtn);
			graphics.endFill();
		}
		
		private function onMouseOut(e:MouseEvent):void
		{
			graphics.beginGradientFill(GradientType.LINEAR, COLORS, ALPHAS, RATIOS, MATRIX);
			graphics.drawRect(0, 0, widthBtn, heightBtn);
			graphics.endFill();
		}
		
		private function onMouseDown(e:MouseEvent):void
		{
			graphics.beginGradientFill(GradientType.LINEAR, COLORS3, ALPHAS, RATIOS, MATRIX);
			graphics.drawRect(0, 0, widthBtn, heightBtn);
			graphics.endFill();
		}
		
		private function onMouseUp(e:MouseEvent):void
		{
			graphics.beginGradientFill(GradientType.LINEAR, COLORS2, ALPHAS, RATIOS, MATRIX);
			graphics.drawRect(0, 0, widthBtn, heightBtn);
			graphics.endFill();
		}
	}
}