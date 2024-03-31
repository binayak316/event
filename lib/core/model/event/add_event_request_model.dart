class AddEventRequestParams {
  String? eventTitle;
  String? description;
  String? eventDate;
  String? eventTime;
  String? location;
  String? thumbnail;
  String? totalSeats;
  String? totalVipSeats;
  String? totalPublicSeats;
  String? vipSeatsPrice;
  String? publicSeatsPrice;
  String? evetType;

  AddEventRequestParams(
      {this.eventTitle,
      this.description,
      this.eventDate,
      this.eventTime,
      this.location,
      this.thumbnail,
      this.totalSeats,
      this.totalVipSeats,
      this.totalPublicSeats,
      this.vipSeatsPrice,
      this.evetType,
      this.publicSeatsPrice});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event_title'] = this.eventTitle;
    data['description'] = this.description;
    data['event_date'] = this.eventDate;
    data['event_time'] = this.eventTime;
    data['location'] = this.location;
    data['thumbnail'] = this.thumbnail;
    data['total_seats'] = this.totalSeats;
    data['total_vip_seats'] = this.totalVipSeats;
    data['total_public_seats'] = this.totalPublicSeats;
    data['vip_seats_price'] = this.vipSeatsPrice;
    data['public_seats_price'] = this.publicSeatsPrice;
    data['event_type'] = this.evetType;

    return data;
  }
}
