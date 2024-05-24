import 'dart:convert';

import 'package:http/http.dart';

Future<String?> zipCodeToAddress(String zipCode) async {
  if (zipCode.length != 7) {
    return null;
  }
  final response = await get(
    Uri.parse(
      'https://zipcloud.ibsnet.co.jp/api/search?zipcode=$zipCode',
    ),
  );
  // 正常なステータスコードが返ってきているか
  if (response.statusCode != 200) {
    return null;
  }
  // ヒットした住所はあるか
  final result = jsonDecode(response.body);
  if (result['results'] == null) {
    return null;
  }
  final addressMap = (result['results'] as List).first;
  final address =
      '${addressMap['address1']} ${addressMap['address2']} ${addressMap['address3']}';
  return address;
}
