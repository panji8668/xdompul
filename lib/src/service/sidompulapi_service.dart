

import 'package:sidompul/src/models/productist_response.dart';
import 'package:sidompul/src/service/baseservice.dart';

abstract class BaseSidompul {
  Future<ProductListResponse> getProducts(String baseurl, String paket);

}

class SidompulService extends BaseService implements BaseSidompul {
  SidompulService(super.authtoken);

  @override
  Future<ProductListResponse> getProducts(String baseurl,String paket) async {
    httpdio.options.baseUrl = baseurl;
    httpdio.options.headers["auth"] = "Bearer $authtoken";
    var resp =
        await httpdio.get("/api/v1/sidompulapp/produk?phone=&category=$paket");
    return ProductListResponse.fromJson(resp.data);
  }

}
