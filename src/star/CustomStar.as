package star
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;

	import flash.display.BitmapData;
	import flash.display.Graphics;

	/**
	 * @author SoloerYoung
	 */
	public class CustomStar extends Sprite
	{
		public function CustomStar( color : uint, radius : uint, alapa : Number )
		{
			var s : flash.display.Sprite = new flash.display.Sprite();
			var graphics : Graphics = s.graphics;
			graphics.beginFill( color, alapa );
			graphics.drawCircle( radius, radius, radius );
			graphics.endFill();
			
			var bmpData : BitmapData = new BitmapData( radius * 2, radius * 2, true, 0xFFFFFF );
			bmpData.draw( s );
			s = null;
			
			var texture : Texture = Texture.fromBitmapData( bmpData );
			var img : Image = new Image( texture );
			addChild( img );
			
		}
	}
}
