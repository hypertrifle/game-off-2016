package entity;

import luxe.Entity;
import luxe.Vector;
import phoenix.Texture.FilterType;
import phoenix.Texture;
import phoenix.geometry.*;

import components.*;

import luxe.Vector;
import luxe.Rectangle;
import luxe.options.EntityOptions;
import luxe.Sprite;
import luxe.tilemaps.Tilemap;
import luxe.tilemaps.Isometric;
import luxe.tilemaps.Ortho;

import luxe.importers.tiled.TiledMap;



/*typedef MechMapOptions = {

  >EntityOptions

}*/



class Map extends Entity {

    public var tilemap : TiledMap;

  //public var visual:Sprite;

  //@:isVar public var generation (default, default): MapGeneration = new MapGeneration({name:"map_gen"});



  public function new(options:EntityOptions) {
    super( options );

  }



  override function init(){
   

  }//init


  override function update(dt:Float){
    super.update(dt);

  


  }//update

 

}//Map
