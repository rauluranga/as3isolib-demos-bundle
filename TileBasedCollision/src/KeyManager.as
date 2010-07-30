package  
{
	import flash.display.Stage;
	import flash.ui.Keyboard;

	/**
	 * @author Raul Uranga
	 */
	 
	
	public class KeyManager 
	{
		private var controller:GridController;

		public function KeyManager(controller:GridController) 
		{
			this.controller = controller;
		}

		public function initialize(stage:Stage):void 
		{
			Key.initialize(stage);	
		}
		
		public function readKeys():void 
		{
			if(Key.isDown(Keyboard.DOWN)) {
				controller.moveCharLeft();
			} else
			if(Key.isDown(Keyboard.UP)) {
				controller.moveCharRight();
			} else
			if(Key.isDown(Keyboard.LEFT)) {
				controller.moveCharDown();
			} else
			if(Key.isDown(Keyboard.RIGHT)) {
				controller.moveCharUp();
			}
		}
	}
}
