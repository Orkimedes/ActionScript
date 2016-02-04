package 
{
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	import ru.flashpress.color.FPColorConversion;
	import ru.flashpress.color.FPColorRGBa;
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
			systemTimer.addEventListener(TimerEvent.TIMER, tickHandler);
			systemTimer.addEventListener(TimerEvent.TIMER_COMPLETE, completeHandler);
		}
		
		private function showTime():void
		{
			timerTextField.text = 'осталось: ' + remainedTime;
			var remainedPercent:Number = remainedTime / maxTime;
			//определяем цвет таймера - если осталось > 50% то черный, если нет - красный
			if (remainedPercent < 0.5)
			{
				var percent:Number = remainedPercent / 0.5;
				var Red:Number = 255 * (1 - percent);
				var rgb:FPColorRGBa = FPColorConversion.CreateRGBaWithChanels(Red, 0, 0);
				timerTextField.textColor = rgb.Color;
			}
			else {
				timerTextField.textColor = 0x0;
			}
			
			//создаем объект события
			var event:AppTimerEvent = new AppTimerEvent(AppTimerEvent.TICK);
			//задаем параметры
			event.remainedTime = remainedTime;//оставшееся время
			event.danger = remainedPercent < 0.5;//показатель того, что цвет нужно изменить
			this.dispatchEvent(event);
		}
		//обработчик события тиканья системного таймера
		private function tickHandler(event:TimerEvent):void
		{
			remainedTime--;
			//вызов метода, который покажет оставшееся время
			showTime();
		}
		//обработчик события окончания системного таймера
		private function completeHandler(event:TimerEvent):void
		{
			//создаем событие AppTimerEvent.COMPLETE
			this.dispatchEvent(new AppTimerEvent(AppTimerEvent.COMPLETE));
		}
		
		//максимальное и оставшееся время таймера
		private var maxTime:int;
		private var remainedTime:int;
		
		//старт таймера
		public function Start(maxTime:int):void
		{
			this.maxTime = maxTime;
			//задаем оставшееся время как максимальное на данный момент
			this.remainedTime = maxTime;
			//показываем время в textField;
			showTime();
			//задаем системному таймеру количество повторов
			systemTimer.repeatCount = maxTime;
			systemTimer.reset();//обновляем
			systemTimer.start();//стартуем
		}
		
	}

}