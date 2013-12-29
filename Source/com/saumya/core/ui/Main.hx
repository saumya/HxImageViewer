package com.saumya.core.ui;


import com.saumya.imageShow.Application;
import flash.display.Graphics;
import flash.display.Sprite;
import flash.events.Event;

/**
 * The entry point to the application.
 * 
 * @author saumya
 * @version 1.0.0
 */
class Main extends Sprite
{
	private var application:Application;
	
	public function new() 
	{
		super();
		this.initialize();
	}
	
	private function initialize() 
	{
		//trace('initialize');
		this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
	}
	
	private function onAddedToStage(e:Event):Void 
	{
		removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		//initialise the application
		this.application = new Application(stage.stageWidth, stage.stageHeight);
		this.construct();
	}
	
	private function construct() :Void
	{
		//trace('construct');
		this.addChild(this.application);
		//
		//this.application.resize(stage.stageWidth, stage.stageHeight);
		//this.resize (stage.stageWidth, stage.stageHeight);
		this.stage.addEventListener (Event.RESIZE, stage_onResize);
	}
	
	private function stage_onResize(e:Event):Void 
	{
		this.resize (stage.stageWidth, stage.stageHeight);
	}
	
	private function resize(stageWidth:Int, stageHeight:Int) 
	{	
		//this.application.resize (stageWidth, stageHeight);
		/*
		Footer.scaleX = Game.currentScale;
		Footer.scaleY = Game.currentScale;
		Footer.x = newWidth / 2 - Footer.width / 2;
		Footer.y = newHeight - Footer.height;
		*/
		//this.application.scaleWithNewSize(stageWidth,stageHeight);
	}
	
}