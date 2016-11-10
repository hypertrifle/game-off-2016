package entity;

import luxe.Color;
import luxe.Log.*;
import luxe.Sprite;
import luxe.Vector;

import phoenix.Texture;

import luxe.options.SpriteOptions;

import component.*;

typedef AvatarOptions = {

  >SpriteOptions,

  // @:optional var anim : MechAnimation;
  @:optional var aim : MouseAim;
  @:optional var movement : TopdownMovement;
  @:optional var camera : CameraFollow;
}


class Avatar extends Sprite 
{

    @:isVar public var aim (default, default): MouseAim = new MouseAim({ name:'mouse'});
    @:isVar public var movement (default, default): TopdownMovement = new TopdownMovement({ name:'movement' });
    @:isVar public var camera (default, default): CameraFollow = new CameraFollow({ name:'camera' });

    public function new(?options:AvatarOptions) 
    {   
        _debug("---------- Avatar.new ----------");

        // if(options.aim != null) {
        //   aim = new MouseAim(options.aim);
        // }
        // if(options.movement != null) {
        //   movement = new TopdownMovement(options.movement);
        // }
        
        // if(options.camera != null) {
        //   camera = new CameraFollow(options.camera);
        // }


        if (options == null) 
        {
            options = { 
                name : "player-me",
                pos : new Vector(0.5 * Main.w, 0.5 * Main.h),
            };
        } 
        else if (options.name == null)
        {
            options.name = "player-me";
        }

        // options.geometry = Luxe.draw.circle({
        //     r : options.size.x * 0.5,
        //     color : options.color
        // });  

        var texture = Luxe.resources.texture('assets/img/head-guns.png');
        options.texture = texture;

        super(options);
    }

    override public function init(){
        if(aim != null){
            add(aim);
        }
        if(movement != null){
            add(movement);
        }
        if(camera != null){
            add(camera);
        }



        //    add(new SimpleGun( {name:"gun1"}));


        // this.events.listen("player.die", die);

    }
}
