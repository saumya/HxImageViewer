package com.saumya.core.events;

import flash.events.Event;

class UserEvent extends Event
{
	public static var GENERIC:String = 'userGenericEvent';
	public static var MODAL_LAYER_CLICK:String = 'userModalLayerClickEvent';


	public function new(type : String , ?bubbles : Bool=true , ?cancelable : Bool=true)
	{
		super(type,bubbles,cancelable);
	}

	override public function clone():UserEvent
	{
		var e:UserEvent=new UserEvent(this.type,this.bubbles,this.cancelable);
		return e;
	}
}