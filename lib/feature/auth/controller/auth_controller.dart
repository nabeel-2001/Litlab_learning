import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/src/either.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:litlab_learning/core/common/widgets/common_snack_bar.dart';
import 'package:litlab_learning/core/contants/provider/const_provider.dart';
import 'package:litlab_learning/core/type_def.dart';
import 'package:litlab_learning/feature/auth/repository/auth_repository.dart';
import 'package:litlab_learning/feature/auth/screens/login_page_web.dart';
import 'package:litlab_learning/main.dart';
import 'package:litlab_learning/model/users_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final currentUser=StreamProvider.family((ref,String userId) => ref.watch(authControllerProvider).streamCurrentUser(userId: userId),);
final authControllerProvider=Provider((ref) =>AuthController(authRepository: ref.read(authRepositoryProvider,), ref: ref) ,);
class AuthController extends StateNotifier<bool> {
  final AuthRepository _authRepository;
  final Ref _ref;

  AuthController({required AuthRepository authRepository, required Ref ref })
      : _authRepository = authRepository,
        _ref = ref,
        super(false);

  signInWithGoogle(BuildContext context) async {
    state = true;

    // Get the result from the repository
    final user = await _authRepository.signInWithGoogle();

    state = false;

    // If there's an error, show a snack bar
    user.fold(
          (l) =>
          showSnackBar(
            message: l.message,
            context: context,
            icon: null,
            color: null,
          ),

          (studentModel) async {
        // If the user is new (no id), navigate to RegistrationWeb
        if (studentModel.id.isEmpty) {
          _ref.read(userProvider.notifier).update((state) => studentModel);
          print("nooooooooooooooooooo");
          // Navigate to the registration screen
          Navigator.pushNamed(context, '/RegistrationWeb');
        } else {
          // If user details exist, set shared preferences and userProvider values
          currentUserId = studentModel.id;
          print("hiiiiiiiiiiiiiiiiiiiiiilll$currentUserId");
           _ref.read(userProvider.notifier).update((state) => studentModel);

          // Navigate to the main body screen
          Navigator.pushNamedAndRemoveUntil(context, "onBody_screen", (route) => false,);
        }
      },
    );
  }

  addUser(
      {required BuildContext context,
        required UserModel userModel}) async {

    state = true; // Show loading state

    // Try to add the user and handle the result
    final result = await _authRepository.addUsers(userModel: userModel);

    state = false; // Hide loading state

    // Handle success or failure using fold
    result.fold(
          (failure) {
        // If there's an error, show a snack bar with the error message
        showSnackBar(
          message: failure.message,
          context: context,
          icon: null,
          color: Colors.red,
        );
      },
          (user) async {
        // If the user was successfully added
        if (user != null) {
          // Show success message
          showSnackBar(
            message: "User registered successfully!",
            context: context,
            icon: null,
            color: Colors.green,
          );

          // Optionally, update the user state in the app
          _ref.read(userProvider.notifier).update((state) => userModel);

          // Optionally, store user data in local storage (Hive/SharedPreferences)


          var box = await Hive.openBox('userBox');
         await  box.put('currentUser', userModel);

          // Navigate to the main screen after successful registration
          Navigator.pushNamedAndRemoveUntil(context, 'onBody_screen', (route) => false);
        } else {
          // Show error message if the user was not added
          showSnackBar(
            message: "User registration failed!",
            context: context,
            icon: null,
            color: Colors.red,
          );
        }
      },
    );
  }

  loginUser(
      {required BuildContext context, required String email, required String password}) async {
    state = true;

    // Get the result from the repository
    final user = await _authRepository.loginUsers(email: email, password: password);

    state = false;

    // If there's an error, show a snack bar
    user.fold(
            (l) =>
            showSnackBar(
              message: l.message,
              context: context,
              icon: null,
              color: null,
            ),

            (studentModel) async {
          // If the user is new (no id), navigate to RegistrationWeb
          if (studentModel==null) {
            print("nooooooooooooooooooo");
            // Navigate to the registration screen
            showSnackBar(
              message: "Unavailable to Login Please Register  ",
              context: context,
              icon: null,
              color: null,
            );
          } else {
            // If user details exist, set shared preferences and userProvider values
            currentUserId = studentModel.id;
            _ref.read(userProvider.notifier).update((state) => studentModel);
            // Navigate to the main body screen
            var box = await Hive.openBox('userBox');
            box.put('currentUser', studentModel);
         studentModel.department==''?Navigator.pushNamedAndRemoveUntil(context, '/on_body', (route) => false) :Navigator.pushNamedAndRemoveUntil(context,'sideBar_Page', (route) => false);
          }
        });
  }
  Stream<UserModel> streamCurrentUser({required String userId}){
    return _authRepository.getUserDetail(userId: userId);
  }
  logout({required BuildContext context}) async {

    Navigator.pushNamedAndRemoveUntil(context,"login_page", (route) => false,);
    _ref.read(userProvider.notifier).state=null;
    var box = await Hive.openBox('userBox');
    await box.delete('currentUser');
  }
  getCurrentUser(String userId) async {
   final user=await _authRepository.getCurrentUser(userId);
   _ref.read(userProvider.notifier).state = user;
   var box = await Hive.openBox('userBox');
   await  box.get('currentUser') as UserModel?;

  }
}
