package tween
{
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.BitmapFont;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;

	import flash.text.Font;
	/**
	 * @author SoloerYoung
	 */
	public class TweenGame extends Sprite
	{
		[Embed(source="../assets/fonts/Ubuntu-R.ttf", fontName="Ubuntu", embedAsCFF="false")]
		private var FontClass : Class;
		
		public function TweenGame()
		{
			addEventListener( Event.ADDED_TO_STAGE, addStage );
		}

		private function addStage( event : Event ) : void
		{
			var font : Font = new FontClass();
			var txt : TextField = new TextField( 100, 200, "Starling textfield text, it's unimagining!", font.fontName, 20 );
			txt.x = 200;
			txt.autoScale = true;
			txt.bold = true;
			txt.border = true;
			txt.vAlign = VAlign.TOP;
			txt.hAlign = HAlign.LEFT;
			addChild( txt );
			
			var tw : Tween = new Tween( txt, 4, Transitions.EASE_IN_OUT_BOUNCE );
			tw.moveTo( txt.x, txt.y + 50 );
			tw.fadeTo( 0 );
//			tween.animate( "alpha", 0 );
			Starling.juggler.add( tw );
			tw.onStart = onStart;
			tw.onUpdate = onUpdate;
			tw.onComplete = onComplete;
//			tween.onComplete = txt.removeFromParent;
//			tween.onCompleteArgs = [true];
		}

		private function onComplete() : void
		{
			trace( "tween complete" );
		}

		private function onUpdate() : void
		{
			trace( "tween updating" );
		}
		
		private function onStart() : void
		{
			trace( "tween start" );
		}
	}
}
