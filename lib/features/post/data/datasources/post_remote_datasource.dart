import 'package:app/core/datasource/datasource.dart';
import 'package:app/core/error/error_messages.dart';
import 'package:app/core/error/exceptions.dart';
import 'package:app/core/network/network_info.dart';
import 'package:app/core/routes/app_endpoints.dart';
import 'package:app/core/services/base_service.dart';
import 'package:app/features/post/data/models/post_model.dart';
import 'package:get/get_connect/http/src/response/response.dart';

abstract class IPostRemoteDatasource extends Datasource<PostModel, int> {}

class PostRemoteDatasource extends BaseService
    implements IPostRemoteDatasource {
  PostRemoteDatasource(INetworkInfo networkInfo) : super(networkInfo);

  @override
  Future<bool> deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteById(int id) {
    // TODO: implement deleteById
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getAll() async {
    final Response response = await get(
      AppEndpoints.post,
      decoder: (list) => listDecoder(list, (json) => PostModel.fromJson(json)),
    );
    if (response.status.isOk) {
      return response.body;
    } else {
      throw ServerException<String>(
        statusCode: response.statusCode,
        message: AppErrorMessages.noInternet,
        exceptionData: response.bodyString,
      );
    }
  }

  @override
  Future<PostModel> getById(int id) async {
    final Response<PostModel> response = await get(
      "${AppEndpoints.post}/$id",
      decoder: (json) => PostModel.fromJson(json),
    );
    if (response.status.isOk) {
      return response.body as PostModel;
    }

    throw Exception();
  }

  @override
  Future<PostModel> save(PostModel object) {
    // TODO: implement save
    throw UnimplementedError();
  }

  @override
  Future<PostModel> update(PostModel object) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
