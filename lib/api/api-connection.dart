import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:api_demo2_model_class/models/model.dart';

Future getDatas() async {
  var url = "https://reqres.in/api/users";
  var resp = await http.get(
    url,
  );
  // print(  jsonDecode(resp.body));
  // Map userMap = jsonDecode(resp.body);
  User user = userFromJson(resp.body);
  print('Howdy, $user');
  // print('Howdy, ${ jsonEncode(user.data.toList())})');

  // user.from
  // return await jsonDecode(resp.body);

  return  user ;
}
