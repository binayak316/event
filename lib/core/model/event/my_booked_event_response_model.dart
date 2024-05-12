List<MyBookedEventResponseModel> myBookedEventResponseModeleventsFromJson(
        List<dynamic> myBookedEventsModel) =>
    List<MyBookedEventResponseModel>.from(myBookedEventsModel.map(
        (myBookedEventModel) =>
            MyBookedEventResponseModel.fromJson(myBookedEventModel)));

class MyBookedEventResponseModel {
  int? id;
  String? userId;
  String? transactionCode;
  String? eventId;
  String? qty;
  String? ticketType;
  String? totalPrice;
  Event? event;

  MyBookedEventResponseModel(
      {this.id,
      this.userId,
      this.transactionCode,
      this.eventId,
      this.qty,
      this.ticketType,
      this.totalPrice,
      this.event});

  MyBookedEventResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    transactionCode = json['transaction_code'];
    eventId = json['event_id'];
    qty = json['qty'];
    ticketType = json['ticket_type'];
    totalPrice = json['total_price'];
    event = json['event'] != null ? new Event.fromJson(json['event']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['transaction_code'] = this.transactionCode;
    data['event_id'] = this.eventId;
    data['qty'] = this.qty;
    data['ticket_type'] = this.ticketType;
    data['total_price'] = this.totalPrice;
    if (this.event != null) {
      data['event'] = this.event!.toJson();
    }
    return data;
  }
}

class Event {
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
  String? totalAvailableVipSeats;
  String? totalAvailablePublicSeats;
  String? vipSeatsPrice;
  String? publicSeatsPrice;
  String? location;

  Event(
      {this.id,
      this.eventTitle,
      this.description,
      this.thumbnail,
      this.eventDate,
      this.eventTime,
      this.organizerId,
      this.totalSeats,
      this.totalVipSeats,
      this.totalPublicSeats,
      this.totalAvailableVipSeats,
      this.totalAvailablePublicSeats,
      this.vipSeatsPrice,
      this.publicSeatsPrice,
      this.location});

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventTitle = json['event_title'];
    description = json['description'];
    thumbnail = json['thumbnail'];
    eventDate = json['event_date'];
    eventTime = json['event_time'];
    organizerId = json['organizer_id'];
    totalSeats = json['total_seats'];
    totalVipSeats = json['total_vip_seats'];
    totalPublicSeats = json['total_public_seats'];
    totalAvailableVipSeats = json['total_available_vip_seats'];
    totalAvailablePublicSeats = json['total_available_public_seats'];
    vipSeatsPrice = json['vip_seats_price'];
    publicSeatsPrice = json['public_seats_price'];
    location = json['location'];
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
    data['total_available_vip_seats'] = this.totalAvailableVipSeats;
    data['total_available_public_seats'] = this.totalAvailablePublicSeats;
    data['vip_seats_price'] = this.vipSeatsPrice;
    data['public_seats_price'] = this.publicSeatsPrice;
    data['location'] = this.location;
    return data;
  }
}
