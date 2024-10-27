import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:litlab_learning/feature/department/repository/department_repository.dart';
import 'package:litlab_learning/model/department_model.dart';
import 'package:litlab_learning/model/users_model.dart';
final departmentControllerProvider=Provider((ref) => ref.read(departmentRepositoryProvider),);
final getDepartment=StreamProvider((ref) => ref.read(departmentControllerProvider).getDepartment(),);
class DepartmentController{
  final DepartmentRepository _departmentRepository;
  DepartmentController({required DepartmentRepository departmentRepository}):
      _departmentRepository=departmentRepository;

  Stream<List<DepartmentModel>> getDepartment(){
   return _departmentRepository.getDepartment();
}

}