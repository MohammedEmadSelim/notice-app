// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NoticeEntityAdapter extends TypeAdapter<NoticeEntity> {
  @override
  final int typeId = 0;

  @override
  NoticeEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NoticeEntity(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, NoticeEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.createDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoticeEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
