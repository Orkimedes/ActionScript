package  {

	import flash.display.FrameLabel;
	import flash.display.InteractiveObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.text.TextField;


	/**
	 * Implementation of a button with all its functionality. Gets a movie clip and handles several mouse event like:
	 * MOUSE_OVER, MOUSE_OUT, MOUSE_DOWN and CLICK. It has fixed lables: BUTTON_REFERENCE_NAME,
	 * LABEL_UP, LABEL_OVER, LABEL_ROLL_OUT, LABEL_DOWN, LABEL_DIS.
	 */
	public class ButtonSimple extends EventDispatcher {

		protected static const BUTTON_REFERENCE_NAME:String = "attachedButton";
		protected static const LABEL_DIS:String = "dis";
		protected static const LABEL_DOWN:String = "down";
		protected static const LABEL_OVER:String = "over";
		protected static const LABEL_ROLL_OUT:String = "roll";
		protected static const LABEL_UP:String = "up";

		protected var additional_data:Object;

		protected var current_label_name:String;
		private var text_field:TextField;
		protected var current_text:String;

		protected var enable:Boolean;

		protected var visual_content:MovieClip;
		private var click_sound_name:String;

		protected var mouse_out_lable_name:String = LABEL_UP;

		private var over_sound_name:String;

		public function ButtonSimple(content:MovieClip, click_sound_name:String = null, over_sound_name:String = null) {

			this.click_sound_name = click_sound_name;
			this.over_sound_name = over_sound_name;
			visual_content = content;
			enable = true;


			visual_content[BUTTON_REFERENCE_NAME] = this;

			current_label_name = LABEL_UP;
			mouse_out_lable_name = hasLable(LABEL_ROLL_OUT) ? LABEL_ROLL_OUT : LABEL_UP;

			text_field = content.getChildByName("text") as TextField;
			current_text = (text_field) ? text_field.text : "";


			updateDisplay();

			addListeners();

			if (getHitZone() == content) {
				content.mouseChildren = false;
				content.buttonMode = true;
				content.useHandCursor = true;
			}
		}

		public static function getAttachedControl(movie:MovieClip):ButtonSimple {

			return (movie[BUTTON_REFERENCE_NAME] as ButtonSimple);
		}

		public function setOverSound(soundName:String):void {
			this.over_sound_name = soundName;
		}

		public function setClickSound(soundName:String):void {
			this.click_sound_name = soundName;
		}

		public function get content():MovieClip {

			return visual_content;
		}

		public function get data():Object {

			return additional_data;
		}

		public function set data(value:Object):void {

			additional_data = value;
		}

		public function get enabled():Boolean {

			return enable;
		}

		/**
		 * Sets the enable variable. If value is true, it also update the state
		 * to lable = 'up' and if not it update the state to lable = 'dis'.
		 * It also set the mouseChildren to value.
		 * @param value
		 *
		 */
		public function set enabled(value:Boolean):void {

			enable = value;

			hitZoneEnable = value;
			if (value) {
				updateState(LABEL_UP);
			} else {
				updateState(LABEL_DIS);
			}
			var hit_zone:InteractiveObject = getHitZone();
			hit_zone.mouseEnabled = value;
		}

		public function free():void {

			//this.buttonDisplayObject = null;
			//this.gameData = null;
		}

		public function get text():String {

			return current_text;
		}

		public function set text(value:String):void {

			current_text = value;

			if (text_field) {
				text_field.text = value;
				text_field.selectable = false;
				//TODO: approve delitation
				//Auxx.setText(textField, value);
			}
		}

		public function get textField():TextField {
			return text_field;
		}

		public function get name():String {

			return visual_content.name;
		}

		public function destroy():void {

			getHitZone().removeEventListener(MouseEvent.MOUSE_OVER, onMouseOverEvent);
			getHitZone().removeEventListener(MouseEvent.MOUSE_OUT, onMouseOutEvent);
			getHitZone().removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDownEvent);
			getHitZone().removeEventListener(MouseEvent.CLICK, onMouseClickEvent);

			visual_content = null;
		}

		public function addListeners():void {

			getHitZone().addEventListener(MouseEvent.MOUSE_OVER, onMouseOverEvent);
			getHitZone().addEventListener(MouseEvent.MOUSE_OUT, onMouseOutEvent);
			getHitZone().addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownEvent);
			getHitZone().addEventListener(MouseEvent.CLICK, onMouseClickEvent);
		}

		public function removeListeners():void {

			getHitZone().removeEventListener(MouseEvent.MOUSE_OVER, onMouseOverEvent);
			getHitZone().removeEventListener(MouseEvent.MOUSE_OUT, onMouseOutEvent);
			removeDoListeners();
		}

		public function removeDoListeners():void {
			getHitZone().removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDownEvent);
			getHitZone().removeEventListener(MouseEvent.CLICK, onMouseClickEvent);
		}

		protected function getHitZone():InteractiveObject {

			var hit_zone:InteractiveObject;

			if (content.hasOwnProperty("hit")) {
				hit_zone = content["hit"] as InteractiveObject;
			} else {
				hit_zone = content;
			}

			return hit_zone;
		}

		/**
		 * Returns true if there is a lable with this name (lable_name) to the button's m.c
		 * and false if not.
		 * @param lable_name
		 * @return
		 *
		 */
		protected function hasLable(lable_name:String):Boolean {

			for each(var label:FrameLabel in content.currentLabels) {
				if (lable_name == label.name) {
					return true;
				}
			}
			return false;
		}

		/**
		 * Function that handles the mouse event - CLICK.
		 * @param event
		 *
		 */
		protected function onMouseClickEvent(event:Event):void {

			updateState(LABEL_OVER);
			redispatchEvent(event);

		}

		/**
		 * Function that handles the mouse event - MOUSE_DOWN.
		 * @param event
		 *
		 */
		protected function onMouseDownEvent(event:Event):void {

			updateState(LABEL_DOWN);
			redispatchEvent(event);
		}

		/**
		 * Handles the mouse event - MOUSE_OUT.
		 * @param event
		 *
		 */
		protected function onMouseOutEvent(event:Event):void {

			if (enabled) {
				updateState(mouse_out_lable_name);
				redispatchEvent(event);
			}
		}

		/**
		 * Handles the mouse event - MOUSE_OVER.
		 * @param event
		 *
		 */
		protected function onMouseOverEvent(event:Event):void {

			updateState(LABEL_OVER);
			redispatchEvent(event);
		}

		protected function redispatchEvent(event:Event):void {

			dispatchEvent(event.clone());

			event.stopImmediatePropagation();
		}

		/**
		 * Plays the current lable.
		 *
		 */
		protected function updateDisplay():void {

			//if (DisplayObjectUtil.hasLabel(content, current_label_name)) {
				content.gotoAndPlay(current_label_name);
			//}

			text_field = content.getChildByName("text") as TextField;
			text = current_text;
		}

		/**
		 * Updates the state of the button. If value == true, it updates the state to be
		 * lable = 'down' and if value == false, lable = 'up'.
		 * @param value
		 *
		 */
		protected function updateSelectState(value:Boolean):void {

			if (value) {
				updateState(LABEL_DOWN);
			} else {
				updateState(LABEL_UP);
			}
		}

		/**
		 * Update the currentLableName variable to be stateName. If it is the same name,
		 * it does nothing and if it is not, it play the lable with the stateName.
		 * @param stateName
		 *
		 */
		protected function updateState(stateName:String):void {

			if (current_label_name == stateName) {
				return;
			}

			current_label_name = stateName;

			updateDisplay();
		}

		protected function set hitZoneEnable(value:Boolean):void {
			var hit_zone:InteractiveObject = getHitZone();
			hit_zone.mouseEnabled = value;
		}

	}
}