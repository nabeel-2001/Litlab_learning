class DepartmentModel{
  final String id;
  final String department;

//<editor-fold desc="Data Methods">


  const DepartmentModel({
    required this.id,
    required this.department,
  });


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is DepartmentModel &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              department == other.department
          );


  @override
  int get hashCode =>
      id.hashCode ^
      department.hashCode;


  @override
  String toString() {
    return 'DepartmentModel{' +
        ' id: $id,' +
        ' department: $department,' +
        '}';
  }


  DepartmentModel copyWith({
    String? id,
    String? department,
  }) {
    return DepartmentModel(
      id: id ?? this.id,
      department: department ?? this.department,
    );
  }


  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'department': this.department,
    };
  }

  factory DepartmentModel.fromMap(Map<String, dynamic> map) {
    return DepartmentModel(
      id: map['id'] as String,
      department: map['department'] as String,
    );
  }


//</editor-fold>
}