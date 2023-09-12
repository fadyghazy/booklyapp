import 'package:booklyappproject/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/repository/home_repo.implementation.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<APIService>(APIService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
      getIt.get<APIService>()
  ));
}