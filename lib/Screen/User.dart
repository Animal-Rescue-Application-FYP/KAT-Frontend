import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kat_centre/Animal/addAnimal.dart';
import 'package:kat_centre/Screen/UserProfile.dart';
import 'package:kat_centre/controller/databaseHelper.dart';

getUsers(context) async {
  DatabaseHelper databaseHelper = DatabaseHelper();
  var currentUser = await databaseHelper.getUserData();
  print(currentUser);
  var userRescue =
  await databaseHelper.getUserRescueData(currentUser['user']['id']);
  print(userRescue);
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => UserProfile(
            currentUser: currentUser,
            rescueData: userRescue,
            dataLength: userRescue.length,
            list: [currentUser['user']['id'],
              currentUser['user']['name'],
              currentUser['user']['email'],
            currentUser['user']['phone'],
            currentUser['user']['password']],
          )),
          (Route<dynamic> route) => false);
}

//get userid
getUserID(context) async {
  DatabaseHelper databaseHelper = DatabaseHelper();
  var data = await databaseHelper.getUserData();
  print(data);
  var userID = (data['user']['id']);
  print(userID.runtimeType);
  print(userID);
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => AddAnimal(
            userId: userID,
          )),
          (Route<dynamic> route) => false);
}


