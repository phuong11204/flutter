import 'package:dio/dio.dart';
import 'package:flutter_bt/model/product.dart';

class API {
  Future<List<Product>> getAllProduct() async {
    var dio = Dio();
    var url = 'https://fakestoreapi.com/products';

    var response = await dio.get(url);

    if (response.statusCode == 200) {
      List data = response.data;
      List<Product> ls = data.map((json) => Product.fromJson(json)).toList();

      return ls;
    } else {
      print("Lỗi API: ${response.statusCode}");
      return [];
    }
  }
}

var testAPI = API();
