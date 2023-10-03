import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertmdb/data/utils/local_source_utils.dart';
import 'package:fluttertmdb/domain/models/user_model_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late UserModel user;

  setUpAll(() {
    user = UserModel();
  });

  test("Check logged in user success", () async {
    SharedPreferences.setMockInitialValues(<String, Object>{
      LocalSourceUtils.userSharedPrefsKey: json.encode(user)
    });

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    expect(prefs.getString(LocalSourceUtils.userSharedPrefsKey),
        json.encode(user));
  });

  test("Check logged in user failed", () async {
    SharedPreferences.setMockInitialValues(
        <String, Object>{"something": json.encode(user)});

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    expect(prefs.getString(LocalSourceUtils.userSharedPrefsKey), null);
  });
}
