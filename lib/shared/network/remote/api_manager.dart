import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news/models/soura_response.dart';


class APIManger {
  static Future<SouraResponse> getSources(context) async {
    var baseNewsURL = "newsapi.org";
    var URL = Uri.https(baseNewsURL, '/v2/top-headlines/sources',
        {"apiKey": "804e9bb4def642359762cf94197378a9"});
    try {
      Response source = await http.get(URL);
      var json = jsonDecode(source.body);
      SouraResponse souraResponse = SouraResponse.fromJson(json);
      return souraResponse;
    } catch (e) {
      throw(e);
      // return ShowMessage(context, 'Error', 'OK', () {
      //   Navigator.pop(context);
      }
    }

}
