import 'dart:convert';
import 'package:no_broker_demo/service/api.dart';
import 'package:no_broker_demo/shared/http.dart';
import 'package:http/http.dart';
import '../core/const.dart';
import '../core/model/land_details.dart';
import '../shared/end_points.dart';
import '../shared/logger.dart';

class LandList {
  final ServiceClient _client;

  LandList(this._client);
  Future<List<LandDetails>> getLands() async {
    Endpoint endpoint = Endpoint("");
    Uri uri = _client.getUri(url, endpoint);

    String method = "GET";
    Request request = Request(method, uri);
    Response response = await _client.run(request);

    debugModePrint('response: $response');

    if (_client.httpIsOk(response.statusCode)) {
      debugModePrint('Response Body: ${response.body}');

      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      if (jsonResponse.containsKey('landdetails')) {
        final List<dynamic> dataJson = jsonResponse['landdetails'];
        List<LandDetails> lands =
            dataJson.map((json) => LandDetails.fromJson(json)).toList();

        return lands;
      } else {
        throw Exception('Invalid response format or missing data');
      }
    } else {
      throw Exception('Failed to load lands list: ${response.reasonPhrase}');
    }
  }
}
