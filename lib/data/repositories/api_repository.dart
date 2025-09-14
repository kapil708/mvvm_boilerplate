import 'package:dartz/dartz.dart';
import 'package:mvvm_boilerplate/data/models/product/product.dart';
import 'package:mvvm_boilerplate/data/models/user/user.dart';
import 'package:mvvm_boilerplate/data/repositories/base_repository.dart';

import '../../core/utils/failures.dart';
import '../sources/remote/rest_client.dart';

class APIRepository extends BaseRepository {
  final RestClient restClient;

  APIRepository({required this.restClient});

  Future<Either<RemoteFailure, User>> login(String stringJson) async {
    return safeApiCall(
      apiCall: () => restClient.login(stringJson),
      modelFromJson: (json) => User.fromJson(json),
    );
  }

  Future<Either<RemoteFailure, List<Product>>> products() async {
    return safeApiCallList<Product>(
      apiCall: () => restClient.products(),
      modelFromJson: (json) => Product.fromJson(json),
      listKey: 'products',
    );
  }
}
