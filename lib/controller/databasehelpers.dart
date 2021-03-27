import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper {
  String serverUrl = "http://10.0.2.2:8000/api/";
  String serverUrlhelpline = "http://10.0.2.2:8000/api/helpline/";
  String serverUrlrescue = "http://10.0.2.2:8000/api/rescue/";
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
//--helpline--
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
        // "animalName": "$animalName",
        // "category": "$category",
        // "year": "$year",
        // "gender": "$gender",
        // "postedBy": "$postedBy",
        // "description": "$description"
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

  //--animal
//function for registering rescue animals
  void addDataAnimal(
      String _animalNameController,
      String _categoryController,
      String _yearController,
      String _genderController,
      String _addressController,
      String _phoneController,
      String _postedByController,
      String _descriptionController
      ) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    //String myUrl = "$serverUrl/api";
    String myUrl = "http://10.0.2.2:8000/api/rescue/";
    final response = await http.post(myUrl,
        headers: {
          'Accept':'application/json'
        },
        body: {
          "animalName":"$_animalNameController",
          "category":"$_categoryController",
          "year":"$_yearController",
          "gender":"$_genderController",
          "address": "$_addressController",
          "phone": "$_phoneController",
          "postedBy":"$_postedByController",
          "description":"$_descriptionController"
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

    String myUrl = "$serverUrlrescue";
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
}
