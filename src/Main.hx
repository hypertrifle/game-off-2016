import luxe.Camera;
import luxe.Color;
import luxe.Input;
import luxe.Log.*;
import luxe.Parcel;
import luxe.Scene;
import luxe.Screen.WindowEvent;
import luxe.Sprite;
import luxe.States;
import luxe.Vector;

import luxe.collision.shapes.Polygon;

import phoenix.Batcher;
import phoenix.Texture.FilterType;

import mint.Canvas;
import mint.focus.Focus;
import mint.render.luxe.LuxeMintRender;

import snow.api.Promise;

import utility.AutoCanvas;
import state.Game;



class Main extends luxe.Game 
{
    public static var mint_renderer:LuxeMintRender;
    public static var canvas:Canvas;
    public static var focus: Focus;
    public static var background_batcher: phoenix.Batcher;    
    public static var foreground_batcher: phoenix.Batcher;
    public static var machine : States;
    public static var w:Int = -1;
    public static var h:Int = -1;

    var states:States;

    override function config(config:luxe.GameConfig) 
    {
        log('config loaded as ' + Luxe.snow.config.user);


        config.window.width = w = 1280;
        config.window.height = h = 700;

        trace(config);


        // Just load assets for the splash screen
         config.preload.textures.push({ id : "assets/img/head-guns.png" });
         config.preload.textures.push({ id : "assets/img/roadtiles.png" });
         config.preload.textures.push({ id : "assets/img/roadtiles.png" });
         config.preload.texts.push({ id : "assets/text/map.tmx" });

        return config;
    }

    override function ready() 
    {
        _debug("---------- Main.ready ----------");

        // Set background color
        Luxe.renderer.clear_color = new Color().rgb(Constants.COLOR_GB_2_DARK);

        log('Main w: ${w}');
        log('Main h: ${h}');

        // Fit camera viewport to window size
        Luxe.camera.size = new Vector(w, h);
        Luxe.camera.size_mode = luxe.Camera.SizeMode.fit;

        // Set up rendering
        var background_camera = new Camera({
            name: 'background_camera'
        });
        background_camera.size = new Vector(w, h);
        background_camera.size_mode = luxe.Camera.SizeMode.fit;

        var foreground_camera = new Camera({
            name: 'foreground_camera'
        });
        foreground_camera.size = new Vector(w, h);

        background_batcher = Luxe.renderer.create_batcher({
            layer: -1,
            name:'background_batcher',
            camera: background_camera.view
        });

        foreground_batcher = Luxe.renderer.create_batcher({
            layer: 3,
            name:'foreground_batcher',
            camera: foreground_camera.view
        });

        mint_renderer = new LuxeMintRender({ batcher:foreground_batcher });
        

       var _scale = Luxe.screen.device_pixel_ratio;
       var auto_canvas = new AutoCanvas({
           name:'canvas',
           rendering: mint_renderer,
           options: { color:new Color(1,1,1,0.0) },
           scale: _scale,
           x: 0, y:0, w: Luxe.screen.w/_scale, h: Luxe.screen.h/_scale
       });

       trace('canvas scale: $_scale');

       auto_canvas.auto_listen();
       canvas = auto_canvas;

        
        // Subscribe to state change events
        // Luxe.events.listen('change_state', on_change_state);

        connect_input();
        machine = new States({ name:'statemachine' });
        machine.add(new Game('game_state'));
        
        Luxe.on(init, function(_) {
            machine.set('game_state');
        });        
    }



    override function onkeyup(e:luxe.Input.KeyEvent) 
    {
        if(e.keycode == Key.escape) 
        {
            Luxe.shutdown();
        }
    }

    override function onwindowsized( e:WindowEvent ) 
    {
        Luxe.camera.viewport = new luxe.Rectangle(0, 0, e.x, e.y);
    }

    function connect_input() {

        Luxe.input.bind_key('up', Key.up);
        Luxe.input.bind_key('up', Key.key_w);
        Luxe.input.bind_key('right', Key.right);
        Luxe.input.bind_key('right', Key.key_d);
        Luxe.input.bind_key('down', Key.down);
        Luxe.input.bind_key('down', Key.key_s);
        Luxe.input.bind_key('left', Key.left);
        Luxe.input.bind_key('left', Key.key_a);
        Luxe.input.bind_key('space', Key.space);
        Luxe.input.bind_key('debug', Key.key_q);
        Luxe.input.bind_key('enter', Key.enter);

    } //connect_input


    override function ondestroy() 
    {
        if (machine != null)
        {
            machine.destroy();
            machine = null;            
        }

    }
}
