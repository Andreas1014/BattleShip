package  
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	
	/**
	 * ...
	 * @author Andreas Sjöstrand
	 */
	public class Tiles extends Sprite 
	{
		private var _hasShip:Boolean = false;
		
		private const TILE_SIDE:int = 50;
		
		[Embed(source = "../lib/water tile.jpg")]  //add image water tile
		private var tile:Class;
		private var waterTile:Bitmap = new tile;
		
		[Embed(source = "../lib/splash tile.jpg")]   //ass image splash tile(miss tile)
		private var tile2:Class;
		private var splashTile:Bitmap = new tile2; 
		
		[Embed(source = "../lib/explosion tile.jpg")]   // add image explosion tile
		private var tile3:Class;
		private var explosionTile:Bitmap = new tile3;
		
		public function Tiles():void 
		{
			Tile();
		}
		
		private function Tile():void    
		{
			this.graphics.beginBitmapFill(waterTile.bitmapData, new Matrix(TILE_SIDE/waterTile.width,0,0,TILE_SIDE/waterTile.height,0,0), false);
			this.graphics.drawRect(0, 0, TILE_SIDE, TILE_SIDE);
			this.graphics.endFill();
		}
		
		public function splashTiles():void 
		{
			this.graphics.clear();
			this.graphics.beginBitmapFill(splashTile.bitmapData, new Matrix(TILE_SIDE / splashTile.width, 0, 0, TILE_SIDE / splashTile.height, 0, 0), false);
			this.graphics.drawRect(0, 0, TILE_SIDE, TILE_SIDE);
			this.graphics.endFill();
		}
		
		public function ship():void 
		{
			this.graphics.clear();
			this.graphics.beginBitmapFill(explosionTile.bitmapData, new Matrix(TILE_SIDE / explosionTile.width, 0, 0, TILE_SIDE / explosionTile.height, 0, 0), false);
			this.graphics.drawRect(0, 0, TILE_SIDE, TILE_SIDE);
			this.graphics.endFill();
		}
		
		public function get hasShip():Boolean 
		{
			return _hasShip;
		}
		
		public function set hasShip(value:Boolean):void 
		{
			_hasShip = value;
			Tile();
		}
		
	}

	
	
	
	
	
	
}