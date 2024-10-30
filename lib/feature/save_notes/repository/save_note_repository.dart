import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:litlab_learning/core/contants/firebase_constant.dart';

class SaveNotesRepository {
  final FirebaseFirestore _firebaseFirestore;

  SaveNotesRepository({required FirebaseFirestore firebaseFirestore}) :
        _firebaseFirestore=firebaseFirestore;
  CollectionReference<Map<String,dynamic>> get _courses =>
      _firebaseFirestore.collection(FirebaseConstants.courseCollection);
  Future<List<Map<String, dynamic>>> getDocumentsByIds(
      List<dynamic> documentIds,
      String courseId
      ) async {
    List<Map<String, dynamic>> documentsList = [];

    for (String docId in documentIds) {
      try {
        // Access the document by its ID
        DocumentSnapshot documentSnapshot = await _courses
            .doc(courseId)
            .collection("material") // Specify the collection name
            .doc(docId)
            .get();

        // Check if the document exists
        if (documentSnapshot.exists) {
          // Get the data from the document and add to the list
          Map<String, dynamic>? data = documentSnapshot.data() as Map<String, dynamic>?;
          if (data != null) {
            documentsList.add(data);
          }
        } else {
          print('Document with ID $docId does not exist.');
        }
      } catch (e) {
        print('Error fetching document with ID $docId: $e');
      }
    }

    return documentsList; // Return the list of document data
  }


}