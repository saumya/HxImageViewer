package com.saumya.core.ui.component;
import flash.display.Graphics;
import flash.display.Sprite;

/**
 * The default drawing is a 100x50 rectangle
 * 
 * @author saumya
 * @version 1.0.0
 * 
 */
class Arrow extends Sprite
{

	public function new() 
	{
		super();
		this.initialize();
	}
	
	private function initialize() :Void
	{
		var g:Graphics = this.graphics;
		g.clear();
		g.lineStyle(2);
		g.beginFill(0xFFFF00);
		
		g.moveTo(0, 0);
		g.lineTo(100, 0);
		g.lineTo(50, 50);
		
		g.endFill();
	}
	
	
}