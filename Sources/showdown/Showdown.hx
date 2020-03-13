package showdown;

#if (kha_html5 && js)
import js.Browser.navigator;
import js.Browser.document;
import js.Browser.window;
import js.Syntax;
#end

//@TODO: Check if we could support krom; I.e. test that we can call the lib when in Krom.
// Have a look how lubos adds javascript class in https://github.com/armory3d/haxerecast/blob/master/Sources/haxerecast/Recast.hx#L19
// For rendering the html in krom we could use this: https://github.com/ultralight-ux/Ultralight-API
// The tutorial on adding ultralight to a custom engine is pretty straight-forward : https://docs.ultralig.ht/docs/integrating-with-games
// To convert their shaders we could use this: http://diligentgraphics.com/diligent-engine/shader-converter/ or do it manually; We will need to view the complexity of their shaders
// https://www.gamasutra.com/blogs/EgorYusov/20170717/301789/Stateoftheart_HLSL_to_GLSL_Converter.php
class Builder {
    public static function addToHtml(onDone:Void->Void){
        trace("Was here");
        var t:js.html.ScriptElement = cast(document.createElement("script"));
		t.type = "text/javascript";
		t.src = './showdown.min.js';
		t.onload = onDone;
        document.body.appendChild(t);
    }
}

/**
 * Showdown fields to add
 * To see what they do have a look here: https://github.com/showdownjs/showdown/blob/master/dist/showdown.js 
 * App.hx:37: extensions
App.hx:37: getOptions
App.hx:37: resetOptions
App.hx:37: getFlavorOptions
App.hx:37: subParser
App.hx:37: extension
App.hx:37: getAllExtensions
App.hx:37: removeExtension
App.hx:37: resetExtensions
App.hx:37: validateExtension
 */
class Showdown {
    /**
     * Setting a "global" option affects all instances of showdown
     * @param key 
     * @param Value 
     */
     @:native('module.exports.setOption')
    extern public static function setOption(key:String,Value:String):Void;
    @:native('module.exports.getOption')
    extern public static function getOption(key:String):Void;
    @:native('module.exports.getDefaultOptions')
    extern public static function getDefaultOptions():Dynamic;
    /**
     * Sets flavors or presets globally to the correct options automatically, so that showdown behaves like popular markdown flavors.
     * Available Flavors:
     *  original - original markdown flavor as in John Gruber's spec
     *  vanilla - showdown base flavor (as from v1.3.1)
     *  github - GFM (GitHub Flavored Markdown)
     * @param flavor 
     */
     @:native('module.exports.setFlavor')
    extern public static function setFlavor(flavor:String):Void;
    @:native('module.exports.getFlavor')
    extern public static function getFlavor():String;
}

@:native('module.exports.Converter')
extern class Converter {
    public function new(?options:Dynamic);
    /**
     * Setting a "local" option only affects the specified Converter object.
     * @param key 
     * @param Value 
     */
     public function setOption(key:String,Value:String):Void;
     public function getOption(key:String):Void;
     /**
     * Sets flavors or presets locally to the correct options automatically, so that showdown behaves like popular markdown flavors.
     * Available Flavors:
     *  original - original markdown flavor as in John Gruber's spec
     *  vanilla - showdown base flavor (as from v1.3.1)
     *  github - GFM (GitHub Flavored Markdown)
     * @param flavor 
     */
    public function setFlavor(flavor:String):Void;
    /**
     * [Description]
     * @param markdown 
     * @return The html representing the markdown passed
     */
    public function makeHtml(markdown:String):String;
}