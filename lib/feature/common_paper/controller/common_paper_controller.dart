import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:litlab_learning/feature/common_paper/repository/common_screen_repository.dart';
import 'package:litlab_learning/model/common_paper.dart';
import 'package:litlab_learning/model/users_model.dart';
final commonPaperControllerProvider=Provider((ref) =>CommonPaperController(commonScreenRepository: ref.read(commonScreenRepositoryProvider)) ,);


final getCommonPapers=StreamProvider((ref) => ref.watch(commonPaperControllerProvider).getCommonPapers(),);

class CommonPaperController{
  final CommonScreenRepository _commonScreenRepository;
  CommonPaperController({required CommonScreenRepository commonScreenRepository}):
      _commonScreenRepository=commonScreenRepository;


Stream<List<CommonPaper>>  getCommonPapers(){
    return _commonScreenRepository.getCommonPaper();
  }
  updateProfile({required UserModel userModel, required String department,required String course,required String commonCourse }){
    _commonScreenRepository.updateProfile(userModel: userModel,course: course,department: department, commonCourse: commonCourse,);
  }
}