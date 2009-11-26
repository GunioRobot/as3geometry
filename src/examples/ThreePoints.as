package examples 
{
	import as3geometry.geom2D.Circle;
	import as3geometry.geom2D.Line;
	import as3geometry.geom2D.LineType;
	import as3geometry.geom2D.Triangle;
	import as3geometry.geom2D.mutable.MutableCircle;
	import as3geometry.geom2D.mutable.MutableCircleWithRadialVertex;
	import as3geometry.geom2D.mutable.MutableLine;
	import as3geometry.geom2D.mutable.MutableTriangle;
	import as3geometry.geom2D.ui.CircleDrawer;
	import as3geometry.geom2D.ui.LineDrawer;
	import as3geometry.geom2D.ui.TriangleDrawer;
	import as3geometry.geom2D.ui.UIVertex;

	import ui.interactive.DragMechanism;
	import ui.paint.SolidPaint;

	import flash.display.Sprite;

	/**
	 * 
	 * 
	 * (c) 2009 alecmce.com
	 *
	 * @author Alec McEachran
	 */
	public class ThreePoints extends Sprite 
	{
		private var vertexPaint:SolidPaint;
		
		private var dragMechanism:DragMechanism;
		
		private var a:UIVertex;
		
		private var circle:Circle;
		private var circleDrawer:CircleDrawer;
		
		private var circle2:Circle;
		
		private var line:Line;
		private var lineDrawer:LineDrawer;
		
		private var segment:Line;
		private var segmentDrawer:LineDrawer;
		
		private var ray:Line;
		private var rayDrawer:LineDrawer;
		
		private var triangle:Triangle;
		private var triangleDrawer:TriangleDrawer;
		
		public function ThreePoints()
		{
			init();	
		}
		
		private function init():void
		{
			vertexPaint = new SolidPaint(0xFFFF0000, 0xFF000000, 2);
			
			dragMechanism = new DragMechanism();
			
			a = new UIVertex(vertexPaint);
			dragMechanism.apply(a);
			a.y = 200;
			
			b = new UIVertex(vertexPaint);
			dragMechanism.apply(b);
			b.y = 180;
			
			c = new UIVertex(vertexPaint);
			c.x = 300;
			c.y = 340;
			
			circle = new MutableCircle(a, 50);
			circleDrawer = new CircleDrawer(circle, circlePaint);
			
			circle2 = new MutableCircleWithRadialVertex(b, c);
			circleDrawer2 = new CircleDrawer(circle2, circlePaint);
			
			line = new MutableLine(a, b);
			lineDrawer = new LineDrawer(line);
			
			segment = new MutableLine(b, c, LineType.SEGMENT);
			segmentDrawer = new LineDrawer(segment);
			
			ray = new MutableLine(c, a, LineType.RAY);
			rayDrawer = new LineDrawer(ray);
			
			triangle = new MutableTriangle(a, b, c);
			triangleDrawer = new TriangleDrawer(triangle, trianglePaint);
			
			addChild(triangleDrawer);
			addChild(a);
		}
		
	}
}