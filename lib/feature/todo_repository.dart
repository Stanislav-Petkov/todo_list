import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class TodoRepository {
  Future<void> fetch() async {
    var url = Uri.https(
      'jsonplaceholder.typicode.com/todos',
    );

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
