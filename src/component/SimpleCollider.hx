package component;

import luxe.Component;
import luxe.Sprite;
import luxe.Vector;
import luxe.Color;
import luxe.collision.shapes.*;
import luxe.collision.ShapeDrawerLuxe;
import luxe.options.ComponentOptions;


class SimpleCollider extends Component {

    var sprite : Sprite;
    var sprite_collider : Polygon;
    var shape_drawer : ShapeDrawerLuxe;
    var draw_collider : Bool = false;

    override public function new(options:ComponentOptions){
        super(options);
    } //new

    override function init () {

       
        sprite_collider = Polygon.create(entity.pos.x, entity.pos.y, 20, 20);
        sprite_collider.name = name;
        shape_drawer = new ShapeDrawerLuxe();

    } //init

    override function update(dt:Float) {

        sprite_collider.position = entity.pos;
        if(draw_collider) {
            shape_drawer.drawPolygon(sprite_collider);
        }

        /*if(InputManager.debugtoggle.down()) {
            draw_collider = !draw_collider;
        }*/

    } //update


} //Collider