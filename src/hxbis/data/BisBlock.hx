package hxbis.data;

import haxe.io.Bytes;
import haxe.Int64;
import haxe.io.BytesInput;

class BisBlock {
	public var type(default, null):BisBlockType = BisBlockType.OBJECT32;
	public var data:Dynamic = null;

	var _parent:BisBlock = null;
	var _children:Array<BisBlock> = null;

	public function new(type:BisBlockType) {
		this.type = type;
	}

	static public function read(stream:BytesInput, header:BisHeader, obj:Dynamic = null):Dynamic {
		var type:BisBlockType = stream.readByte();
		var name:String = null;

		if(!BisBlockType.isValid(type)) {
			throw "not valid BIS data type...";
		}

		if(obj != null) {
			var index:Int = stream.readInt16();
			name = header.stringMap.strings[index];
		}

		var data:Dynamic = switch(type) {
			case BisBlockType.FALSE:
				false;
			case BisBlockType.TRUE:
				true;
			case BisBlockType.ESTRING:
				"";
			case BisBlockType.UINT8:
				stream.readByte();
			case BisBlockType.UINT16:
				stream.readUInt16();
			case BisBlockType.UINT32:
				stream.readInt32();
			case BisBlockType.UINT64:
				var val:Int = stream.readInt32();
				Int64.make(stream.readInt32(), val);
			case BisBlockType.INT8:
				stream.readInt8();
			case BisBlockType.INT16:
				stream.readInt16();
			case BisBlockType.INT32:
				stream.readInt32();
			case BisBlockType.INT64:
				var val:Int = stream.readInt32();
				Int64.make(stream.readInt32(), val);
			case BisBlockType.FLOAT32:
				stream.readFloat();
			case BisBlockType.FLOAT64:
				stream.readDouble();
			case BisBlockType.STRING8:
				stream.readString(stream.readByte());
			case BisBlockType.STRING16:
				stream.readString(stream.readUInt16());
			case BisBlockType.STRING32:
				stream.readString(stream.readInt32());
			case BisBlockType.STRING64:
				stream.readString(stream.readInt32());
			case BisBlockType.BINARY8:
				var b:Bytes = Bytes.alloc(stream.readByte());
				stream.readBytes(b, 0, b.length);
				b;
			case BisBlockType.BINARY16:
				var b:Bytes = Bytes.alloc(stream.readUInt16());
				stream.readBytes(b, 0, b.length);
				b;
			case BisBlockType.BINARY32:
				var b:Bytes = Bytes.alloc(stream.readInt32());
				stream.readBytes(b, 0, b.length);
				b;
			case BisBlockType.BINARY64:
				var b:Bytes = Bytes.alloc(stream.readInt32());
				stream.readBytes(b, 0, b.length);
				b;
			case BisBlockType.ARRAY8:
				var size:Int = stream.readInt32();
				var count:Int = stream.readByte();
				var arr:Array<Dynamic> = [];
				for(i in 0...count) {
					arr.push(read(stream, header))
				}
			case BisBlockType.ARRAY16:
				var size:Int = stream.readInt32();
				var count:Int = stream.readUInt16();
				var arr:Array<Dynamic> = [];
				for(i in 0...count) {
					arr.push(read(stream, header))
				}
			case BisBlockType.ARRAY32:
				var size:Int = stream.readInt32();
				var count:Int = stream.readInt32();
				var arr:Array<Dynamic> = [];
				for(i in 0...count) {
					arr.push(read(stream, header))
				}
			case BisBlockType.ARRAY64:
				var size:Int = stream.readInt32();
				var count:Int = stream.readInt32();
				var arr:Array<Dynamic> = [];
				for(i in 0...count) {
					arr.push(read(stream, header))
				}
			case BisBlockType.OBJECT8:
				var size:Int = stream.readInt32();
				var count:Int = stream.readByte();
				read(stream, header);
			case BisBlockType.OBJECT16:
				var size:Int = stream.readInt32();
				var count:Int = stream.readUInt16();
				read(stream, header);
			case BisBlockType.OBJECT32:
				var size:Int = stream.readInt32();
				var count:Int = stream.readInt32();
				read(stream, header);
			case BisBlockType.OBJECT64:
				var size:Int = stream.readInt32();
				var count:Int = stream.readInt32();
				read(stream, header);
			default:
				null;
		}

		if(obj != null) {
			Reflect.setField(obj, name, data);
		}

		return data;
	}
}
