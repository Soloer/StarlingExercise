package moiveclip
{
	import starling.events.ResizeEvent;
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.utils.Color;
	import starling.text.BitmapFont;
	import starling.utils.HAlign;
	import flash.text.Font;
	import starling.utils.VAlign;
	import flash.text.TextFormatAlign;
	import flash.geom.Rectangle;
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	import flash.display.Bitmap;

	/**
	 * @author SoloerYoung
	 */
	public class MovieclipGame extends Sprite
	{
		private var mMoive : MovieClip;
		
		[Embed(source="../assets/clip/clip.png")]
		private static const SpriteSheet : Class;
		[Embed(source="../assets/clip/clip.xml", mimeType="application/octet-stream")]
		private static const SpriteSheetXML : Class;
		
		[Embed(source="../assets/fonts/Ubuntu-R.ttf", fontName="Ubuntu", embedAsCFF="false")]
		private var FontClass : Class;
		
		[Embed(source="../assets/fonts/1x/desyrel.png")]
		private var BitmapChars : Class;
		[Embed(source="../assets/fonts/1x/desyrel.fnt", mimeType="application/octet-stream")]
		private var BritannicXML : Class;
		
		public function MovieclipGame()
		{
			addEventListener( Event.ADDED_TO_STAGE, addStage );
		}

		private function addStage( event : Event ) : void
		{
		
			
			var bitmap : Bitmap = new SpriteSheet();
			
			var texture : Texture = Texture.fromBitmap( bitmap );
			
			var xml : XML = XML( new SpriteSheetXML() );
			
			var sTextureAtlas : TextureAtlas = new TextureAtlas( texture, xml );
			
			var frames : Vector.<Texture> = sTextureAtlas.getTextures( "元件" );
			mMoive = new MovieClip( frames, 24	 );
			mMoive.pivotX = mMoive.width >> 1;
			mMoive.pivotY = mMoive.height >> 1;
			mMoive.x = stage.stageWidth >> 1;
			mMoive.y = stage.stageHeight >> 1;
//			mMoive.scaleX = -1;
//			mMoive.scaleY = -1;
			addChild( mMoive );
//			mMoive.setFrameDuration( 5, 2 );
			
			Starling.juggler.add( mMoive );

			
			var fontBitmap : Bitmap = new BitmapChars();
			var fontTexture : Texture = Texture.fromBitmap( fontBitmap );
			var fontXML : XML = XML( new BritannicXML() );
			TextField.registerBitmapFont( new BitmapFont( fontTexture, fontXML ) );
						
			var btn : CustomButton = new CustomButton( "PLAY" );
			addChild( btn );
			btn.fontName = "Desyrel";
//			btn.textBounds = new Rectangle( 0, 0, 100, 20 );
			btn.y = 100; 
			btn.addEventListener( Event.TRIGGERED, btnTrigger );
			
			var font : Font = new FontClass();
			var txt : TextField = new TextField( 100, 200, "Starling textfield text, it's unimagining!", "Desyrel", 20 );
			txt.x = 200;
			txt.autoScale = true;
			txt.bold = true;
			txt.border = true;
			txt.vAlign = VAlign.TOP;
			txt.hAlign = HAlign.LEFT;
			txt.fontSize = BitmapFont.NATIVE_SIZE;
			addChild( txt );
			
			stage.addEventListener( ResizeEvent.RESIZE, onResize );
		}

		private function onResize( event : ResizeEvent ) : void
		{
			var rect : Rectangle = new Rectangle( 0, 0, event.width, event.height );
			Starling.current.viewPort = rect;
			stage.stageWidth = rect.width;
			stage.stageHeight = rect.height;
			
			mMoive.x = stage.stageWidth >> 1;
			mMoive.y = stage.stageHeight >> 1;
			
		}

		private function btnTrigger( event : Event ) : void
		{
			if ( mMoive.isPlaying )
				mMoive.pause();
			else
				mMoive.play();		
		}
	}
}
