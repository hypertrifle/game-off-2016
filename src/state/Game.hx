package state;

import luxe.States;
import luxe.Input;
import luxe.Text;
import luxe.Sprite;
import luxe.Color;
import luxe.Vector;
import phoenix.Texture;

import entity.*;
import component.*;

class Game extends State {

    var entity : Sprite;
    var texture : Texture;
    var buttons : Array<Button>;

    public function new(_name:String) {

        super({ name:_name });



    } //new

    override function init() {
        //called when added to the state machine


    } //init

    override function onenter<T>(_value:T) {
        //entering this state
        
        var map = new Map({name: "map"});

        var avatar = new Avatar();

        Luxe.camera.bounds = new luxe.Rectangle(0,0,Main.w ,Main.h);






        // buttons = [];
        
        // var button = new Button({
        //        name : 'button1',
        //        depth : 1,
        //        pos : new Vector(0,0),
        //        size: new Vector(50,50),
        //        eventName: "stock-speed"
        //     });

        // //add a component to an entity
        // //entity.add(new component.Component({name:'name'}));

        // buttons.push(button);

    } //onenter

    override function onleave<T>(_value:T) {
        //leaving this state
        entity.destroy();
    } //onleave

    override function onkeyup(e:KeyEvent) {
        //machine.set('play_state');
    }

    override function update(dt:Float) {
        //called on each update frame
        
        //if(Luxe.input.keypressed('up')){ };
        //if(Luxe.input.keyreleased('up')){ };
        //if(Luxe.input.keydown('up')){ };

    }


} //MenuState
