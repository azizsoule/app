import 'package:app/features/post/data/datasources/post_local_datasource.dart';
import 'package:app/features/post/data/datasources/post_remote_datasource.dart';
import 'package:app/features/post/data/repositories/post_repository.dart';
import 'package:app/features/post/domain/repositories/post_repository_interface.dart';
import 'package:app/features/post/domain/usecases/get_all_post_use_case.dart';
import 'package:app/features/post/domain/usecases/get_single_post_use_case.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'core/network/network_info.dart';

Future<void> injectDependencies() async {
  // Use cases
  // Inject usecases
  Get.lazyPut<GetSinglePostUseCase>(() => GetSinglePostUseCase(Get.find()));
  Get.lazyPut<GetAllPostsUseCase>(() => GetAllPostsUseCase(Get.find()));

  // Repository
  // Inject repositories
  Get.lazyPut<IPostRepository>(() => PostRepository(Get.find(), Get.find()));

  // Data sources
  // Inject datasources
  Get.lazyPut<IPostLocalDatasource>(() => PostLocalDatasource());
  Get.lazyPut<IPostRemoteDatasource>(() => PostRemoteDatasource(Get.find()));

  //! Core
  // Inject core components
  Get.lazyPut<INetworkInfo>(() => NetworkInfo(Get.find()));

  //! External
  // Inject externals components
  Get.lazyPut<HiveInterface>(() => Hive);
  Get.lazyPut<Connectivity>(() => Connectivity());
}
