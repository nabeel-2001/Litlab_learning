// StateNotifier for managing List<MaterialModel>
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:litlab_learning/feature/materials/repository/material_repository.dart';
import 'package:litlab_learning/model/materialModel.dart';
import 'package:litlab_learning/model/users_model.dart';
final materialProvider=StreamProvider.family((ref,String courseId) => ref.watch(materialControllerProvider).getMaterial(courseId),);
final materialControllerProvider =Provider((ref) => MaterialController(materialRepository: ref.read(materialRepositoryProvider)),);

class MaterialController {
  final MaterialRepository _materialRepository;
  MaterialController({required MaterialRepository materialRepository})
      : _materialRepository = materialRepository
       ; // Initialize state as an empty list
  // Fetch the materials and update the state
  Stream<List<MaterialModel>> getMaterial(String courseId)  {

      // Fetch materials from the repository
      return _materialRepository.getMaterial(courseId) ;// Update the state with the fetched materials

  }
  addFavorite(String materialId,UserModel userModel){
    _materialRepository.addFavourite(materialId, userModel);
  }
  remove(String materialId,UserModel userModel){
    _materialRepository.remove(materialId, userModel);
  }
}