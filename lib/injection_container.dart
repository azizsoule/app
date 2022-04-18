import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'core/network/network_info.dart';

Future<void> init() async {
  //! Features - Your feature (feature_1)

  // Use cases
  // Inject usecases

  // Repository
  // Inject repositories

  // Data sources
  // Inject datasources

  //! Core
  // Inject core components
  Get.lazyPut<NetworkInfo>(() => NetworkInfoImpl(Get.find()));

  //! External
  // Inject externals components
  Get.lazyPut(() => Connectivity());
}
