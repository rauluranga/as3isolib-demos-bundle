package  
{

	/**
	 * @author Raul Uranga
	 */
	public class GridController 
	{
		private var grid:Grid;
		
		public function GridController(grid:Grid) 
		{
			
			this.grid = grid;
		}

		public function moveCharLeft():void 
		{
			grid.charX += GridConstants.SPEED;
		}

		public function moveCharRight():void 
		{
			grid.charX -= GridConstants.SPEED;
		}

		public function moveCharDown():void 
		{
			grid.charY += GridConstants.SPEED;
		}

		public function moveCharUp():void 
		{
			grid.charY -= GridConstants.SPEED;
		}
	}
}
