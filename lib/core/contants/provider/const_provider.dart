import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:litlab_learning/model/course_model.dart';
import 'package:litlab_learning/model/materialModel.dart';
import 'package:litlab_learning/model/users_model.dart';

final selectionProvider = StateProvider<bool>((ref) => false);
final departmentId = StateProvider<String?>((ref) => null);
final selectCourse=StateProvider<String?>((ref) =>null ,);
final selectSemester=StateProvider<int?>((ref) => null,);
final commonPaper=StateProvider<String?>((ref) => null,);
final coreSubMaterial=StateProvider<MaterialModel?>((ref) => null,);
final userProvider = StateProvider<UserModel?>((ref) {
  return null;
});
final selectedPageIndexProvider = StateProvider<int>((ref) {
  return 0;  // Default to the first page (Home)
});
final selectMaterial=StateProvider<MaterialModel?>((ref) => null,);