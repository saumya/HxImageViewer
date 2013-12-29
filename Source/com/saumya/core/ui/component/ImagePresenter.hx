package com.saumya.core.ui.component;
import flash.display.Graphics;
import flash.display.Sprite;
import flash.display.Loader;
import flash.display.Bitmap;

import flash.events.MouseEvent;
import flash.events.Event;

import flash.text.TextField;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;
import flash.text.TextFieldAutoSize;
import flash.net.URLRequest;
import flash.net.URLLoader;

import com.saumya.core.ui.component.ImageHolder;
import com.saumya.core.ui.component.BasicButtonWithLabel;

import openfl.Assets;


/**
 * The default dimage holder
 * 
 * @author saumya
 * @version 1.0.0
 * 
 */
class ImagePresenter extends Sprite
{
	private var displayedImageNum:Int;
	private var widthX:Float;
	private var heightX:Float;
	private var imageHolder:ImageHolder;
	private var btnNext:BasicButtonWithLabel;
	private var btnBack:BasicButtonWithLabel;


	public function new() 
	{
		super();
		this.initialize();
	}
	
	private function initialize() :Void
	{
		this.displayedImageNum = 0;
		this.widthX = 100;
		this.heightX = 100;

		this.construct();
	}

	private function construct():Void
	{
		this.imageHolder =  new ImageHolder();
		this.btnNext = new BasicButtonWithLabel();
		this.btnBack = new BasicButtonWithLabel();
		//
		this.imageHolder.y = 50;
		this.imageHolder.setSize(200,200);

		this.btnBack.setLabel("Back");
		this.btnNext.setLabel("Next");
		this.btnBack.setSize(80,40);
		this.btnNext.setSize(80,40);
		this.btnBack.x=0;
		this.btnNext.x=100;
		this.btnBack.addEventListener(MouseEvent.CLICK,onBack);
		this.btnNext.addEventListener(MouseEvent.CLICK,onNext);

		this.render();
	}

	private function render():Void
	{
		this.addChild(this.btnBack);
		this.addChild(this.btnNext);
		this.addChild(this.imageHolder);
	}

	private function onBack(e:MouseEvent):Void
	{
		this.showPrevious();
	}
	private function onNext(e:MouseEvent):Void
	{
		this.showNext();
	}
	private function getImageAndRender(path:String):Void
	{
		var b:Bitmap = new Bitmap(Assets.getBitmapData (path));
		this.imageHolder.showImage(b);
	}

	public function setSize(newWidth:Float,newHeight:Float):Void
	{
		this.widthX = newWidth;
		this.heightX = newHeight;
		this.imageHolder.setSize(newWidth,newHeight);
		this.render();
	}
	public function move(xPos:Float,yPos:Float):Void
	{
		this.x = xPos;
		this.y = yPos;
	}

	public function showImageWithID(id:Int):Void
	{
		this.displayedImageNum += 1;
		var s:String = "images/screen"+cast(id)+".png";
		this.getImageAndRender(s);

		this.btnBack.visible=true;
	}

	public function showNext():Void
	{
		this.displayedImageNum += 1;
		var s:String = "images/screen"+cast(this.displayedImageNum)+".png";
		this.getImageAndRender(s);

		this.btnBack.visible=true;
	}
	public function showPrevious():Void
	{
		this.displayedImageNum -= 1;
		var s:String = "images/screen"+cast(this.displayedImageNum)+".png";
		this.getImageAndRender(s);
		if(this.displayedImageNum<=1){
			this.btnBack.visible=false;
		}
	}
	
}