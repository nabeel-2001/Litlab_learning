import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:litlab_learning/feature/department/repository/department_repository.dart';
import 'package:litlab_learning/model/department_model.dart';
import 'package:litlab_learning/model/users_model.dart';
final departmentControllerProvider=Provider((ref) => DepartmentController(departmentRepository: ref.read(departmentRepositoryProvider)),);
final getDepartment=StreamProvider((ref) => ref.read(departmentControllerProvider).getDepartment(),);
class DepartmentController{
  final DepartmentRepository _departmentRepository;
  DepartmentController({required DepartmentRepository departmentRepository}):
      _departmentRepository=departmentRepository;



  Stream<List<DepartmentModel>> getDepartment(){
   return _departmentRepository.getDepartment();
}
   updateDepartment({required String departmentName}) async {
  var box = await Hive.openBox('userBox');
  UserModel? user = box.get('currentUser'); // 'userKey' is the key you use to store the user
print(user?.id??"uuuuu");
// Check if the user exists
  if (user != null) {
    // Update the department field using the copyWith method
    UserModel updatedUser = user.copyWith(department:departmentName );

    // Save the updated user back into the box
    await box.put('currentUser', updatedUser);


  }
}

}