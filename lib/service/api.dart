library app.api;

import 'dart:convert';
import 'package:no_broker_demo/service/home_service.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class ServiceClient extends BaseClient {
  final Client baseClient;

  ServiceClient({Client? baseClient}) : baseClient = baseClient ?? Client();

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    request.headers['authorization'] = "Bearer token";
    return await baseClient.send(request);
  }

  Future<Response> run(Request request) async {
    try {
      final streamResponse = await send(request);
      var response = await Response.fromStream(streamResponse);
      _logApiCall(request, response);
      return response;
    } catch (e) {
      _logApiCall(request);
      rethrow;
    }
  }
}

class ServiceAPI {
  static final ServiceClient client = ServiceClient();

  static LandList get lands => LandList(client);

  static batch() {
    throw UnimplementedError();
  }
}

void _logApiCall(Request req, [Response? res]) {
  Map<String, dynamic> logInfo = {
    "REQUEST": "${req.method} ${req.url}",
    "HEADER": req.headers,
    "PAYLOAD": req.body.isNotEmpty ? jsonDecode(req.body) : null,
    if (res != null)
      "RESPONSE": {
        "statusCode": res.statusCode,
        "body": res.body.isNotEmpty ? jsonDecode(res.body) : null,
      },
  };

  Logger(
    printer: PrettyPrinter(
      printTime: true,
      methodCount: 0,
      noBoxingByDefault: false,
      printEmojis: false,
    ),
  ).i(logInfo);
}
