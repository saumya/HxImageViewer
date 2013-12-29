package com.saumya.core.ui;
import flash.display.Graphics;
import flash.display.Sprite;

/**
 * Its the Application background view.
 * 
 * @author saumya
 * @version 1.0.0
 */
class BackgroundView extends Sprite
{
	private var widthX:Float;
	private var heightX:Float;
	private var colorX:Int;
	
	public function new() 
	{
		super();
		this.initialize();
	}
	
	private function initialize() 
	{
		//trace('initialize');
		this.widthX = 100;
		this.heightX = 100;
		this.colorX = 0x444444;
		this.construct();
	}
	
	private function construct() 
	{
		//trace('construct');
		this.render();
	}
	
	private function render() 
	{
		//trace('render');
		var g:Graphics = this.graphics;
		g.clear();
		g.beginFill(this.colorX, 1.0);
		g.drawRect(0,0,this.widthX,this.heightX);
		g.endFill();
	}
	
	public function setSize(newWidth:Float,newHeight:Float):Void
	{
		//trace('setSize');
		this.widthX = newWidth;
		this.heightX = newHeight;
		this.render();
	}
	public function setColor(newColor:Int):Void
	{
		//trace('setColor');
		this.colorX = newColor;
		this.render();
	}
	
}