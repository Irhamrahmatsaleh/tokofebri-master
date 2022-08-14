import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:tokofebri/models/models.dart';

class HomeProvider extends ChangeNotifier {
  List<Product> data = [];
  bool isLoading = false;

  HomeProvider() {
    getData();
  }
// getter dan setter untuk handling error
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  set errorMessage(String? val) {
    _errorMessage = val;
    notifyListeners();
  }
// metode untuk get data
  getData() async {
    errorMessage = null;
    try {
      isLoading = true;
      notifyListeners();
      final response = await http.get(Uri.parse(
          'https://mocki.io/v1/52c41978-6e31-4ea3-b917-01899e3ed373'));
      isLoading = false;
      notifyListeners();
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        var result =
            jsonResponse.map((data) => Product.fromJson(data)).toList();
        data = List.from(result);
      } else {
        throw Exception('Unexpected error occured!');
      }
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
    notifyListeners();
  }

  // @override
  // void dispose() {
  //   ///
  //   super.dispose();
  // }
}
