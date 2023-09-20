import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertmdb/data/models/wrappers/api_exception.dart';
import 'package:fluttertmdb/data/utils/api_utils.dart';
import 'package:fluttertmdb/data/utils/dio_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fluttertmdb/common/get_it_module.dart' as get_it;

class ApiClientMock extends Mock implements ApiClient {}

void main() {
  late final ApiClient apiClient;

  setUpAll(() {
    unawaited(get_it.init());
    apiClient = get_it.getItInstance<ApiClient>();
  });

  test("Test if the client works", () async {
    final response = await apiClient.get(ApiUtils.getMoviesEndpoint);

    expect(response.statusCode, 200);
  });
}
