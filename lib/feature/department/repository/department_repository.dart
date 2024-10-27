import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:litlab_learning/core/contants/firebase_constant.dart';
import 'package:litlab_learning/core/contants/provider/firebase_constant_provider.dart';
import 'package:litlab_learning/model/department_model.dart';
import 'package:litlab_learning/model/users_model.dart';
final departmentRepositoryProvider=Provider((ref) => DepartmentRepository(firebaseFirestore: ref.read(firestoreProvider)),);
class DepartmentRepository{
  final FirebaseFirestore _firebaseFirestore;
DepartmentRepository({required FirebaseFirestore firebaseFirestore}):
      _firebaseFirestore=firebaseFirestore;
  CollectionReference<Map<String,dynamic>> get _department =>
      _firebaseFirestore.collection(FirebaseConstants.departmentCollection);



  Stream<List<DepartmentModel>> getDepartment(){
    return _department.snapshots().map((event) => event.docs.map((e) => DepartmentModel.fromMap(e.data()),).toList(),);
  }

}