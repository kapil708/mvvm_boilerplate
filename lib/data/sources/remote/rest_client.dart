import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

//dart pub run build_runner build
part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST('/auth/login')
  Future<dynamic> login(@Body() String stringJson);

  @GET('/products')
  Future<dynamic> products();
}
