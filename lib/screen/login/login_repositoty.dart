import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/base/base.dart';
import 'package:flutter_bloc_architecture/model/otp_response.dart';
import 'package:flutter_bloc_architecture/utils/api_constants.dart';

class LoginRepository extends BaseRepository {
  /// Send otp api call
  Future<OTPResponse> callSendOtpApi(String mobile) async {
    try {
      var response = await super.getDio().post(
            ApiConstants.SEND_OTP,
            data: {ApiConstants.PARAM_VMOBILE: mobile},
            options: Options(contentType: Headers.formUrlEncodedContentType),
          );
      return Future.value(OTPResponse.fromJson(response.data));
    } on DioError catch (e) {
      return Future.error(e);
    }
  }

  Future<String> authenticate({
    @required String? username,
    @required String? password,
  }) async {
    await Future.delayed(Duration(seconds: 1));
    return 'token';
  }

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    await Future.delayed(Duration(seconds: 2));
    return Random().nextBool();
  }
}
