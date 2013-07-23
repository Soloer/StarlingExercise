package moiveclip
{
	import flash.display.BitmapData;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import starling.display.Button;
	import starling.textures.Texture;

	/**
	 * @author SoloerYoung
	 */
	public class CustomButton extends Button
	{
		public function CustomButton( text : String = "" )
		{
			var s:Sprite = new Sprite();
			s.graphics.beginFill(0xff0000, 1);
			s.graphics.drawRect(0, 0, 100, 20);
			s.graphics.endFill();
			
			var bmpData : BitmapData = new BitmapData( s.width, s.height, true, 0xffffff );
			bmpData.draw( s );
			var upState : Texture = Texture.fromBitmapData( bmpData );
			
			s.graphics.clear();
			s.graphics.beginFill(0xffff00, 1);
			s.graphics.drawRect(0, 0, 100, 20);
			s.graphics.endFill();
			
			bmpData = new BitmapData( s.width, s.height, true, 0xffffff );
			bmpData.draw( s );
			var downState : Texture = Texture.fromBitmapData( bmpData );
			
			super( upState, text, downState );
		}
	}
}
