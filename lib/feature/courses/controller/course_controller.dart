import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:litlab_learning/feature/courses/repository/course_repository.dart';
import 'package:litlab_learning/model/course_model.dart';
import 'package:litlab_learning/model/materialModel.dart';

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
}



// Providers for CourseController and MaterialController
final courseControllerProvider =
StateNotifierProvider<CourseController, List<CourseModel>>((ref) {
  return CourseController(courseRepository: ref.read(courseRepositoryProvider));
});


