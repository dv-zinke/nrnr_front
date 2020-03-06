import 'dart:convert';
import "package:http/http.dart" as http;

class RequestResult
{
  bool ok;
  dynamic data;
  RequestResult(this.ok, this.data);
}

const PROTOCOL = "http";
const DOMAIN = "49.50.163.40:1337";

Future<RequestResult> http_get(String route, [dynamic data]) async {
  var dataStr = jsonEncode(data);
  var url = "$PROTOCOL://$DOMAIN/$route?data=$dataStr";
  var result = await http.get(url);
  return RequestResult(true, jsonDecode(result.body));
}

 http_post(String route, [dynamic data]) async {
  var url = "$PROTOCOL://$DOMAIN/$route";
  print(data);
  var dataStr = jsonEncode(data);
  print("datrStr");
  print(dataStr);
  var result = await http.post(url, body: dataStr, headers:{"Content-Type":"application/json"});

  return jsonDecode(result.body);


}

http_post2(String route, String Image, [dynamic data]) async {
  var url = "$PROTOCOL://$DOMAIN/$route";
  print(data);
  data['images'] = Image;
  dynamic dataStr = jsonEncode(data);

  print("dataStr");
  print(dataStr);
  dataStr = dataStr.toString().replaceAll('"images":"', '"images":').replaceAll(']"', ']');
  print("conver");

  print(dataStr);


  var result = await http.post(url, body: dataStr, headers:{"Content-Type":"application/json"});

  return jsonDecode(result.body);


}

