import 'package:app/core/services/base_service.dart';
import 'package:app/core/services/http_helper.dart';
import 'package:app/features/post/data/datasources/post_local_datasource.dart';
import 'package:app/features/post/data/datasources/post_remote_datasource.dart';
import 'package:app/features/post/data/repositories/post_repository.dart';
import 'package:app/features/post/domain/repositories/post_repository_interface.dart';
import 'package:app/features/post/domain/usecases/get_all_post_use_case.dart';
import 'package:app/features/post/domain/usecases/get_single_post_use_case.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'core/network/network_info.dart';

Future<void> injectDependencies() async {
  //! Use cases
  // Inject usecases
  Get.lazyPut<GetSinglePostUseCase>(() => GetSinglePostUseCase(Get.find()));
  Get.lazyPut<GetAllPostsUseCase>(() => GetAllPostsUseCase(Get.find()));

  //! Repository
  // Inject repositories
  Get.lazyPut<IPostRepository>(() => PostRepository(Get.find(), Get.find()));

  //! Data sources
  // Inject datasources
  Get.lazyPut<IPostLocalDatasource>(() => PostLocalDatasource(Get.find()));
  Get.lazyPut<IPostRemoteDatasource>(() => PostRemoteDatasource(Get.find()));

  //! Core
  // Inject core components
  Get.lazyPut<BaseService>(() => BaseService());
  Get.lazyPut<INetworkInfo>(() => NetworkInfo(Get.find()));
  Get.lazyPut<HttpHelper>(() => HttpHelper(Get.find(), Get.find()));

  //! External
  // Inject externals components
  Get.lazyPut<GetStorage>(() => GetStorage());
  Get.lazyPut<Connectivity>(() => Connectivity());
}
