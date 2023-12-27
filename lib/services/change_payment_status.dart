
import 'package:http/http.dart' as http;
import 'dart:convert';
//0 not paid
// 1 paid
class ChangePaymentStatus{

  Future<bool> setPaymentStatus(int status, int orderID, String token) async {
    final url = Uri.parse("http://127.0.0.1:8000/api/admin/payment_status");

    final response = await http.post(
      url,
      headers: <String, String>{
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'id': status,
        'id_order': orderID
      }),
    );
    print(response.body);
    print("the statussssss paaay${response.statusCode}");

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}