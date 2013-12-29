package com.saumya.core.ui.shape;

import flash.display.Bitmap;
import flash.display.Graphics;
import flash.display.Sprite;
import flash.events.MouseEvent;

import com.saumya.core.FiveBasicColor;

import openfl.Assets;

import motion.Actuate;
import motion.easing.Quad;

/**
 * ...
 * @author saumya
 */
class RectangleBase extends Sprite
{
	private var widthX:Float;
	private var heightX:Float;
	private var colorX:Int;

	private var red:Bitmap;
	private var green:Bitmap;
	private var blue:Bitmap;
	private var yellow:Bitmap;
	private var pink:Bitmap;

	public function new() 
	{
		//trace('RectangleBase');
		super();
		this.initialize();
	}
	
	private function initialize() 
	{
		//trace('initialize');
		this.widthX = 50;
		this.heightX = 100;
		this.colorX = 0x444444;//initialising to a deafult color
		//
		this.red=new Bitmap (Assets.getBitmapData ("images/1_red.png"));
		this.green=new Bitmap (Assets.getBitmapData ("images/2_green.png"));
		this.blue=new Bitmap (Assets.getBitmapData ("images/3_blue.png"));
		this.yellow=new Bitmap (Assets.getBitmapData ("images/4_yellow.png"));
		this.pink=new Bitmap (Assets.getBitmapData ("images/5_pink.png"));

		this.red.x=this.green.x=this.blue.x=this.yellow.x=this.pink.x= -(this.red.width/2);
		this.red.y=this.green.y=this.blue.y=this.yellow.y=this.pink.y= -(this.red.height/2);
		//
		this.construct();
	}
	
	private function construct() 
	{
		this.addEventListener(MouseEvent.CLICK,onUserRollOver);
		//trace('construct');
		this.render();
	}
	
	private function render() 
	{
		//trace('render');
		this.addChild(this.red);
		this.addChild(this.green);
		this.addChild(this.blue);
		this.addChild(this.yellow);
		this.addChild(this.pink);
		this.red.visible=this.green.visible=this.blue.visible=this.yellow.visible=this.pink.visible=false;

		/*
		var g:Graphics = this.graphics;
		g.clear();
		g.beginFill(this.colorX, 1.0);
		g.drawRect(0, 0, this.widthX, this.heightX);
		g.endFill();
		*/

		/*
		var g:Graphics = this.graphics;
		g.clear();
		g.beginFill(0xFFFFFF, 1.0);
		g.drawRoundRect( 0 , 0 , this.widthX , this.heightX , (this.widthX/3) , (this.heightX/3) );
		g.endFill();
		g.beginFill(this.colorX, 1.0);
		g.drawRoundRect( 2 , 2 , (this.widthX-4) , (this.heightX-4) , (this.widthX/3) , (this.heightX/3) );
		g.endFill();
		*/
	}

	private function onUserRollOver(e:MouseEvent):Void
	{
		//Actuate.tween (this, 0.2, { scaleX:2} ).ease (Quad.easeOut).onComplete(notify);
		Actuate.tween (this, 0.2, { scaleX:1.1, scaleY:1.1} ).ease (Quad.easeOut).onComplete(comeBackToNormal);
		//tween(this, 0.2, { scaleX:2, scaleY:2} );
	}
	private function comeBackToNormal():Void
	{
		Actuate.tween (this, 0.2, { scaleX:1, scaleY:1} ).ease (Quad.easeOut);
	}
	
	public function setSize(newWidth:Float,newHeight:Float):Void
	{
		//trace('setSize');
		this.widthX = newWidth;
		this.heightX = newHeight;
		this.render();
	}
	
	//public function setColor(newColor:Int):Void
	public function setColor(newColor:FiveBasicColor):Void
	{
		//trace('setColor:'+newColor);
		//this.colorX = newColor;
		//this.render();
		this.red.visible=this.green.visible=this.blue.visible=this.yellow.visible=this.pink.visible=false;
		switch(newColor) {
			case FiveBasicColor.RED:
				//this.addChild(this.red);
				this.red.visible=true;
			case FiveBasicColor.GREEN:
				//this.addChild(this.green);
				this.green.visible=true;
			case FiveBasicColor.BLUE:
				//this.addChild(this.blue);
				this.blue.visible=true;
			case FiveBasicColor.YELLOW:
				//this.addChild(this.yellow);
				this.yellow.visible=true;
			case FiveBasicColor.PINK:
				//this.addChild(this.pink);
				this.pink.visible=true;
			}
	}
	
}