// To parse this JSON data, do
//
//     final productListResponse = productListResponseFromJson(jsonString);

import 'dart:convert';

ProductListResponse productListResponseFromJson(String str) =>
    ProductListResponse.fromJson(json.decode(str));

String productListResponseToJson(ProductListResponse data) =>
    json.encode(data.toJson());

class ProductListResponse {
  bool success;
  String statuscode;
  String msg;
  Data data;

  ProductListResponse({
    required this.success,
    required this.statuscode,
    required this.msg,
    required this.data,
  });

  factory ProductListResponse.fromJson(Map<String, dynamic> json) =>
      ProductListResponse(
        success: json["success"],
        statuscode: json["statuscode"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "statuscode": statuscode,
        "msg": msg,
        "data": data.toJson(),
      };
}

class Data {
  int fee;
  String kodeproduk;
  List<XLProduct> data;

  Data({
    required this.fee,
    required this.kodeproduk,
    required this.data,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        fee: json["fee"],
        kodeproduk: json["kodeproduk"],
        data: List<XLProduct>.from(json["data"].map((x) => XLProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "fee": fee,
        "kodeproduk": kodeproduk,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class XLProduct {
  String productCode;
  String productName;
  int price;

  XLProduct({
    required this.productCode,
    required this.productName,
    required this.price,
  });

  factory XLProduct.fromJson(Map<String, dynamic> json) => XLProduct(
        productCode: json["productCode"],
        productName: json["productName"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "productCode": productCode,
        "productName": productName,
        "price": price,
      };
}
