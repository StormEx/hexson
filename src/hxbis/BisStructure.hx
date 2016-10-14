package hxbis;

import hxbis.data.BisRootBlock;
import hxbis.data.BisBlock;
import hxbis.data.BisAlign;
import haxe.io.Bytes;

class BisStructure {
	public var isCompressed:Bool = false;
	public var align:BisAlign = BisAlign.NONE;
	public var root(default, null):BisBlock = new BisRootBlock();

	var _raw:Bytes = null;

	public function new(object:Dynamic, align:BisAlign = BisAlign.NONE, isCompressed:Bool = false) {
		this.align = align;
		this.isCompressed = isCompressed;
	}

	public function getData():Bytes {
		return _raw;
	}
}
