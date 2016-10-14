package hxbis.data;

import haxe.io.BytesOutput;
import haxe.io.BytesInput;

class BisHeader {
	inline static public var FORMAT:String = "BIS";

	public var align:BisAlign = BisAlign.NONE;
	public var stringMap:BisStringMap = null;

	public function new(names:Array<String> = null) {
	}

	static public function read(stream:BytesInput) {
		var header:BisHeader = null;
		var stringMap:BisStringMap = null;

		if(stream == null || stream.length <= FORMAT.length) {
			return header;
		}

		if(FORMAT != stream.readString(FORMAT.length)) {
			return header;
		}

		header.align = stream.readByte();
		header.stringMap = BisStringMap.read(stream);

		return header;
	}

	public function write(stream:BytesOutput) {

	}
}
