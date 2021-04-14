import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class DatabaseHelper {
  String serverUrl = "http://10.0.2.2:8000/api/";
  String serverUrlHelpline = "http://10.0.2.2:8000/api/helpline/";
  String serverUrlCurrentUser = "http://10.0.2.2:8000/api/currentUser/";
  String serverUrlRescue = "http://10.0.2.2:8000/api/rescue/";
  String serverUrlAssistance = "http://10.0.2.2:8000/api/assistance/";

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
  registerUserData(String name, String email, String phone, String password) async {
    String myUrl = "$serverUrl/register";
    final response = await http.post(myUrl,
    headers: {
    'Accept' : 'application/json'
    },
        body: {
          "name": "$name",
          "email": "$email",
          "phone": "$phone",
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
  //--helpline--
  //function for registering helpline numbers
void addDataHelpline(String _nameController, String _addressController, String _phoneController) async {
/*  final prefs = await SharedPreferences.getInstance();
  final key = 'token';
  final value = prefs.get(key) ?? 0;*/

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

    String myUrl = "$serverUrlHelpline";
    http.Response response = await http.get(myUrl,
      headers: {
        'Accept':'application/json',
        'Authorization':'Bearer $value'
      }
    );
    return json.decode(response.body);
  }
  //--currentUser
  Future<List> getDataCurrentUser() async{
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "$serverUrlCurrentUser";
    http.Response response = await http.get(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization':'Bearer $value'
        }
    );
    return json.decode(response.body);
  }
  //--animal
  //function for registering rescue animals
  void addDataAnimal(
      String _animalNameController,
      String _imageController,
      String _categoryController,
      String _yearController,
      String _genderController,
      String _addressController,
      String _phoneController,
      String _postedByController,
      String _descriptionController,
      userID
      ) async {
    /*final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;*/
    //String myUrl = "$serverUrl/api";
    String myUrl = "http://10.0.2.2:8000/api/rescue/";
    final response = await http.post(myUrl,
        headers: {
          'Accept':'application/json'
        },
        body: {
          "animalName":"$_animalNameController",
          "image":"$_imageController",
          "category":"$_categoryController",
          "year":"$_yearController",
          "gender":"$_genderController",
          "address": "$_addressController",
          "phone": "$_phoneController",
          "postedBy":"$_postedByController",
          "description":"$_descriptionController",
          "user_id":"$userID"
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
  //function for update animal
  void editDataAnimal(
      String id,
      String animalName,
      String category,
      String year,
      String gender,
      String address,
      String phone,
      String postedBy,
      String description
      ) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "http://10.0.2.2:8000/api/rescue/$id";
    http.put(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization':'Bearer $value'
        },
        body: {
          "animalName": "$animalName",
          "category": "$category",
          "year": "$year",
          "gender": "$gender",
          "address": "$address",
          "phone": "$phone",
          "postedBy": "$postedBy",
          "description": "$description"
        }
    ).then((response){
      print('Response status : ${response.statusCode}');
      print('Response body: ${response.body}');
    });
  }
  //function for deleting rescue post
  void removeAnimal(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "http://10.0.2.2:8000/api/rescue/$id";
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
  Future<List> getDataAnimal() async{
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "$serverUrlRescue";
    http.Response response = await http.get(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization':'Bearer $value'
        }
    );
    return json.decode(response.body);
  }
  //--medical assistance--
  //function for adding self assistance
  void addDataAssistance(String _queryController, String _descriptionController, String _urlController) async {
    /*final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;*/

    //String myUrl = "$serverUrl/api";
    String myUrl = "http://10.0.2.2:8000/api/assistance/";
    final response = await http.post(myUrl,
        headers: {
          'Accept':'application/json'
        },
        body: {
          "query": "$_queryController",
          "description": "$_descriptionController",
          "url": "$_urlController"
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
  void editDataAssistance(String id, String query, String description, String url) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "http://10.0.2.2:8000/api/assistance/$id";
    http.put(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization':'Bearer $value'
        },
        body: {
          "query": "$query",
          "description": "$description",
          "url": "$url",
        }
    ).then((response){
      print('Response status : ${response.statusCode}');
      print('Response body: ${response.body}');
    });
  }
  //function for delete
  void removeAssistance(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "http://10.0.2.2:8000/api/assistance/$id";
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
  Future<List> getDataAssistance() async{
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "$serverUrlAssistance";
    http.Response response = await http.get(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization':'Bearer $value'
        }
    );
    return json.decode(response.body);
  }

  //-------------------------------------------------------------------//
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
  //--------------------------------------------------------//

//get userdata
  Future<dynamic> getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString("token");
    print(token);
    var url = 'http://10.0.2.2:8000/api/currentUser';
    http.Response response = await http.get(
      url,
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  //get user rescue data
  Future<dynamic> getUserRescueData(id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString("token");
    print(token);
    var url = 'http://10.0.2.2:8000/api/rescue/$id';
    http.Response response = await http.get(
      url
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> userRescue = map["data"];
      print(userRescue);
      return userRescue;
    } else {
      print(response.statusCode);
    }
  }

  //editUser
  void editUser(String id, String name, String address, String phone) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "http://10.0.2.2:8000/api/editCurrentUser";
    http.put(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization':'Bearer $value'
        },
        body: {
          "name": "$name",
          "email": "$address",
          "phone": "$phone"
        }
    ).then((response){
      print('Response status : ${response.statusCode}');
      print('Response body: ${response.body}');
    });
  }

  //logout
  /*logout(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    Map data = {'token': token};
    var url = "http://10.0.2.2:8000/api/logout";
    http.Response response = await http.post(url, body: data);
    var jsonResponse = json.decode(response.body);
    if (response.statusCode == 200) {
      print('jsonResponse:${jsonResponse["token"]}');
      *//*_save(jsonResponse["token"]);*//*
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
              (Route<dynamic> route) => false);
      createSnackBar('Successfully logged out', Colors.green, context);
      print('$context');
    } else {
      print('jsonResponse: ${jsonResponse["error"]}');
      createSnackBar('Could not logout', Colors.red, context);
    }
  }*/


}


