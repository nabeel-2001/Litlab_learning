import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:litlab_learning/core/contants/firebase_constant.dart';
import 'package:litlab_learning/core/contants/provider/firebase_constant_provider.dart';
import 'package:litlab_learning/model/course_model.dart';
import 'package:litlab_learning/model/materialModel.dart';
final courseRepositoryProvider=Provider((ref) => CourseRepository( firebaseFirestore: ref.read(firestoreProvider),),);
class CourseRepository{
  final FirebaseFirestore _firebaseFirestore;
  CourseRepository({required FirebaseFirestore firebaseFirestore}):
        _firebaseFirestore=firebaseFirestore;
  CollectionReference<Map<String,dynamic>> get _courses =>
      _firebaseFirestore.collection(FirebaseConstants.courseCollection);

  Future<List<CourseModel>> getCourse(String departmentId){
    return _courses.where("department",isEqualTo: departmentId.toString()).get().then((value) => value.docs.map((e) => CourseModel.fromMap(e.data()),).toList(),);

  }

}