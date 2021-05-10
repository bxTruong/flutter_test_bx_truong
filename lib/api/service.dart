
import 'package:logger/logger.dart';

import 'api_const.dart';
import 'net_work.dart';

class Service {
  static Future<String> userRegister({
    String userName,
    String password,
  }) async {
    final response = await Network().post(
      baseUrl: ApiConst.BASE_URL,
      path: ApiConst.USER_REGISTER,
      data: {
        'gameId': ApiConst.GAME_ID,
        'userName': userName,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      String message = response.data['error']['message'];
      return message;
    } else {
      Logger().e('statusCode', response.statusCode);
      return '${response.statusMessage}';
    }
  }

  static Future<String> loginGuest({
    String deviceInfo,
  }) async {
    final response = await Network().post(
      baseUrl: ApiConst.BASE_URL,
      path: ApiConst.LOGIN_GUEST,
      data: {
        'gameId': ApiConst.GAME_ID,
        "guestId":ApiConst.GAME_ID,
        'appKey': ApiConst.APP_KEY,
        'deviceInfo': deviceInfo
      },
    );
    if (response.statusCode == 200) {
      String message = response.data['error']['message'];
      return message;
    } else {
      Logger().e('statusCode', response.statusCode);
      return '${response.statusMessage}';
    }
  }

  static Future<String> loginSKW({
    String userName,
    String password,
    String deviceInfo,
  }) async {
    final response = await Network().post(
      baseUrl: ApiConst.BASE_URL,
      path: ApiConst.LOGIN_SWK,
      data: {
        'gameId': ApiConst.GAME_ID,
        'userName': userName,
        'password': password,
        'appKey': ApiConst.APP_KEY,
        'deviceInfo': deviceInfo
      },
    );
    if (response.statusCode == 200) {
      String message = response.data['error']['message'];
      return message;
    } else {
      Logger().e('statusCode', response.statusCode);
      return '${response.statusMessage}';
    }
  }
}
