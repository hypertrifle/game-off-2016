package entity;

import luxe.Color;
import luxe.Log.*;
import luxe.Sprite;
import luxe.Vector;
import luxe.Visual;
import luxe.Input;

import luxe.options.VisualOptions;

typedef ButtonOptions = {
    > VisualOptions,
    @:optional var eventName : String;
}

class Button extends Visual 
{
    @:isVar public var eventName(default,default) : String;

    public function new(?options:ButtonOptions) 
    {   
        _debug("---------- new button ----------");

        if (options == null) 
        {
            options = { 
                name : "defaultButton",
                pos : new Vector(0.5 * Main.w, 0.5 * Main.h),
                color : new Color(1, 1, 1, 1),
                eventName : "unknown"
            };
        } 
        else if (options.name == null)
        {
            options.name = "defaultButton";
        }

        if(options.eventName != null) {
            eventName = options.eventName;
        }

        super(options);

        // this.events.listen("player.die", click);
    }

    override function onmousedown(event:MouseEvent) {
        trace("mouse down");
        // if(geometry.point_inside( event.pos )){
        //     trace("click on me");
        // }
    } //onmousemove
}
