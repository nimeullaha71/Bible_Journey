import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../app/Urls.dart';
import '../../../core/services/local_storage_service.dart';
import '../models/invoice_model.dart';

class InvoiceService {
  static Future<List<InvoiceResponse>> fetchInvoices() async {
    final token = await LocalStorage.getToken();

    final response = await http.get(
      Uri.parse('${Urls.baseUrl}/api/invoices/'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to load invoices");
    }

    final List decoded = jsonDecode(response.body);
    return decoded.map((e) => InvoiceResponse.fromJson(e)).toList();
  }
}
