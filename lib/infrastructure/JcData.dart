import 'dart:convert';

import 'package:http/http.dart';
import 'package:meta/meta.dart';

class JcData {
  static const String _Url = 'https://x5w.azurewebsites.net/api/data';

  static Future Upsert({
    @required table,
    @required id,
    @required content,
    @required token,
  }) async {
    await _RequestData(
      action: "Upsert",
      table: table,
      id: id,
      content: content,
      token: token,
    );
  }

  static Future<dynamic> Get({
    @required table,
    @required id,
    @required token,
  }) async {
    return await _RequestData(
      action: "Get",
      table: table,
      id: id,
      content: null,
      token: token,
    );
  }

  static Future<Object> _RequestData({
    @required String action,
    @required String table,
    @required String id,
    @required Object content,
    @required String token,
  }) async {
    Map<String, dynamic> response = await Request(payload: {
      "Action": action,
      "Table": table,
      "Id": id,
      "Content": json.encode(content),
      "Token": token,
    });

    if (response["error"] != null) {
      throw response["error"];
    }

    if (response["data"] == null) {
      return null;
    }

    return json.decode(response["data"]);
  }

  static Future<dynamic> Request({
    @required Map<String, String> payload,
    bool ignorePayloadAndUseGet = false,
  }) async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json, text/plain, */*',
    };

    var body = payload == null
        ? null
        : '"' + Uri.encodeFull(json.encode(payload)) + '"';

    Response response;
    if (ignorePayloadAndUseGet) {
      response = await get(_Url, headers: headers);
    } else {
      response = await post(_Url, headers: headers, body: body);
    }

    if (response.statusCode == 200) {
      print("success: " + response.body);
      return json.decode(response.body);
    } else {
      String message = "Error accessing data";
      print(message);
      print("code: " + response.statusCode.toString());
      print("request: " + payload.toString());
      print("response body: " + response.body);
      print("reason: " + response.reasonPhrase);
      throw Exception(message);
    }
  }
}
