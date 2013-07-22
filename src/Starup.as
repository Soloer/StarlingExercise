package
{
	import flatsprite.FlatGame;
	import star.StarGame;
	import img.MyImgTestGame;

	import starling.core.Starling;

	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;


	[SWF(width="512", height="512", frameRate="60", backgroundColor="#FFFFFF")]
	public class Starup extends Sprite
	{
		private var _starling : Starling;

		public function Starup()
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			var fps:FlashStats = new FlashStats();
			addChild(fps);
			
			var clazz : Class;
//			clazz = GameColorEffect;
//			clazz = GameColor;
//			clazz = GameFrameColor;
//			clazz = GameRotationColor;
//			clazz = CustomGame;
//			clazz = MyImgTestGame;
//			clazz = StarGame;
			clazz = FlatGame;
			
			_starling = new Starling( clazz, stage );
			_starling.start();
		}
	}
}