import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:litlab_learning/core/contants/firebase_constant.dart';
import 'package:litlab_learning/core/contants/provider/firebase_constant_provider.dart';
import 'package:litlab_learning/model/common_paper.dart';
import 'package:litlab_learning/model/materialModel.dart';
import 'package:litlab_learning/model/users_model.dart';
final commonScreenRepositoryProvider=Provider((ref) =>CommonScreenRepository(firebaseFirestore: ref.read(firestoreProvider)) ,);
class CommonScreenRepository{
  final FirebaseFirestore _firebaseFirestore;
  CommonScreenRepository({required FirebaseFirestore firebaseFirestore}):
      _firebaseFirestore=firebaseFirestore;

  CollectionReference<Map<String,dynamic>> get _commonPaper =>
      _firebaseFirestore.collection(FirebaseConstants.commonPaperCollection);
  CollectionReference<Map<String, dynamic>> get _users =>
      _firebaseFirestore.collection(FirebaseConstants.user);
  Stream<List<CommonPaper>>getCommonPaper(){

    return _commonPaper.snapshots().map((event) => event.docs.map((e) => CommonPaper.fromMap(e.data()),).toList(),);

  }
  Future<List<MaterialModel>> getMaterial(String selectCourse){
    return _commonPaper.doc(selectCourse).collection("material").get().then((value) =>
        value.docs.map((e) => MaterialModel.fromMap(e.data()),).toList()

      ,);
  }
  updateProfile({required UserModel userModel, required String department,required String course,required String commonCourse}){
    _users.doc(userModel.id).update(userModel.copyWith(department: department,
        course: course,commonCourse: commonCourse

    ).toMap());
  }

}