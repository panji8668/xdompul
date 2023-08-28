import 'package:rxdart/rxdart.dart';
import 'package:sidompul/src/bloc/basebloc.dart';
import 'package:sidompul/src/models/productist_response.dart';
import 'package:sidompul/src/service/sidompulapi_service.dart';

import '../models/api_response.dart';

class SidompulBloc extends BaseBloc {
  final service = SidompulService("");
  late String baseurl;

  SidompulBloc({required String burl, required String xauthtoken}) {
    baseurl = burl;
    service.authtoken=xauthtoken;
  }

  final _productController =
      BehaviorSubject<ApiResponse<ProductListResponse>>();
  Stream<ApiResponse<ProductListResponse>> get productStream =>
      _productController.stream;
  initGetProducts() {
    _productController.sink.add(ApiResponse.init());
  }

  getProduct({required  String paket}) {
    _productController.sink.add(ApiResponse.loading('Loading'));
    service
        .getProducts(baseurl, paket)
        .then((value) =>
            _productController.sink.add(ApiResponse.completed(value)))
        .catchError((error) =>
            _productController.sink.add(ApiResponse.error(error.toString())));
  }

  @override
  void dispose() {
    _productController.close();
  }
}
