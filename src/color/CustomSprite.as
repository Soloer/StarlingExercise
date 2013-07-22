package
color{
	import starling.display.DisplayObject;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;

	/**
	 * @author SoloerYoung
	 */
	public class CustomSprite extends Sprite
	{
		private var quad : Quad;
		private var txt : TextField;
		
		private var quadWidth : uint;
		private var quadHeight : uint;
		private var quadColor : uint;
		
		private var r : Number = 0;
		private var g : Number = 0;
		private var b : Number = 0;
		
		private var rDeat : Number = 0;
		private var gDeat : Number = 0;
		private var bDeat : Number = 0;
		
		public function CustomSprite( width : Number, height : Number, color : uint = 16777215 )
		{
			resetColors();
			
			quadWidth = width;
			quadHeight = height;
			quadColor = color;
			
			addEventListener( Event.ADDED_TO_STAGE, addStage );
		}

		private function addStage( event : Event ) : void
		{
			quad = new Quad( quadWidth, quadHeight, quadColor );
			
			txt = new TextField( 100, 20, "Hello Starling", "Arial", 14, 0xFFFFFF );
			
			addChild( quad );
			addChild( txt );
			
			pivotX = width >> 1;
			pivotY = height >> 1;
			touchable = true;
		}

		public function onRender() : void
		{
			r -= ( r - rDeat ) * .05;
			g -= ( g - gDeat ) * .05;
			b -= ( b - bDeat ) * .05;
			
			var color : uint = r << 16 | g << 8 | b;
			quad.color = color;
			
			quad.alpha = 0.5;
			
			if ( Math.abs( r - rDeat ) < 1 && Math.abs( g - gDeat ) < 1 && Math.abs( b - bDeat ) < 1 )
				resetColors();
				
			rotation += .01;
		}
		
		private function resetColors() : void
		{
			rDeat = Math.random() * 255;
			gDeat = Math.random() * 255;
			bDeat = Math.random() * 255;
		}
	}
}