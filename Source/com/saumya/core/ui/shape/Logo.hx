package com.saumya.core.ui.shape;
import flash.display.Bitmap;
import flash.display.Sprite;
import openfl.Assets;

/**
 * ...
 * @author saumya
 */
class Logo extends Sprite
{
	private var logoImg:Bitmap;
	
	public function new() 
	{
		super();
		this.initialize();
	}
	
	private function initialize() :Void
	{
		this.logoImg = new Bitmap (Assets.getBitmapData ("images/logo.png"));
		this.construct();
	}
	
	private function construct() :Void
	{
		this.addChild(this.logoImg);
	}
	
	public function move(xPos:Float,yPos:Float):Void
	{
		this.x = xPos;
		this.y = yPos;
	}
	public function centerIt(newWidth:Float,newHeight:Float):Void
	{
		this.x = (newWidth - this.width ) / 2;
		this.y = (newHeight - this.height ) / 2;
	}
}