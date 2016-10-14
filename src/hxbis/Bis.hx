package hxbis;

import hxbis.data.BisReader;
import haxe.io.Bytes;

class Bis {
	static public function encode(object:Dynamic):Bytes {
	}

	static public function decode(data:Bytes):Dynamic {
		return BisReader.read(data);
	}

	static public function fromJson(json:String):Bytes {
	}
}
