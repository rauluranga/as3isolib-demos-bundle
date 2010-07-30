package 
{
	import flash.display.DisplayObjectContainer;
	import as3isolib.graphics.SolidColorFill;
	import as3isolib.core.IIsoDisplayObject;
	import as3isolib.display.IsoView;
	import as3isolib.display.primitive.IsoBox;
	import as3isolib.display.scene.IsoGrid;
	import as3isolib.display.scene.IsoScene;

	public class GridDrawer
	{

		private var box1:IIsoDisplayObject;
		private var scene:IsoScene;
		private var g:IsoGrid;
		private var view:IsoView;
		private var grid:Grid;
		private var display:DisplayObjectContainer;

		public function GridDrawer(display:DisplayObjectContainer,grid:Grid) 
		{
			this.display = display;
			this.grid = grid;
		}

		private function buildMap():void 
		{
			for ( var i:int = 0;i < GridConstants.TILE_H;++i ) {
				for ( var j:int = 0;j < GridConstants.TILE_W;++j ) {
					if(grid.getCell(i, j)) {
						var box:IsoBox = new IsoBox();
						box.setSize(GridConstants.TILE_SIZE, GridConstants.TILE_SIZE, GridConstants.TILE_SIZE / 4);
						box.x = j * GridConstants.TILE_SIZE;
						box.y = i * GridConstants.TILE_SIZE;
						box.fills = [	
										new SolidColorFill(0x666666, 1), // Top
									    new SolidColorFill(0x999999, 1), // Right 
									    new SolidColorFill(0xCCCCCC, 1), // Front
									    new SolidColorFill(0xffffff, .5),// Back
									    new SolidColorFill(0xffffff, .5),// Left
									    new SolidColorFill(0xffffff, .5)//Bottom
									 ];
						scene.addChild(box);
					}
				}
			}
		}


		public function initialize():void
		{
			scene = new IsoScene();
			
			g = new IsoGrid();
			g.showOrigin = true;
			g.cellSize = GridConstants.TILE_SIZE;
			g.setGridSize(GridConstants.TILE_W, GridConstants.TILE_H, 0);
			scene.addChild(g);
			
			box1 = new IsoBox();
			box1.setSize(20, 20, 20);
			box1.x = grid.charX = GridConstants.START_X * GridConstants.TILE_SIZE;
			box1.y = grid.charY = GridConstants.START_Y * GridConstants.TILE_SIZE;
			
			scene.addChild(box1);
			
			buildMap();
			
			view = new IsoView();
			view.clipContent = false;
			view.showBorder = false;
			view.setSize(display.stage.stageWidth, display.stage.stageHeight);
			view.addScene(scene);
			view.y -= 150;
			
			display.addChild(view);
		}
		
		public function render():void 
		{
			box1.x = grid.charX;
			box1.y = grid.charY;
			
			scene.render();
		}
	}
}