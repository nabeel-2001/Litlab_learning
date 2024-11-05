import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:litlab_learning/core/contants/provider/const_provider.dart';
import 'package:litlab_learning/feature/common_paper/repository/common_screen_repository.dart';
import 'package:litlab_learning/model/common_paper.dart';
import 'package:litlab_learning/model/users_model.dart';
final commonPaperControllerProvider=Provider((ref) =>CommonPaperController(commonScreenRepository: ref.read(commonScreenRepositoryProvider), ref: ref) ,);


final getCommonPapers=StreamProvider((ref) => ref.watch(commonPaperControllerProvider).getCommonPapers(),);

class CommonPaperController {
  final CommonScreenRepository _commonScreenRepository;
  final Ref _ref;

  CommonPaperController(
      {required CommonScreenRepository commonScreenRepository, required Ref ref})
      :
        _commonScreenRepository=commonScreenRepository,
        _ref=ref;


  Stream<List<CommonPaper>> getCommonPapers() {
    return _commonScreenRepository.getCommonPaper();
  }

  updateProfile({required String commonCourse }) async {
    var box = await Hive.openBox('userBox');
    UserModel? user = box.get(
        'currentUser'); // 'userKey' is the key you use to store the user
    print(user?.id ?? "uuuuu");
// Check if the user exists
    if (user != null) {
      // Update the department field using the copyWith method
      UserModel updatedUser = user.copyWith(commonCourse: commonCourse);
      // Save the updated user back into the box
      await box.put('currentUser', updatedUser);
      await _commonScreenRepository.updateProfile(userModel: user,
        course: user.course,
        department: user.department,
        commonCourse: commonCourse,);
    }
  }
}