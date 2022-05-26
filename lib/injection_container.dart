import 'package:app/features/feature_1/data/datasources/entity_local_datasource.dart';
import 'package:app/features/feature_1/data/datasources/entity_remote_datasource.dart';
import 'package:app/features/feature_1/data/repositories/entity_repository.dart';
import 'package:app/features/feature_1/domain/repositories/entity_repository_interface.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'core/network/network_info.dart';

Future<void> init() async {
  // Use cases
  // Inject usecases

  // Repository
  // Inject repositories
  Get.lazyPut<IEntityRepository>(() => EntityRepository(Get.find(), Get.find()));

  // Data sources
  // Inject datasources
  Get.lazyPut<IEntityLocalDatasource>(() => EntityLocalDatasource(Get.find()));
  Get.lazyPut<IEntityRemoteDatasource>(() => EntityRemoteDatasource(Get.find()));

  //! Core
  // Inject core components
  Get.lazyPut<INetworkInfo>(() => NetworkInfo(Get.find()));

  //! External
  // Inject externals components
  Get.lazyPut<HiveInterface>(() => Hive);
  Get.lazyPut<Connectivity>(() => Connectivity());
}
