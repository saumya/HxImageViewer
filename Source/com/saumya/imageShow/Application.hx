package com.saumya.imageShow;


import flash.display.Sprite;
import flash.display.Graphics;
import flash.events.Event;

import com.saumya.core.ui.component.BasicButtonWithLabel;
import com.saumya.core.ui.component.ScrollView;
import com.saumya.core.ui.component.ImagePresenter;


class Application extends Sprite {
	
	private var widthX:Float;
	private var heightX:Float;
	private var sv:ScrollView;

	public function new (canvasWidth:Float,canvasHeight:Float) {
		
		super ();
		this.initialize(canvasWidth,canvasHeight);
	}

	private function initialize(canvasWidth:Float,canvasHeight:Float):Void {
		this.widthX=canvasWidth;
		this.heightX=canvasHeight;
		this.addEventListener(BasicButtonWithLabel.USER_SELECT,onUserSelect);
		this.construct();
	}
	private function construct():Void{
		this.sv = new ScrollView();
		this.sv.setSize(300,400);
		this.sv.setScrollSpeed(350);
		//this.addChild(this.sv);
		/*
		var b1:BasicButtonWithLabel = new BasicButtonWithLabel();
		b1.setLabel("Hello 1");
		b1.setSize(150,40);
		var b2:BasicButtonWithLabel = new BasicButtonWithLabel();
		b2.setLabel("Hello 2");
		b2.setSize(150,40);
		b2.y = 600;
		this.sv.addContent(b1);
		this.sv.addContent(b2);
		*/
		for (i in 0...100) {
			var b:BasicButtonWithLabel = new BasicButtonWithLabel();
			b.setLabel("my button "+i);
			b.setID(i);
			b.setSize(200,30);
			b.y = (32)*i;
			this.sv.addContent(b);
		}


		this.render();
	}
	private function render():Void{
		var g:Graphics=this.graphics;
		g.clear();
		g.beginFill(0xFF0000,1.0);
		g.drawRect(0,0,this.widthX,this.heightX);
		g.endFill();
		//
		this.addChild(this.sv);
	}

	private function onUserSelect(e:Event):Void{
		//trace('Application : onUserSelect');
		var bb : BasicButtonWithLabel = cast(e.target,BasicButtonWithLabel);
		trace('id='+bb.getID());
	}
	
	
}