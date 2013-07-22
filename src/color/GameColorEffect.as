package
color{
	import starling.events.Event;
	import starling.display.Quad;
	import starling.display.Sprite;

	/**
	 * @author yangshousen
	 */
	public class GameColorEffect extends Sprite
	{
		private var q : Quad;
		
		public function GameColorEffect()
		{
			addEventListener( Event.ADDED_TO_STAGE, addStage );
		}

		private function addStage( event : Event ) : void
		{
			stage.color = 0x002143;
			
			q = new Quad( 200, 200 );
			q.setVertexColor( 0, 0x000000 );
			q.setVertexColor( 0, 0xAA0000 );
			q.setVertexColor( 1, 0x00FF00 );
			q.setVertexColor( 2, 0x0000FF );
			addChild( q );
		}
	}
}
