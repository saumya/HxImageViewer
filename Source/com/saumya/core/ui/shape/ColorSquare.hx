package com.saumya.core.ui.shape;
import com.saumya.core.FiveBasicColor;
import flash.display.Bitmap;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;

import openfl.Assets;

/**
 * ...
 * @author saumya
 */
class ColorSquare extends RectangleBase
{
	private var colorNum:Int;
	private var colorValue:FiveBasicColor;
	private var numText:TextField;

	public override function new() 
	{
		//trace('ColorSquare');
		super();
		//this.initialize();

		this.colorNum=0;
		this.setSize(60,60);
		this.numText=new TextField();
		this.numText.width=60;
		this.numText.height=40;

		var font = Assets.getFont ("fonts/ArchitectsDaughter.ttf");
		var formatCenterAlign = new TextFormat();
		formatCenterAlign.font = font.fontName;
		formatCenterAlign.align = TextFormatAlign.CENTER;
		formatCenterAlign.size = 30;
		formatCenterAlign.color = 0xFFFFFF;

		this.numText.defaultTextFormat = formatCenterAlign;
		this.numText.text=''+0;

		this.numText.x=this.numText.y=-30;
		this.numText.selectable=false;

		//this.addChild(this.numText);
	}

	/*
	override private function initialize():Void
	{
		this.colorNum=0;
		this.setSize(60,60);
		this.numText=new TextField();
		this.numText.width=80;
		this.numText.height=40;

		var font = Assets.getFont ("fonts/ArchitectsDaughter.ttf");
		var formatCenterAlign = new TextFormat();
		formatCenterAlign.font = font.fontName;
		formatCenterAlign.align = TextFormatAlign.CENTER;
		formatCenterAlign.size = 30;
		formatCenterAlign.color = 0xFFFFFF;

		this.numText.defaultTextFormat = formatCenterAlign;
		this.numText.text=''+0;
	}

	override private function construct():Void
	{
		this.addChild(this.numText);
	}
	*/

	public function changeColor(color:FiveBasicColor):Void
	{
		//trace('changeColor----------');
		//change color
		switch(color) {
			case FiveBasicColor.RED:
				this.colorNum=1;
				//this.setColor(0xFF0000);
			case FiveBasicColor.GREEN:
				this.colorNum=2;
				//this.setColor(0x00FF00);
			case FiveBasicColor.BLUE:
				this.colorNum=3;
				//this.setColor(0x0000FF);
			case FiveBasicColor.YELLOW:
				this.colorNum=4;
				//this.setColor(0xFFFF00);
			case FiveBasicColor.PINK:
				this.colorNum=5;
				//this.setColor(0xFF00FF);
			/*
			default:
				trace('DEFAULT : Not handled YET !');
			*/
		}
		this.setColor(color);
		this.colorValue=color;
	}

	public function getColorNum():Int
	{
		return this.colorNum;
	}
	public function getColor():FiveBasicColor
	{
		return this.colorValue;
	}
	
	public function addTextNumber(num:Int):Void
	//public function addTextNumber(numMap:Bitmap):Void
	{
		/*
		numMap.x = 5;
		this.addChild(numMap);
		*/
		this.addChild(this.numText);
		this.numText.text=''+(num+1);
	}
	
}