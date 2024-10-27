import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:litlab_learning/core/contants/firebase_constant.dart';
import 'package:litlab_learning/core/contants/provider/const_provider.dart';
import 'package:litlab_learning/model/common_paper.dart';
import 'package:litlab_learning/model/course_model.dart';

class HomeRepository{
  final FirebaseFirestore _firebaseFirestore;
  HomeRepository({required FirebaseFirestore firebaseFirestore}):
        _firebaseFirestore=firebaseFirestore;

  CollectionReference<Map<String,dynamic>> get _courses =>
      _firebaseFirestore.collection(FirebaseConstants.courseCollection);
  CollectionReference<Map<String,dynamic>> get _commonPaper =>
      _firebaseFirestore.collection(FirebaseConstants.commonPaperCollection);
 Stream<CourseModel> getCorePaper(WidgetRef ref){
    return _courses.doc(ref.read(selectCourse)).snapshots().map((event) => CourseModel.fromMap(event.data() as Map<String,dynamic>),);
  }
  Stream<CommonPaper> getCommonPaper(WidgetRef ref){
    return _commonPaper.doc(ref.read(commonPaper)).snapshots().map((event) => CommonPaper.fromMap(event.data() as Map<String,dynamic>),);
  }

}