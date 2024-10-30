// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      name: fields[0] as String,
      id: fields[1] as String,
      email: fields[2] as String,
      collegeName: fields[3] as String,
      department: fields[4] as String,
      course: fields[5] as String,
      commonCourse: fields[6] as String,
      phone: fields[7] as String,
      image: fields[8] as String,
      search: (fields[9] as List).cast<dynamic>(),
      favourite: (fields[10] as List).cast<dynamic>(),
      delete: fields[11] as bool,
      password: fields[12] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.collegeName)
      ..writeByte(4)
      ..write(obj.department)
      ..writeByte(5)
      ..write(obj.course)
      ..writeByte(6)
      ..write(obj.commonCourse)
      ..writeByte(7)
      ..write(obj.phone)
      ..writeByte(8)
      ..write(obj.image)
      ..writeByte(9)
      ..write(obj.search)
      ..writeByte(10)
      ..write(obj.favourite)
      ..writeByte(11)
      ..write(obj.delete)
      ..writeByte(12)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
