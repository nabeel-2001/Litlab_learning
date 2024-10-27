import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:litlab_learning/core/contants/firebase_constant.dart';
import 'package:litlab_learning/core/contants/provider/firebase_constant_provider.dart';
import 'package:litlab_learning/feature/courses/controller/course_controller.dart';
import 'package:litlab_learning/feature/courses/repository/course_repository.dart';
import 'package:litlab_learning/feature/materials/controller/material_controller.dart';
import 'package:litlab_learning/model/materialModel.dart';


final materialRepositoryProvider=StateProvider((ref) =>MaterialRepository(firebaseFirestore: ref.read(firestoreProvider)) ,);
class MaterialRepository{
  final FirebaseFirestore _firebaseFirestore;
  MaterialRepository({required FirebaseFirestore firebaseFirestore}):
      _firebaseFirestore=firebaseFirestore;

  CollectionReference<Map<String,dynamic>> get _courses =>
      _firebaseFirestore.collection(FirebaseConstants.courseCollection);

  Future<List<MaterialModel>> getMaterial(String selectCourse){
    return _courses.doc(selectCourse).collection("material").get().then((value) =>
        value.docs.map((e) => MaterialModel.fromMap(e.data()),).toList()

      ,);
  }



}