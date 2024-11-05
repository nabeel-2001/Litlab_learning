

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:litlab_learning/core/common/widgets/failure.dart';
import 'package:litlab_learning/core/contants/firebase_constant.dart';
import 'package:litlab_learning/core/contants/provider/firebase_constant_provider.dart';
import 'package:litlab_learning/core/type_def.dart';
import 'package:litlab_learning/model/users_model.dart';
final authRepositoryProvider=Provider((ref) => AuthRepository(firestore: ref.read(firestoreProvider), googleSignIn: ref.read(googleSignInProvider), auth: ref.read(firebaseAuthProvider)),);
class AuthRepository {
  final FirebaseFirestore _firestore;
  final GoogleSignIn _googleSignIn;
  final FirebaseAuth _auth;

  AuthRepository({required FirebaseFirestore firestore,
    required GoogleSignIn googleSignIn,
    required FirebaseAuth auth})
      : _firestore = firestore,
        _googleSignIn = googleSignIn,
        _auth = auth;

  CollectionReference<Map<String, dynamic>> get _users =>
      _firestore.collection(FirebaseConstants.user);

  FutureEither<UserModel> signInWithGoogle() async {
    UserModel? studentModel;

    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn(

      );
      final googleAuth = await googleUser?.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      UserCredential userCredential =
      await _auth.signInWithCredential(credential);
      User user = userCredential.user!;
      print("hhhhhhhhhhhhhhhhhh${user.email}");
      if (userCredential.additionalUserInfo!.isNewUser) {
        studentModel = UserModel(
          email: user.email!,
          name: user.displayName!,
          image: user.photoURL!,
          id: '',
          collegeName: '',
          department: '',
          commonCourse: '',
          phone: '',
          search: [],
          favourite: [],
          delete: false,
          password: '', course: '',
        );


        print("studentModel.email");
      } else {
        final checkStudent = await FirebaseFirestore.instance
            .collection(FirebaseConstants.user)
            .where("email", isEqualTo: user.email)
            .get();
        print(checkStudent.docs);
        if (checkStudent.docs.isNotEmpty) {
          studentModel = UserModel.fromMap(checkStudent.docs.first.data());

          print("ggggggiiiiiiiiiiiiiiiiiiiiilll");
          print("${studentModel!.phone}  kkkkkkkkkkkkkk");
          return right(studentModel!);
        } else {
          studentModel = UserModel(
            email: user.email!,
            name: user.displayName!,
            image: user.photoURL!,
            id: '',
            collegeName: '',
            department: '',
            commonCourse: '',
            phone: '',
            search: [],
            favourite: [],
            delete: false,
            password: '', course: '',

          );
          return right(studentModel);
        }
      }

      return right(studentModel);
    }
    on FirebaseException catch (ex) {
      throw ex.message!;
    }
    catch (e, s) {
      return left(Failure(message: e.toString()));
    }
  }

  FutureEither<UserModel> addUsers({required UserModel userModel}) async {
    try {
      await _users.doc(userModel.email).set(userModel.toMap());
    }
    on FirebaseException catch (ex) {
      throw ex.message!;
    }
    catch (e, s) {
      return left(Failure(message: e.toString()));
    }

return right(userModel);
  }
  FutureEither<UserModel?> loginUsers(
      {required String email, required String password}) async {
    UserModel? userModel;
    try {
      var userStream = _users
          .where('email', isEqualTo: email)
          .where('password', isEqualTo: password)
          .snapshots();
      QuerySnapshot checkStudent = await userStream.first;
      print(checkStudent.docs);
      if (checkStudent.docs.isNotEmpty) {
        userModel = UserModel.fromMap(checkStudent.docs.first.data() as Map<String,dynamic> );

        print("ggggggiiiiiiiiiiiiiiiiiiiii");
        print("${userModel.phone}  kkkkkkkkkkkkkk");
      }
      return right(userModel);
    }
    on FirebaseException catch (ex) {
      throw ex.message!;
    }
    catch (e, s) {
      return left(Failure(message: e.toString()));
    }
  }
 Stream<UserModel> getUserDetail({required String userId}){
return _users.doc(userId).snapshots()
    .map((event) => UserModel.fromMap(event.data() as Map<String,dynamic>),);
  }
 Future<UserModel> getCurrentUser(String userId){
   return  _users.doc(userId).get().then((value) => UserModel.fromMap(value.data() as Map<String,dynamic>),);

  }
}

