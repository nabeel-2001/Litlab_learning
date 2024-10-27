class CourseModel{
  final String department;
  final  String id;
  final String courseTitle;

//<editor-fold desc="Data Methods">
  const CourseModel({
    required this.department,
    required this.id,
    required this.courseTitle,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is CourseModel &&
              runtimeType == other.runtimeType &&
              department == other.department &&
              id == other.id &&
              courseTitle == other.courseTitle);

  @override
  int get hashCode => department.hashCode ^ id.hashCode ^ courseTitle.hashCode;

  @override
  String toString() {
    return 'CourseModel{' +
        ' department: $department,' +
        ' id: $id,' +
        ' courseTitle: $courseTitle,' +
        '}';
  }

  CourseModel copyWith({
    String? department,
    String? id,
    String? courseTitle,
  }) {
    return CourseModel(
      department: department ?? this.department,
      id: id ?? this.id,
      courseTitle: courseTitle ?? this.courseTitle,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'department': this.department,
      'id': this.id,
      'courseTitle': this.courseTitle,
    };
  }

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      department: map['department'] as String,
      id: map['id'] as String,
      courseTitle: map['courseTitle'] as String,
    );
  }

//</editor-fold>
}