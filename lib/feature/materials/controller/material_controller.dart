// StateNotifier for managing List<MaterialModel>
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:litlab_learning/feature/materials/repository/material_repository.dart';
import 'package:litlab_learning/model/materialModel.dart';
final materialControllerProvider =
StateNotifierProvider<MaterialController, List<MaterialModel>>((ref) {
  return MaterialController(materialRepository: ref.read(materialRepositoryProvider));
});
class MaterialController extends StateNotifier<List<MaterialModel>> {
  final MaterialRepository _materialRepository;
  MaterialController({required MaterialRepository materialRepository})
      : _materialRepository = materialRepository,
        super([]); // Initialize state as an empty list
  // Fetch the materials and update the state
  Future<void> getMaterial(String courseId) async {
    try {
      // Fetch materials from the repository
      List<MaterialModel> fetchedMaterials = await _materialRepository.getMaterial(courseId);
      state = fetchedMaterials; // Update the state with the fetched materials
    } catch (e) {
      state = []; // Handle errors
    }
  }
}