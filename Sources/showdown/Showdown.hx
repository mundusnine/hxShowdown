package showdown;

@:native('showdown')
extern class Showdown {
    /**
     * Setting a "global" option affects all instances of showdown
     * @param key 
     * @param Value 
     */
    public static function setOption(key:String,Value:String);
    public static function getOption(key:String);
}

@:native('showdown.Converter')
extern class Converter {
    public function new(?options:Dynamic);
    /**
     * Setting a "local" option only affects the specified Converter object.
     * @param key 
     * @param Value 
     */
     public static function setOption(key:String,Value:String);
}