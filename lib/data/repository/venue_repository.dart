import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_my_event/config/app_logger.dart';
import 'package:flutter_my_event/data/model/response/venue_list_dto_response.dart';

class VenueRepository {
  final _logger = AppLogger.getLogger("VenueRepository");

  Future<VenueListDtoResponse> getVenueList() async {
    _logger.debug("getVenueList");
    final response = await rootBundle.loadString('assets/json/venue_list.json');
    final VenueListDtoResponse venueListDtoResponse =
        VenueListDtoResponse.fromJson(jsonDecode(response));
    return venueListDtoResponse;
  }
}
