class UserModel{
  final String name;
  final String id;
  final String email;
  final String collegeName;
  final String department;
  final String course;
  final String commonCourse;
  final String phone;
  final String image;
  final List search;
  final List favourite;
  final bool delete;
  final String password;

//<editor-fold desc="Data Methods">
  const UserModel({
    required this.name,
    required this.id,
    required this.email,
    required this.collegeName,
    required this.department,
    required this.course,
    required this.commonCourse,
    required this.phone,
    required this.image,
    required this.search,
    required this.favourite,
    required this.delete,
    required this.password,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          id == other.id &&
          email == other.email &&
          collegeName == other.collegeName &&
          department == other.department &&
          course == other.course &&
          commonCourse == other.commonCourse &&
          phone == other.phone &&
          image == other.image &&
          search == other.search &&
          favourite == other.favourite &&
          delete == other.delete &&
          password == other.password);

  @override
  int get hashCode =>
      name.hashCode ^
      id.hashCode ^
      email.hashCode ^
      collegeName.hashCode ^
      department.hashCode ^
      course.hashCode ^
      commonCourse.hashCode ^
      phone.hashCode ^
      image.hashCode ^
      search.hashCode ^
      favourite.hashCode ^
      delete.hashCode ^
      password.hashCode;

  @override
  String toString() {
    return 'UserModel{' +
        ' name: $name,' +
        ' id: $id,' +
        ' email: $email,' +
        ' collegeName: $collegeName,' +
        ' department: $department,' +
        ' course: $course,' +
        ' commonCourse: $commonCourse,' +
        ' phone: $phone,' +
        ' image: $image,' +
        ' search: $search,' +
        ' favourite: $favourite,' +
        ' delete: $delete,' +
        ' password: $password,' +
        '}';
  }

  UserModel copyWith({
    String? name,
    String? id,
    String? email,
    String? collegeName,
    String? department,
    String? course,
    String? commonCourse,
    String? phone,
    String? image,
    List? search,
    List? favourite,
    bool? delete,
    String? password,
  }) {
    return UserModel(
      name: name ?? this.name,
      id: id ?? this.id,
      email: email ?? this.email,
      collegeName: collegeName ?? this.collegeName,
      department: department ?? this.department,
      course: course ?? this.course,
      commonCourse: commonCourse ?? this.commonCourse,
      phone: phone ?? this.phone,
      image: image ?? this.image,
      search: search ?? this.search,
      favourite: favourite ?? this.favourite,
      delete: delete ?? this.delete,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'id': this.id,
      'email': this.email,
      'collegeName': this.collegeName,
      'department': this.department,
      'course': this.course,
      'commonCourse': this.commonCourse,
      'phone': this.phone,
      'image': this.image,
      'search': this.search,
      'favourite': this.favourite,
      'delete': this.delete,
      'password': this.password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      id: map['id'] as String,
      email: map['email'] as String,
      collegeName: map['collegeName'] as String,
      department: map['department'] as String,
      course: map['course'] as String,
      commonCourse: map['commonCourse'] as String,
      phone: map['phone'] as String,
      image: map['image'] as String,
      search: map['search'] as List,
      favourite: map['favourite'] as List,
      delete: map['delete'] as bool,
      password: map['password'] as String,
    );
  }

//</editor-fold>
}