List<PaymentModel> paymentEventsFromJson(List<dynamic> paymentEventsModel) =>
    List<PaymentModel>.from(paymentEventsModel
        .map((paymentEventModel) => PaymentModel.fromJson(paymentEventModel)));

class PaymentModel {
  int? id;
  int? userId;
  String? transactionCode;
  int? eventId;
  int? qty;
  String? ticketType;
  String? totalPrice;
  String? status;
  String? createdAt;
  String? updatedAt;

  PaymentModel(
      {this.id,
      this.userId,
      this.transactionCode,
      this.eventId,
      this.qty,
      this.ticketType,
      this.totalPrice,
      this.status,
      this.createdAt,
      this.updatedAt});

  PaymentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    transactionCode = json['transaction_code'];
    eventId = json['event_id'];
    qty = json['qty'];
    ticketType = json['ticket_type'];
    totalPrice = json['total_price'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
