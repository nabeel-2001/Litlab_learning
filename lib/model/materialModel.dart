import 'package:hive/hive.dart';

class MaterialModel extends HiveObject {
  @HiveField(0)
  final String department;

  @HiveField(1)
  final String course;

  @HiveField(2)
  final String id;

  @HiveField(3)
  final String title;

  @HiveField(4)
  final String description;

  @HiveField(5)
  final String semester;

  @HiveField(6)
  final DateTime createTime;

  @HiveField(7)
  final String fileUrl;

   MaterialModel({
    required this.department,
    required this.course,
    required this.id,
    required this.title,
    required this.description,
    required this.semester,
    required this.createTime,
    required this.fileUrl,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is MaterialModel &&
              runtimeType == other.runtimeType &&
              department == other.department &&
              course == other.course &&
              id == other.id &&
              title == other.title &&
              description == other.description &&
              semester == other.semester &&
              createTime == other.createTime &&
              fileUrl == other.fileUrl);

  @override
  int get hashCode =>
      department.hashCode ^
      course.hashCode ^
      id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      semester.hashCode ^
      createTime.hashCode ^
      fileUrl.hashCode;

  @override
  String toString() {
    return 'MaterialModel{' +
        ' department: $department,' +
        ' course: $course,' +
        ' id: $id,' +
        ' title: $title,' +
        ' description: $description,' +
        ' semester: $semester,' +
        ' createTime: $createTime,' +
        ' fileUrl: $fileUrl,' +
        '}';
  }

  MaterialModel copyWith({
    String? department,
    String? course,
    String? id,
    String? title,
    String? description,
    String? semester,
    DateTime? createTime,
    String? fileUrl,
  }) {
    return MaterialModel(
      department: department ?? this.department,
      course: course ?? this.course,
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      semester: semester ?? this.semester,
      createTime: createTime ?? this.createTime,
      fileUrl: fileUrl ?? this.fileUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'department': this.department,
      'course': this.course,
      'id': this.id,
      'title': this.title,
      'description': this.description,
      'semester': this.semester,
      'createTime': this.createTime,
      'fileUrl': this.fileUrl,
    };
  }

  factory MaterialModel.fromMap(Map<String, dynamic> map) {
    return MaterialModel(
      department: map['department'] as String,
      course: map['course'] as String,
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      semester: map['semester'] as String,
      createTime: map['createTime'].toDate()  as DateTime,
      fileUrl: map['fileUrl'] as String,
    );
  }

//</editor-fold>
}