import 'package:dartz/dartz.dart';
import 'package:mvvm_boilerplate/data/models/product/product.dart';
import 'package:mvvm_boilerplate/data/models/user/user.dart';

import '../../core/utils/failures.dart';
import '../sources/remote/dio_client.dart';
import '../sources/remote/rest_client.dart';

class APIRepository {
  final RestClient restClient;

  APIRepository({required this.restClient});

  Future<Either<RemoteFailure, User>> login(String stringJson) async {
    return safeApiCall(
      apiCall: () => restClient.login(stringJson),
      modelFromJson: (json) => User.fromJson(json),
    );
  }

  Future<Either<RemoteFailure, List<Product>>> products() async {
    return safeApiCall(
      apiCall: () => restClient.products(),
      modelFromJson: (json) {
        List products = json['products'] as List;
        return products.map((p) => Product.fromJson(p)).toList();
      },
    );
  }
}
