package hxbis.data;

@:enum abstract BisBlockType(Int) from Int to Int {
	var NULL		= 0;
	var FALSE		= 1;
	var TRUE		= 2;
	var ESTRING		= 3;

	var UINT8		= 4;
	var UINT16		= 5;
	var UINT32		= 6;
	var UINT64		= 7;

	var INT8		= 8;
	var INT16		= 9;
	var INT32		= 10;
	var INT64		= 11;

	var FLOAT32		= 12;
	var FLOAT64		= 13;

	var STRING8		= 14;
	var STRING16	= 15;
	var STRING32	= 16;
	var STRING64	= 17;

	var BINARY8		= 18;
	var BINARY16	= 19;
	var BINARY32	= 20;
	var BINARY64	= 21;

	var ARRAY8		= 22;
	var ARRAY16		= 23;
	var ARRAY32		= 24;
	var ARRAY64		= 25;

	var OBJECT8		= 26;
	var OBJECT16	= 27;
	var OBJECT32	= 28;
	var OBJECT64	= 29;

	public inline static function getDefault():BisBlockType {
		return NULL;
	}

	public inline static function isValid(type:BisBlockType):Bool {
		return type >= NULL && type <= OBJECT32;
	}
}
