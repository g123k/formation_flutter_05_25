import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:untitled4/api/model/product_response.dart';

part 'openfoodfacts_api.g.dart';

@RestApi()
abstract class OpenFoodFactsAPI {
  factory OpenFoodFactsAPI(Dio dio, {required String baseUrl}) =
      _OpenFoodFactsAPI;

  // getProduct?barcode=5000159484695
  @GET('/getProduct')
  Future<ProductAPIEntity> loadProduct(@Query('barcode') String barcode);
}

abstract class IAPIManager {
  Future<ProductAPIEntity> loadProduct(String barcode);
}

class OpenFoodFactsAPIManager implements IAPIManager {
  factory OpenFoodFactsAPIManager() {
    _instance ??= OpenFoodFactsAPIManager._();
    return _instance!;
  }

  static OpenFoodFactsAPIManager? _instance;

  final OpenFoodFactsAPI _api;

  OpenFoodFactsAPIManager._()
    : _api = OpenFoodFactsAPI(
        Dio(),
        baseUrl: 'https://api.formation-android.fr/v2/',
      );

  @override
  Future<ProductAPIEntity> loadProduct(String barcode) =>
      _api.loadProduct(barcode);
}
