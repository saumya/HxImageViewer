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
	private var imgView:ImagePresenter;

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
		this.sv.setSize(300,this.heightX);
		this.sv.setScrollSpeed(350);
		for (i in 1...101) {
			var b:BasicButtonWithLabel = new BasicButtonWithLabel();
			b.setLabel("my button "+i);
			b.setID(i);
			b.setSize(200,30);
			b.y = (32)*i;
			this.sv.addContent(b);
		}
		//
		this.imgView = new ImagePresenter();
		this.imgView.setSize(this.widthX,this.heightX);
		this.imgView.hideNavigation();

		this.render();
	}
	private function render():Void{
		var g:Graphics=this.graphics;
		g.clear();
		g.beginFill(0xFF0000,1.0);
		g.drawRect(0,0,this.widthX,this.heightX);
		g.endFill();
		//
		this.addChild(this.imgView);//added first, so as to get in the background
		this.addChild(this.sv);
	}

	private function onUserSelect(e:Event):Void{
		//trace('Application : onUserSelect');
		var bb : BasicButtonWithLabel = cast(e.target,BasicButtonWithLabel);
		trace('id='+bb.getID());
		this.imgView.showImageWithID(bb.getID());
	}
	
	
}