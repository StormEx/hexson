package hxbis.data;

import haxe.io.BytesInput;

class BisStringMap {
	public var strings(default, null):Array<String> = [];

	public function new() {
	}

	static public function read(stream:BytesInput):BisStringMap {
		var stringMap:BisStringMap = new BisStringMap();
		var compressed:Int = stream.readByte();
		var size:Int = stream.readInt32();

		if(size > 0) {
			stringMap.strings = stream.readString(size).split('\n');
		}

		return stringMap;
	}
}
