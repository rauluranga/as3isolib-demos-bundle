package 
{
	import flash.display.MovieClip;
	import flash.events.Event;

	public class TileBasedCollision extends MovieClip 
	{
		private var grid:Grid;
		private var keyManager:KeyManager;
		private var display:GridDrawer;

		public function TileBasedCollision() 
		{
			grid = new Grid();
			grid.initialize();
			
			keyManager = new KeyManager(new GridController(grid));
			keyManager.initialize(this.stage);
			
			display = new GridDrawer(this, grid);
			display.initialize();
			
			this.addEventListener(Event.ENTER_FRAME, render_handler);
		}

		private function render_handler(evt:Event):void 
		{
			keyManager.readKeys();
			grid.update();
			display.render();
		}
	}
}