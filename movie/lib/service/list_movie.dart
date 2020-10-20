import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie/constants/constants.dart';

Future<dynamic> teamList() async {
  final response = await http.get("$baseUrl/team/getTeam");

  if (response.statusCode == 200) {
    print(response.body);
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load post');
  }
}

// Future<http.Response> movieList() {
//   try {
//     print("https://yts-proxy.now.sh/list_movies.json?sort_by=rating");
//   } on Exception {
//     print(StackTrace.current);
//     throw Exception("Server Error");
//   }
// }
