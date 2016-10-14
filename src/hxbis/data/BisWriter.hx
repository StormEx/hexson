package hxbis.data;

import haxe.io.BytesOutput;
import haxe.io.Bytes;

class BisWriter {
	static public function write(obj:Dynamic, align:BisAlign, isCompressed:Bool = false):Bytes {
		var input:BytesOutput = new BytesOutput();
		var header:BisHeader = new BisHeader(align, isCompressed);
		var root:BisRootBlock = new BisRootBlock();

		return input.getBytes();
	}
}
