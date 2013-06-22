package lib
{
	import lib.ballClip;
	import lib.timerField;
	
	import flash.utils.Timer;
	import flash.events.*;
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	
	public class testBall extends MovieClip
	{
		private var mBall:ballClip;
		private var myBack:MovieClip;
		private var moveTimer:Timer;
		private var timer:timerField;
		public var countClick:Number = 0;
		
		private var velocity:Number = 1.0;
		
		function testBall():void
		{
			myBack = new MovieClip();
			myBack.graphics.beginFill(0x4281BD , 1);
			myBack.graphics.lineStyle(1, 0x4281BD, 1);
			myBack.graphics.moveTo(0, 0);
			myBack.graphics.lineTo(550, 0);
			myBack.graphics.lineTo(550, 400);
			myBack.graphics.lineTo(0, 400);
			addChild(myBack);
			
			mBall = new ballClip();
			this.addChild(mBall);
			
			timer = new timerField();
			this.addChild(timer);
			
			moveTimer = new Timer(20);
			moveTimer.addEventListener(TimerEvent.TIMER , mBall.step);
			moveTimer.start();
			
			mBall.addEventListener(MouseEvent.MOUSE_DOWN, clickBall);
		}
		
		public function init()
		{
			mBall.stage.frameRate = 25;
			mBall.stage.scaleMode = StageScaleMode.NO_SCALE;
			mBall.stage.align = StageAlign.TOP;
		}
		
		public function clickBall(e:MouseEvent):void
		{
			if(mBall.ySpeed < 0)
			{
				mBall.ySpeed *= velocity;
			}
			else if(mBall.ySpeed > 0)
			{
				mBall.ySpeed *= -1*velocity;
			}
			callCounter();
		}
		
		private function callCounter():void
		{
			countClick++;
			timer.cField.text = "Times clicked: "+countClick.toString();
		}
		
	}
}