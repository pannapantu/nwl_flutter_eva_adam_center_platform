import 'dart:convert';
import 'package:widgets_test/constants/app_constants.dart';
import 'package:http/http.dart' as http;

class MessageManageService {
  Future<Map<String, dynamic>> fetchAllMessageManage() async {
    try {
      // Add debug print to check URL
      final url = Uri.parse("$baseUrl/api/v1/message/getAllTraffic");
      print("Fetching from: $url");

      final response = await http.get(url);
      print("Response status: ${response.statusCode}");
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return data;
      } else {
        throw Exception("Failed to fetch Message");
      }
    } catch (e) {
      throw Exception("Error : $e");
    }
  }

  Future<Map<String, dynamic>> deleteMessageManageById(String msgCode) async {
    try {
      final url =
          Uri.parse("$baseUrl/api/v1/message/deleteMessageById/$msgCode");
      final response = await http.post(url);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
        return jsonData;
      } else {
        throw Exception("Failed to fetch Message");
      }
    } catch (e) {
      throw Exception("Error : $e");
    }
  }
}
