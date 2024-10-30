import 'package:hive/hive.dart';

part 'users_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String id;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String collegeName;
  @HiveField(4)
  final String department;
  @HiveField(5)
  final String course;
  @HiveField(6)
  final String commonCourse;
  @HiveField(7)
  final String phone;
  @HiveField(8)
  final String image;
  @HiveField(9)
  final List search;
  @HiveField(10)
  final List favourite;
  @HiveField(11)
  final bool delete;
  @HiveField(12)
  final String password;

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

}
