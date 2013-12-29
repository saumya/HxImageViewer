package com.saumya.core.ui.component;
import flash.display.Graphics;
import flash.display.Sprite;
import flash.display.Loader;
import flash.display.Bitmap;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;
import flash.text.TextFieldAutoSize;
import flash.net.URLRequest;
import flash.net.URLLoader;

import openfl.Assets;

import motion.Actuate;
import motion.easing.Quad;

/**
 * The default dimage holder
 * 
 * @author saumya
 * @version 1.0.0
 * 
 */
class ImageHolder extends Sprite
{
	private var widthX:Float;
	private var heightX:Float;
	private var imageOne:Sprite;
	private var imageTwo:Sprite;
	private var displayedPaneNum:Int;

	public function new() 
	{
		super();
		this.initialize();
	}
	
	private function initialize() :Void
	{
		this.widthX = 100;
		this.heightX = 100;
		this.displayedPaneNum = 0;
		//
		this.construct();
	}

	private function construct():Void
	{
		this.imageOne = new Sprite();
		this.imageTwo = new Sprite();
		this.addChild(this.imageOne);
		this.addChild(this.imageTwo);
		
		this.render();
	}

	private function render():Void
	{
		var g:Graphics = this.graphics;
		g.clear();
		//g.lineStyle(2);
		g.beginFill(0xFFFF00,0.5);
		g.drawRect(0,0,this.widthX,this.heightX);
		g.endFill();
	}
	private function renderInOne(image:Bitmap):Void
	{
		this.checkAndClearContainer(this.imageOne);
		//this.imageOne.x = -1000;
		this.imageOne.addChild(image);
		this.addChild(this.imageOne);
		Actuate.tween (this.imageOne, 0.4, { x:0 } ).ease (Quad.easeOut);
		this.displayedPaneNum = 1;
	}
	private function renderInTwo(image:Bitmap):Void
	{
		this.checkAndClearContainer(this.imageTwo);
		//this.imageTwo.x = -1000;
		this.imageTwo.addChild(image);
		this.addChild(this.imageTwo);
		Actuate.tween (this.imageTwo, 0.4, { x:0 } ).ease (Quad.easeOut);
		this.displayedPaneNum = 0;//make it 0 not 2
	}
	private function checkAndClearContainer(container:Sprite):Void
	{
		if(container.numChildren>0){
			container.removeChildAt(0);
		}
		container.x = -1000;
	}

	public function setSize(newWidth:Float,newHeight:Float):Void
	{
		this.widthX = newWidth;
		this.heightX = newHeight;
		this.render();
	}

	public function loadImage():Void
	{
		/*
		var ur:URLRequest = new URLRequest('images/screen1.png');
		//var ul:URLLoader = new URLLoader();
		var ul:Loader = new Loader();
		ul.load(ur);
		this.addChild(ul);
		*/
		/*
		var b:Bitmap = new Bitmap (Assets.getBitmapData ("images/screen1.png"));
		b.smoothing = true;
		this.addChild(b);
		*/
		var b:Bitmap = new Bitmap (Assets.getBitmapData ("images/screen1.png"));
		b.smoothing = true;
		this.imageOne.addChild(b);
	}
	public function showImage(image:Bitmap):Void
	{
		image.smoothing=true;
		image.width = this.widthX;
		image.height=this.heightX;
		//check which one to use for display
		if(this.displayedPaneNum==0){
			this.renderInOne(image);
		}else if(this.displayedPaneNum==1){
			this.renderInTwo(image);
		}
	}
	
	
	
}