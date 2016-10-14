package hxbis.data;

class BisRootBlock extends BisBlock {
	public function new() {
		type = BisBlockType.OBJECT32;
		data = {};

		_children = [];
	}
}
