import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:todo_list/feature/todo_dto.dart';

class TodoRepository {
  Future<List<TodoDto>?> fetch() async {
    var url = Uri.https('jsonplaceholder.typicode.com', '/todos');

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      var list = jsonResponse.map((element) {
        return TodoDto.fromJson(element);
      }).toList();
      print('jsonResponse: $jsonResponse');
      print('jsonResponse: $list');
      return list;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
