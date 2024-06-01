import 'dart:convert';

import 'package:get_request/single_post_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<SinglePostModel?> getSinglePost() async {
    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
      var response = await http.get(url);

      if (response.statusCode == 200 || response.statusCode == 201) {
        SinglePostModel singlePostModel = SinglePostModel.fromJson(
          json.decode(response.body),
        );
        return singlePostModel;
      }
    } catch (e) {
      print(e);
    }
  }
}
