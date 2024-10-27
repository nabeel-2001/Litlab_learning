import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/src/either.dart';
import 'package:go_router/go_router.dart';
import 'package:litlab_learning/core/common/widgets/common_snack_bar.dart';
import 'package:litlab_learning/core/contants/provider/const_provider.dart';
import 'package:litlab_learning/core/type_def.dart';
import 'package:litlab_learning/feature/auth/repository/auth_repository.dart';
import 'package:litlab_learning/feature/auth/screens/login_page_web.dart';
import 'package:litlab_learning/main.dart';
import 'package:litlab_learning/model/users_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
          print("nooooooooooooooooooo");
          // Navigate to the registration screen
          Navigator.pushNamed(context, '/RegistrationWeb');
        } else {
          // If user details exist, set shared preferences and userProvider values
          currentUserId = studentModel.id;
          print("hiiiiiiiiiiiiiiiiiiiiii");
          _ref.read(userProvider.notifier).update((state) => studentModel);

          final preferences = await SharedPreferences.getInstance();
          await preferences.setString("userId", studentModel.id);
          await preferences.setString("userEmail", studentModel.email);
          await preferences.setString("userName", studentModel.name);
          await preferences.setString("userProfile", studentModel.image);

          // Navigate to the main body screen
          context.go('/on_body');
        }
      },
    );
  }

  addUser(UserModel userModel) {
    _authRepository.addUsers(userModel: userModel);
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
              message: "Unavailable to Login Pls Register  ",
              context: context,
              icon: null,
              color: null,
            );
          } else {
            // If user details exist, set shared preferences and userProvider values
            currentUserId = studentModel.id;
            _ref.read(userProvider.notifier).update((state) => studentModel);
            final preferences = await SharedPreferences.getInstance();
            await preferences.setString("userId", studentModel.id);
            await preferences.setString("userEmail", studentModel.email);
            await preferences.setString("userName", studentModel.name);
            await preferences.setString("userProfile", studentModel.image);
            // Navigate to the main body screen
         studentModel.department==''?context.go('/on_body') :context.go('/sideBar_Page');
          }
        });
  }
}