import 'dart:convert';

import 'package:clean_architecture_app_2/api/urls.dart';
import 'package:clean_architecture_app_2/core/error/exceptions.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  Future<bool> login({required String user, required String pass});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<bool> login({required String user, required String pass}) async {
    Uri url = Uri.parse('${URLs.base}/login');
    final response = await client.post(
      url,
      headers: {
        'Accept': 'application/json'
      },
      body: {
        'email': user,
        'password': pass 
      } 
    ).timeout(const Duration(seconds: 3));

    if(response.statusCode==200) {
      debugPrint('Login Berhasil');
      return true;
    } else if (response.statusCode==401) {
      debugPrint('Login Gagal');
      Map body = jsonDecode(response.body);
      throw NotFoundException(body['message']);
    } else {
      debugPrint('error server ${response.statusCode}');
      throw ServerException();
    }
  }
  
}