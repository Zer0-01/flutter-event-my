import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_my_event/config/app_logger.dart';
import 'package:flutter_my_event/data/model/response/catering_list_dto_response.dart';

class CateringRepository {
  final _logger = AppLogger.getLogger("CateringRepository");

  Future<CateringListDtoResponse> getCateringList() async {
    _logger.debug("getCateringList");
    final response = await rootBundle.loadString(
      'assets/json/catering_list.json',
    );
    final CateringListDtoResponse venueListDtoResponse =
        CateringListDtoResponse.fromJson(jsonDecode(response));
    return venueListDtoResponse;
  }
}
