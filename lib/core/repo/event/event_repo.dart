import 'dart:convert';

import 'package:event/core/model/category_model.dart';
import 'package:event/core/model/event/add_event_request_model.dart';
import 'package:event/core/model/event/event_model.dart';
import 'package:event/core/model/location_model.dart';
import 'package:event/core/utils/constants/apis.dart';
import 'package:event/core/utils/constants/messages.dart';
import 'package:event/core/utils/helpers/app_requests.dart';
import 'package:event/core/utils/helpers/log_helper.dart';
import 'package:http/http.dart' as http;

class EventRepo {
  static Future<void> getCategories({
    required Function(List<CategoryModel> events) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      String url = Api.getCategories;

      http.Response response = await AppRequest.get(
        url,
      );

      dynamic data = json.decode(response.body);

      if (data['status']) {
        // var msg = data['message'];
        var categories = categoriesFromJson(data['data']);
        onSuccess(categories);
      } else {
        onError(data['message']);
      }
    } catch (e, s) {
      LogHelper.error(Api.getCategories, error: e, stackTrace: s);
      onError(Messages.error);
    }
  }

  static Future<void> becomeOrganizer({
    required int userId,
    required Function(String message) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      String url = Api.becomeOrganizer;

      var body = {
        "id": userId,
      };

      http.Response response = await AppRequest.post(url, body: body);

      dynamic data = json.decode(response.body);

      print('--------------------$data');

      if (data['status']) {
        var msg = data['message'];
        onSuccess(msg);
      } else {
        onError(data['message']);
      }
    } catch (e, s) {
      LogHelper.error(Api.becomeOrganizer, error: e, stackTrace: s);
      onError(Messages.error);
    }
  }

  static Future<void> addEvent({
    required AddEventRequestParams addEventParams,
    required Function(String message) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      String url = Api.storeEvent;

      var body = addEventParams.toJson();

      http.Response response = await AppRequest.post(url, body: body);

      dynamic data = json.decode(response.body);

      if (data['status']) {
        var msg = data['message'];
        onSuccess(msg);
      } else {
        onError(data['message']);
      }
    } catch (e, s) {
      LogHelper.error(Api.storeEvent, error: e, stackTrace: s);
      onError(Messages.error);
    }
  }

  static Future<void> getAllEvents({
    required Function(List<EventModel> events) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      String url = Api.getAllEvents;

      http.Response response = await AppRequest.get(
        url,
      );

      dynamic data = json.decode(response.body);

      if (data['status']) {
        // var msg = data['message'];
        var events = eventsFromJson(data['data']);
        onSuccess(events);
      } else {
        onError(data['message']);
      }
    } catch (e, s) {
      LogHelper.error(Api.getAllEvents, error: e, stackTrace: s);
      onError(Messages.error);
    }
  }

  static Future<void> getEventDetails({
    required int eventId,
    required Function(EventModel event) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      String url = (Api.eventDetails.replaceAll("#id#", eventId.toString()));

      http.Response response = await AppRequest.get(
        url,
      );

      dynamic data = json.decode(response.body);

      if (data['status']) {
        // var msg = data['message'];
        var event = EventModel.fromJson(data['data']);
        onSuccess(event);
      } else {
        onError(data['message']);
      }
    } catch (e, s) {
      LogHelper.error(Api.eventDetails, error: e, stackTrace: s);
      onError(Messages.error);
    }
  }

  static Future<void> getPopularEvents({
    required Function(List<EventModel> events) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      String url = Api.getallevent;

      http.Response response = await AppRequest.get(
        url,
      );

      dynamic data = json.decode(response.body);

      if (data['status']) {
        // var msg = data['message'];
        var events = eventsFromJson(data['data']);
        onSuccess(events);
      } else {
        onError(data['message']);
      }
    } catch (e, s) {
      LogHelper.error(Api.getallevent, error: e, stackTrace: s);
      onError(Messages.error);
    }
  }

  static Future<void> getAllMyEvents({
    required Function(List<EventModel> events) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      String url = Api.myEvents;

      http.Response response = await AppRequest.get(
        url,
      );

      dynamic data = json.decode(response.body);

      if (data['status']) {
        // var msg = data['message'];
        var events = eventsFromJson(data['data']);
        onSuccess(events);
      } else {
        onError(data['message']);
      }
    } catch (e, s) {
      LogHelper.error(Api.myEvents, error: e, stackTrace: s);
      onError(Messages.error);
    }
  }

  static Future<void> getLocations({
    required Function(List<LocationModel> venues) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      String url = Api.getallvenue;

      http.Response response = await AppRequest.get(
        url,
      );

      dynamic data = json.decode(response.body);

      if (data['status']) {
        // var msg = data['message'];
        var venues = locationsFromJson(data['data']);
        onSuccess(venues);
      } else {
        onError(data['message']);
      }
    } catch (e, s) {
      LogHelper.error(Api.getallvenue, error: e, stackTrace: s);
      onError(Messages.error);
    }
  }
}
