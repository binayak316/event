List<EventModel> eventsFromJson(List<dynamic> eventsModel) =>
    List<EventModel>.from(
        eventsModel.map((eventModel) => EventModel.fromJson(eventModel)));

class EventModel {
  int? id;
  String? eventTitle;
  String? description;
  String? thumbnail;
  String? eventDate;
  String? eventTime;
  String? organizerId;
  String? totalSeats;
  String? totalVipSeats;
  String? totalPublicSeats;
  // String? totalAvailableVipSeats;
  // String? totalAvailablePublicSeats;
  String? vipSeatsPrice;
  String? publicSeatsPrice;
  String? location;
  // List<PaymentModel>? paymentModel;

  EventModel({
    this.id,
    this.eventTitle,
    this.description,
    this.thumbnail,
    this.eventDate,
    this.eventTime,
    this.organizerId,
    this.totalSeats,
    this.totalVipSeats,
    this.totalPublicSeats,
    // this.totalAvailableVipSeats,
    // this.totalAvailablePublicSeats,
    this.vipSeatsPrice,
    this.publicSeatsPrice,
    this.location,
    // this.paymentModel,
  });

  EventModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventTitle = json['event_title'];
    description = json['description'];
    thumbnail = json['thumbnail'];
    eventDate = json['event_date'].toString();
    eventTime = json['event_time'].toString();
    organizerId = json['organizer_id'].toString();
    totalSeats = json['total_seats'].toString();
    totalVipSeats = json['total_vip_seats'].toString();
    totalPublicSeats = json['total_public_seats'].toString();
    // totalAvailableVipSeats = json['total_available_vip_seats'];
    // totalAvailablePublicSeats = json['total_available_public_seats'];
    vipSeatsPrice = json['vip_seats_price'].toString();
    publicSeatsPrice = json['public_seats_price'].toString();
    location = json['location'];

    // if (json['book_events'] != null) {
    //   paymentModel = paymentEventsFromJson(json['book_events']);
    // } else {
    //   paymentModel = [];
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['event_title'] = this.eventTitle;
    data['description'] = this.description;
    data['thumbnail'] = this.thumbnail;
    data['event_date'] = this.eventDate;
    data['event_time'] = this.eventTime;
    data['organizer_id'] = this.organizerId;
    data['total_seats'] = this.totalSeats;
    data['total_vip_seats'] = this.totalVipSeats;
    data['total_public_seats'] = this.totalPublicSeats;
    // data['total_available_vip_seats'] = this.totalAvailableVipSeats;
    // data['total_available_public_seats'] = this.totalAvailablePublicSeats;
    data['vip_seats_price'] = this.vipSeatsPrice;
    data['public_seats_price'] = this.publicSeatsPrice;
    data['location'] = this.location;

    // if (paymentModel != null) {
    //   data['book_events'] = paymentModel!.map((v) => v).toList();
    // }
    return data;
  }
}
