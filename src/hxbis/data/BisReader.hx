package hxbis.data;

import haxe.io.BytesInput;
import haxe.io.Bytes;

class BisReader {
	static public function read(data:Bytes):Dynamic {
		var input:BytesInput = new BytesInput(data);
		var header:BisHeader = BisHeader.read(input);

		return BisBlock.read(input, header);
	}
}
