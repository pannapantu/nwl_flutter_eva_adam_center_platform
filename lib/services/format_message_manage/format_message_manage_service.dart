import 'dart:convert';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:widgets_test/constants/app_constants.dart';
import 'package:http/http.dart' as http;

part 'format_message_manage_service.g.dart';

@riverpod
FormatMessageManageService formatMessageManageService(ref) {
  return FormatMessageManageService();
}

class FormatMessageManageService {
  Future<List<dynamic>> fetchAllFormatMessage() async {
    try {
      final url = Uri.parse("$baseUrl/api/v1/message/getAllFormatMessage");
      print("Fetching from: $url");
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception("Failed to fetch FormatMessageManage");
      }
    } catch (e) {
      throw Exception("Error $e");
    }
  }
}
