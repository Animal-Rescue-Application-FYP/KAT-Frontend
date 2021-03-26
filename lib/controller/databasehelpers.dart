import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper {
  String serverUrl = "http://10.0.2.2:8000/api/";
  String serverUrlhelpline = "http://10.0.2.2:8000/api/helpline/";
  var status;

  var token;

  //create function for login
  loginData(String email, String password) async {
    String myUrl = "$serverUrl/login";
    final response = await http.post(myUrl,
        headers: {
          'Accept' : 'application/json'
        },
        body: {
          "email": "$email",
          "password": "$password"
        }
    );
    status = response.body.contains('error');

    var data = json.decode(response.body);

    if(status){
      print('data : ${data["error"]}');
    }else{
      print('data : ${data["token"]}');
      _save(data["token"]);
    }
  }

  //create function for register users
  registerUserData(String name, String email, String password) async {
    String myUrl = "$serverUrl/register";
    final response = await http.post(myUrl,
    headers: {
    'Accept' : 'application/json'
    },
        body: {
          "name": "$name",
          "email": "$email",
          "password": "$password"
        }
    );
    status = response.body.contains('error');

    var data = json.decode(response.body);

    if(status){
      print('data: ${data["error"]}');
    }else{
      print('data: {$data["token"]}');
      _save(data["token"]);
    }
  }

  //function for registering helpline numbers
void addDataHelpline(String _nameController, String _addressController, String _phoneController) async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'token';
  final value = prefs.get(key) ?? 0;

  //String myUrl = "$serverUrl/api";
  String myUrl = "http://10.0.2.2:8000/api/helpline/";
  final response = await http.post(myUrl,
    headers: {
        'Accept':'application/json'
    },
    body: {
      "name": "$_nameController",
      "address": "$_addressController",
      "phone": "$_phoneController"
    }
  );
  status = response.body.contains('error');

  var data = json.decode(response.body);

  if(status){
    print('data : ${data["error"]}');
  }else{
    print('data : ${data["token"]}');
    _save(data["token"]);
  }
}
//function for update
  void editData(String id, String name, String address, String phone) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "http://10.0.2.2:8000/api/helpline/$id";
    http.put(myUrl,
      headers: {
        'Accept':'application/json',
        'Authorization':'Bearer $value'
      },
      body: {
        "name": "$name",
        "address": "$address",
        "phone": "$phone"
      }
    ).then((response){
      print('Response status : ${response.statusCode}');
      print('Response body: ${response.body}');
    });
  }

  //function for delete
  void removeRegister(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "http://10.0.2.2:8000/api/helpline/$id";
    http.delete(myUrl,
      headers: {
        'Accept':'application/json',
        'Authorization':'Bearer $value'
      }).then((response){
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
    });
  }


  //function getData
  Future<List> getData() async{
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "$serverUrlhelpline";
    http.Response response = await http.get(myUrl,
      headers: {
        'Accept':'application/json',
        'Authorization':'Bearer $value'
      }
    );
    return json.decode(response.body);
  }

  //function save
  _save(String token) async {
      final prefs = await SharedPreferences.getInstance();
      final key = 'token';
      final value = token;
      prefs.setString(key, value);
  }

  //function read
  read() async{
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    print('read : $value');
  }

}