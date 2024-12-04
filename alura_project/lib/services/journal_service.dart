import 'dart:convert';

import 'package:flutter_webapi_first_course/models/journal.dart';
import 'package:flutter_webapi_first_course/services/http_interceptors.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';

class JournalService {
  static const String url = "http://192.168.51.66:3000/";
  static const String resource = "journals/";
  
  http.Client client = InterceptedClient.build(interceptors: [LoggerInterceptor()]);

  String getUrl() {
    return "$url$resource";
  }

  // Future<void> register(String content) async {
  //   final response = await client.post(
  //     Uri.parse(getUrl()),
  //     headers: {
  //       "Content-Type": "application/json", // Informar ao servidor que os dados são JSON
  //     },
  //     body: '{"content": "$content"}', // Corpo da requisição no formato JSON
  //   );
  //
  //   if (response.statusCode == 201 || response.statusCode == 200) {
  //     print("Sucesso: ${response.body}");
  //   } else {
  //     print("Erro: ${response.statusCode}");
  //   }
  // }

  Future<bool> register(Journal journal) async {
    String jsonJournal = json.encode(journal.toMap());
    http.Response response = await client.post(Uri.parse(
        getUrl()),
        headers: {
          'Content-type': 'application/json'
        },
        body: jsonJournal);
    if(response.statusCode == 201) {
      return true;
    }
    return false;
  }

  Future<List<Journal>> getAll() async {
    http.Response response = await client.get(Uri.parse(getUrl()));

    if(response.statusCode!=200) {
      throw Exception();
    }

    List<Journal> list = [];

    List<dynamic> listDynamic = json.decode(response.body);

    for(var jsonMap in listDynamic) {
      list.add(Journal.fromMap(jsonMap));
    }
    return list;
  }

  Future<bool> edit(String id, Journal journal) async {
    String jsonJournal = json.encode(journal.toMap());

    http.Response response = await client.put(
        Uri.parse(
          "${getUrl()}$id"),
        headers: {
          'Content-type': 'application/json'
        },
        body: jsonJournal
    );

    if(response.statusCode==200) {
      return true;
    }
    return false;
  }

  Future<bool> delete(String id) async {
    http.Response response = await http.delete(Uri.parse("${getUrl()}$id"));

    if(response.statusCode==200) {
      return true;
    }
    return false;
  }
}