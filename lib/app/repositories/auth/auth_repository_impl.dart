// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dw9_delivery_app/app/core/exceptions/repository_exceptions.dart';
import 'package:dw9_delivery_app/app/core/exceptions/unauthorized_exceptions.dart';
import 'package:dw9_delivery_app/app/models/auth_model.dart';

import '../../core/rest_client/custom_dio.dart';
import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final CustomDio dio;
  AuthRepositoryImpl({
    required this.dio,
  });

  @override
  Future<AuthModel> login(String email, String password) async {
    try {
      final result = await dio.unauth().post('/auth', data: {
        'email': email,
        'password': password,
      });

      return AuthModel.fromMap(result.data);
    } on DioError catch (e, s) {
      if (e.response?.statusCode == 403) {
        log('login negado', error: e, stackTrace: s);
        throw UnauthorizedExceptions();
      }
      log('erro ao logar usuario', error: e, stackTrace: s);
      throw RepositoryExceptions(message: 'erro ao logar usuario');
    }
  }

  @override
  Future<void> register(String name, String email, String password) async {
    try {
      await dio.post('/users',
          data: {'name': name, 'email': email, 'password': password});
    } on DioError catch (e, s) {
      log('erro ao registrar o usuario', error: e, stackTrace: s);
      throw RepositoryExceptions(message: 'erro ao registrar usuario');
    }
  }
}
