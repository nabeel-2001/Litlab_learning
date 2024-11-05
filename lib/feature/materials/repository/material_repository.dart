import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:litlab_learning/core/contants/firebase_constant.dart';
import 'package:litlab_learning/core/contants/provider/firebase_constant_provider.dart';
import 'package:litlab_learning/feature/courses/controller/course_controller.dart';
import 'package:litlab_learning/feature/courses/repository/course_repository.dart';
import 'package:litlab_learning/feature/materials/controller/material_controller.dart';
import 'package:litlab_learning/model/material_model.dart';
import 'package:litlab_learning/model/users_model.dart';


final materialRepositoryProvider=StateProvider((ref) =>MaterialRepository(firebaseFirestore: ref.read(firestoreProvider)) ,);
class MaterialRepository{
  final FirebaseFirestore _firebaseFirestore;
  MaterialRepository({required FirebaseFirestore firebaseFirestore}):
      _firebaseFirestore=firebaseFirestore;

  CollectionReference<Map<String,dynamic>> get _courses =>
      _firebaseFirestore.collection(FirebaseConstants.courseCollection);
  CollectionReference<Map<String,dynamic>> get _users =>
      _firebaseFirestore.collection(FirebaseConstants.user);

  Stream<List<MaterialModel>> getMaterial(String selectCourse){
    return _courses.doc(selectCourse).collection("material").snapshots().map((event) => event.docs.map((e) => MaterialModel.fromMap(e.data()),).toList(),);


  }
  addFavourite(String materialId,UserModel userModel){
    List<dynamic> favorite=userModel.favourite;
    favorite.add(materialId);
    _users.doc(userModel.id).update(
      userModel.copyWith(
         favourite: favorite,
      ).toMap()
    );
  }
  remove(String materialId,UserModel userModel){
    List<dynamic> favorite=userModel.favourite;
    favorite.remove(materialId);
    _users.doc(userModel.id).update(
        userModel.copyWith(
          favourite: favorite,
        ).toMap()
    );
  }



}