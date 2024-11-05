import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:litlab_learning/feature/courses/repository/course_repository.dart';
import 'package:litlab_learning/model/course_model.dart';

import 'package:litlab_learning/model/users_model.dart';

// CourseController using StateNotifier to manage List<CourseModel> and List<MaterialModel>
class CourseController extends StateNotifier<List<CourseModel>> {
  final CourseRepository _courseRepository;

  CourseController({required CourseRepository courseRepository})
      : _courseRepository = courseRepository,
        super([]); // Initialize state as an empty list

  // Fetch the courses and update the state
  Future<void> getCourse(String departmentId) async {
    try {
      // Fetch courses from the repository
      List<CourseModel> fetchedCourses = await _courseRepository.getCourse(departmentId);
      state = fetchedCourses; // Update the state with the fetched courses
    } catch (e) {
      state = []; // Handle errors
    }
  }
  updateDepartment({required String courseId}) async {
    var box = await Hive.openBox('userBox');
    UserModel? user = box.get('currentUser'); // 'userKey' is the key you use to store the user
    print(user?.id??"uuuuu");
// Check if the user exists
    if (user != null) {
      // Update the department field using the copyWith method
      UserModel updatedUser = user.copyWith(course:courseId);

      // Save the updated user back into the box
      await box.put('currentUser', updatedUser);


    }
  }
}



// Providers for CourseController and MaterialController
final courseControllerProvider =
StateNotifierProvider<CourseController, List<CourseModel>>((ref) {
  return CourseController(courseRepository: ref.read(courseRepositoryProvider));
});


