package com.saumya.core.ui.component;
import flash.display.DisplayObject;
import flash.display.Graphics;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.events.Event;

import motion.Actuate;
import motion.easing.Quad;

import com.saumya.core.ui.component.Arrow;
import com.saumya.core.ui.component.BasicButton;

/**
 * 
 * @author saumya
 * @version 1.0.0
 */
class ScrollView extends Sprite
{
	private var widthX:Float;
	private var heightX:Float;
	//
	private var contentPane:Sprite;
	private var maskClip:Sprite;
	private var arrowUP:Arrow;
	private var draggableHandle:BasicButton;
	private var arrowDN:Arrow;
	private var maxScrollableHeight:Float;
	//
	private var scrollSpeed:Int;

	public function new() 
	{
		super();
		this.initialize();
	}
	
	private function initialize() :Void
	{
		

		this.widthX = 100;
		this.heightX = 100;
		this.contentPane = new Sprite();
		
		this.maskClip = new Sprite();
		#if flash
			this.addChild(this.maskClip);//why flash needs this on display list!!
		#end

		this.arrowUP = new Arrow();
		this.draggableHandle = new BasicButton();
		this.arrowDN = new Arrow();
		this.scrollSpeed = 50;
		this.maxScrollableHeight = 10;
		//
		this.arrowUP.addEventListener(MouseEvent.CLICK,onUpArrow);
		this.arrowDN.addEventListener(MouseEvent.CLICK,onDnArrow);
		//
		this.construct();
	}
	
	private function onDnArrow(e:MouseEvent):Void 
	{	
		//trace('onContentAdded : this.contentPane.y='+this.contentPane.y);
		var m:Float = (-1)*(this.maxScrollableHeight);
		//trace('onContentAdded : this.maxScrollableHeight='+m);
		if(this.contentPane.y>m){
			//this.contentPane.y -= 100;
			//this.contentPane.y -= this.scrollSpeed;
			//this.draggableHandle.y += 2;
			var newValue:Float = this.contentPane.y-this.scrollSpeed;
			//Actuate.tween (this.contentPane, 0.5, { y:newValue } ).ease (Quad.easeOut);
			this.contentPaneScroll_Y_To(newValue);
			//calculating scroll for the draghandler
			//var p:Float = this.arrowUP.height+(newValue/m)*(this.heightX-(this.arrowDN.height+this.draggableHandle.height));
			var p:Float = this.arrowUP.height+(newValue/m)*(this.heightX-80);
			//this.draggableHandle.y = p;
			this.scrollIndicatorScroll_Y_To(p);
		}else{
			this.contentPane.y = m;
		}
		//trace('this.contentPane.y='+this.contentPane.y+' :: this.contentPane.height='+this.contentPane.height);
	}
	
	private function onUpArrow(e:MouseEvent):Void 
	{
		if(this.contentPane.y<0){
			//this.contentPane.y += this.scrollSpeed;
			//this.draggableHandle.y -= 2;
			var newValue:Float = this.contentPane.y+this.scrollSpeed;
			//Actuate.tween (this.contentPane, 0.5, { y:newValue } ).ease (Quad.easeOut);
			this.contentPaneScroll_Y_To(newValue);
			//
			var m:Float = (-1)*(this.maxScrollableHeight);
			var p:Float = this.arrowUP.height+(newValue/m)*(this.heightX-80);
			//this.draggableHandle.y = p;
			this.scrollIndicatorScroll_Y_To(p);
		}else{
			this.contentPane.y = 0;
			//this.contentPane.y = -30;
		}
	}
	private function contentPaneScroll_Y_To(newValue:Float):Void
	{
		Actuate.tween (this.contentPane, 0.4, { y:newValue } ).ease (Quad.easeOut);
	}
	private function scrollIndicatorScroll_Y_To(newValue:Float):Void
	{
		Actuate.tween (this.draggableHandle, 0.4, { y:newValue } ).ease (Quad.easeOut);
	}
	
	private function construct() :Void
	{
		this.contentPane.y= 0;
		this.drawMask();
		//
		this.render();
	}
	
	private function render() :Void
	{
		this.width = this.widthX;
		this.height = this.heightX;
		//this.addChild(this.maskClip);
		this.addChild(this.contentPane);
		this.addChild(this.arrowUP);
		this.addChild(this.draggableHandle);
		this.addChild(this.arrowDN);
		//
		this.arrowUP.scaleX = this.arrowUP.scaleY = 0.5;
		this.arrowDN.scaleX = this.arrowDN.scaleY = 0.5;
	}
	
	private function drawMask():Void
	{
		var g:Graphics = this.maskClip.graphics;
		g.clear();
		g.beginFill(0xFF00FF);
		g.drawRect(0, 0, this.widthX, this.heightX);
		g.endFill();
	}
	private function onContentAdded(e:Event):Void
	{
		//trace('onContentAdded : ');
		this.maxScrollableHeight = (this.contentPane.height - this.heightX);
		//trace('onContentAdded : this.maxScrollableHeight='+this.maxScrollableHeight);
	}
	
	public function setScrollSpeed(speed:Int):Void
	{
		this.scrollSpeed = speed;
	}
	public function setSize(newWidth:Float,newHeight:Float):Void
	{
		this.widthX = newWidth;
		this.heightX = newHeight;
		this.drawMask();
		this.arrowUP.x = this.widthX;
		this.arrowUP.y = (this.arrowUP.height);
		//this.arrowUP.y = 0;
		this.arrowUP.rotation = 180;
		this.arrowDN.x = (this.widthX - this.arrowDN.width);
		this.arrowDN.y = (this.heightX - this.arrowDN.height);
		this.draggableHandle.x = this.arrowDN.x;
		this.draggableHandle.y = this.arrowUP.y;
	}
	public function addContent(displayObj:Sprite):Void
	{
		displayObj.addEventListener(Event.ADDED_TO_STAGE,onContentAdded);
		//this.addChild(displayObj);
		this.contentPane.addChild(displayObj);
		//this.addChild(this.arrowUP);
		//this.addChild(this.arrowDN);
		

		//this.addChild(this.maskClip);//does not need to be added to the display list
		this.mask = this.maskClip;
	}
	
}