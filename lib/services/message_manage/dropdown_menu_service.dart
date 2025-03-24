import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:widgets_test/constants/app_constants.dart';

class DropdownMenuService {
  Future<List<dynamic>> fetchMessageSize() async {
    try {
      final url = Uri.parse("$baseUrl/api/v1/message/getAllSignSize");
      print("Fetching Dropdown from: $url");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data =
            jsonDecode(response.body) as List<dynamic>; // Json expected
        return data;
      } else {
        throw Exception("Failed to fetch message");
      }
    } catch (e) {
      throw Exception("Error : $e");
    }
  }
}
