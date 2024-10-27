import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:litlab_learning/feature/home/controller/home_controller.dart';
import 'package:litlab_learning/feature/home/repository/home_repository.dart';
import 'package:litlab_learning/model/common_paper.dart';
import 'package:litlab_learning/model/course_model.dart';

class HomeController{
  final HomeRepository _homeRepository;
  HomeController({required HomeRepository homeRepository}):
        _homeRepository=homeRepository;

  Stream<CourseModel> getCorePaper(WidgetRef ref){
    return _homeRepository.getCorePaper(ref);
  }
  Stream<CommonPaper> getCommonPaper(WidgetRef ref){
    return _homeRepository.getCommonPaper(ref);
  }
}

