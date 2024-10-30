import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:litlab_learning/feature/save_notes/repository/save_note_repository.dart';

// NotesController class that extends StateNotifier<List<Map<String, dynamic>>>
class NotesController extends StateNotifier<List<Map<String, dynamic>>> {
  final SaveNotesRepository _saveNotesRepository;
  NotesController({required SaveNotesRepository saveNotesRepository})
      : _saveNotesRepository = saveNotesRepository,
        super([]); // Initial state is an empty list

  // Method to fetch notes and update the state
  Future<List<Map<String, dynamic>>> fetchNotesForCourse(String courseId, List<dynamic> documentIds) async {
    try {
      final List<Map<String, dynamic>> notes =
      await _saveNotesRepository.getDocumentsByIds(documentIds, courseId); // Fetch notes from repository
      state = notes; // Update the state with the fetched notes
      return state; // Return the updated state (list of notes)
    } catch (e, s) {
      state = []; // Set state to an empty list in case of error
      throw Exception('Error fetching notes: $e'); // Optionally, rethrow the exception
    }
  }
}

// Provider for the SaveNotesRepository
final saveNotesRepositoryProvider = Provider((ref) {
  return SaveNotesRepository(firebaseFirestore: FirebaseFirestore.instance);
});

// Provider for the NotesController, providing a list of notes
final notesControllerProvider = StateNotifierProvider<NotesController, List<Map<String, dynamic>>>((ref) {
  final saveNotesRepository = ref.watch(saveNotesRepositoryProvider);
  return NotesController(saveNotesRepository: saveNotesRepository);
});
