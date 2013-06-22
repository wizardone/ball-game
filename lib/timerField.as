package lib
{
	import flash.display.*;
	import flash.events.*;
	import flash.text.TextField;
	import flash.utils.Timer;
	
	public class timerField extends MovieClip
	{
		public var tField:TextField;
		public var cField:TextField;
		public var countTimer:Timer;
		public var run:Boolean = true;
		
		//timer variables
		var seconds:Number = 0;
		var minutes:Number = 0;
		var hours:Number = 0;
		
		function timerField():void
		{
			startCount();
			
			tField = new TextField();
			tField.x = 1;
			tField.y = 1;
			tField.width = 130;
			tField.height = 20;
			tField.border = true;
			tField.background = true;
			
			this.addChild(tField);
			
			cField = new TextField();
			cField.x = 1;
			cField.y = 22;
			cField.width = 130;
			cField.height = 20;
			cField.border = true;
			cField.background = true;
			
			this.addChild(cField);
		}
		
		public function startCount():void
		{
			countTimer = new Timer(1000);
			countTimer.addEventListener(TimerEvent.TIMER, refreshTime);
			countTimer.start();
		}
		
		public function refreshTime(e:TimerEvent):void
		{
			if(run)
			{
				seconds++;
				if(!(seconds % 60))
				{
					minutes++;
					seconds = 0;
				}
				if(!(minutes % 60) && minutes != 0)
				{
					hours++;
					minutes = 0;
				}
			}
			
			var sec:String = seconds.toString();
			var min:String = minutes.toString();
			var hour:String = hours.toString();
			
			tField.text = "Time played: "+format(hour)+" : "+format(min)+" : "+format(sec);
		}
		
		public function format(str:String):String
		{
			if(str.length <=1)
			{
				return "0"+str;
			}
			else
			{
				return str;
			}
		}
	}
}