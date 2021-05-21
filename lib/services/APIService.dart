import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import 'package:vjezbe2_app/models/Proizvodi.dart';

class APIService{
  static String username;
  static String password;
  String route;

  APIService({this.route});

  void SetParameter(String Username, String Password){
    username=Username;
    password=Password;
  }

  static Future<dynamic> Get(String route) async{
    String baseUrl="http://172.26.16.1:5010/"+route;
    final String basicAuth='Basic '+base64Encode(utf8.encode('$username:$password'));
    final response= await http.get(
      Uri.parse(baseUrl),
      headers: {HttpHeaders.authorizationHeader:basicAuth}
    );
    if(response.statusCode==200){
      return json.decode(response.body) as List;
    }
  }

  static Future<List<dynamic>> GetProduct(String route) async{
    String baseUrl="http://172.26.16.1:5010/"+route;
    final String basicAuth='Basic '+base64Encode(utf8.encode('$username:$password'));
    final response= await http.get(
        Uri.parse(baseUrl),
        headers: {HttpHeaders.authorizationHeader:basicAuth}
    );
    // iterate over the list and map each object in list to Img by calling Img.fromJson
    if(response.statusCode==200){
      return json.decode(response.body) as List;
    }
  }
}