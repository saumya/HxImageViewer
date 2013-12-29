package com.saumya.core.ui.component;
import flash.display.Graphics;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;
import flash.text.TextFieldAutoSize;

import openfl.Assets;

/**
 * The default drawing is a 100x50 rectangle
 * 
 * @author saumya
 * @version 1.0.0
 * 
 */
class BasicButtonWithLabel extends Sprite
{
	private var label:TextField;
	private var tfCentreAlign:TextFormat;
	private var btnID:Int;
	//
	private var widthX:Float;
	private var heightX:Float;
	//
	public static var USER_SELECT:String='UserSelectEvent';

	public function new() 
	{
		super();
		this.initialize();
	}
	
	private function initialize() :Void
	{
		this.widthX = 100;
		this.heightX = 20;
		//
		var font = Assets.getFont ("fonts/ArchitectsDaughter.ttf");
		//
		this.tfCentreAlign = new TextFormat();
		this.tfCentreAlign.font = font.fontName;
		this.tfCentreAlign.align = TextFormatAlign.CENTER;
		this.tfCentreAlign.size = 20;
		this.tfCentreAlign.color = 0x000000;
		//
		this.btnID = 0;
		//
		this.construct();
	}

	private function construct():Void
	{
		this.label=new TextField();
		this.label.selectable = false;
		this.label.wordWrap = true;
		//this.label.autoSize = TextFieldAutoSize.CENTER;
		this.label.defaultTextFormat = this.tfCentreAlign;
		this.label.width = this.widthX;
		this.label.height = this.heightX;
		this.label.text = "Label Button";
		this.addChild(this.label);
		this.addEventListener(MouseEvent.CLICK,onUserClick);
		this.render();
	}

	private function render():Void
	{
		var g:Graphics = this.graphics;
		g.clear();
		//g.lineStyle(2);
		g.beginFill(0xFFFF00);
		g.drawRect(0,0,this.widthX,this.heightX);
		g.endFill();
		//
		this.label.width=this.widthX;
		this.label.height=this.heightX;
	}

	private function onUserClick(event:MouseEvent):Void
	{
		var e:Event=new Event(BasicButtonWithLabel.USER_SELECT,true);
		this.dispatchEvent(e);
	}

	public function setSize(newWidth:Float,newHeight:Float):Void
	{
		this.widthX = newWidth;
		this.heightX = newHeight;
		this.render();
	}
	public function setLabel(newLabel:String):Void
	{
		this.label.text = newLabel;
	}
	public function setID(id:Int):Void
	{
		this.btnID = id;
	}
	public function getID():Int
	{
		return this.btnID;
	}
	
	
}