import 'package:event/core/utils/constants/apis.dart';
import 'package:event/core/widgets/common/custom_text_style.dart';
import 'package:event/core/widgets/common/network_imge.dart';
import 'package:event/features/screens/booked_events/controller/booked_event_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookedEventDetailScreen extends StatelessWidget {
  static const String routeName = "/booked-event-detail";
  final c = Get.find<BookedEventDetailController>();
  BookedEventDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          c.event.value?.event?.eventTitle ?? "Event Detail",
          style: CustomTextStyles.f16W600(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {
                print("${Api.imageUrl}${c.event.value?.event?.thumbnail}");
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              c.event.value?.transactionCode != null
                  ? RichText(
                      text: TextSpan(
                          text: 'Transaction Code: ',
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                          children: <TextSpan>[
                            TextSpan(
                              text: c.event.value!.transactionCode!,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            )
                          ]),
                    )
                  : const SizedBox.shrink(),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  c.event.value?.qty != null
                      ? RichText(
                          text: TextSpan(
                              text: 'Quantity: ',
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                              children: <TextSpan>[
                                TextSpan(
                                  text: c.event.value!.qty!,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                )
                              ]),
                        )
                      : const SizedBox.shrink(),
                  c.event.value?.event?.location != null
                      ? RichText(
                          text: TextSpan(
                              text: 'Location: ',
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                              children: <TextSpan>[
                                TextSpan(
                                  text: c.event.value!.event!.location,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                )
                              ]),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              c.event.value?.ticketType != null
                  ? RichText(
                      text: TextSpan(
                          text: 'Ticket Type: ',
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                          children: <TextSpan>[
                            TextSpan(
                              text: c.event.value!.ticketType!,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            )
                          ]),
                    )
                  : const SizedBox.shrink(),
              const SizedBox(
                height: 5,
              ),
              c.event.value?.totalPrice != null
                  ? RichText(
                      text: TextSpan(
                          text: 'Total Price: ',
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Rs. ${c.event.value!.totalPrice!}",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            )
                          ]),
                    )
                  : const SizedBox.shrink(),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    c.event.value?.event?.eventTitle != null
                        ? RichText(
                            text: TextSpan(
                                text: 'Event Name: ',
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: c.event.value?.event?.eventTitle,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  )
                                ]),
                          )
                        : const SizedBox.shrink(),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        c.event.value?.event?.eventDate != null
                            ? RichText(
                                text: TextSpan(
                                    text: 'Event Date: ',
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: c.event.value?.event?.eventDate,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ]),
                              )
                            : const SizedBox.shrink(),
                        const SizedBox(
                          height: 5,
                        ),
                        c.event.value?.event?.eventDate != null
                            ? RichText(
                                text: TextSpan(
                                    text: 'Event Time: ',
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: c.event.value?.event?.eventTime,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ]),
                              )
                            : const SizedBox.shrink()
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SkyNetworkImage(
                        // imageUrl:
                        //     "${Api.imageUrl}${"/uploads/event/"}${c.event.value?.event?.thumbnail}",

                        imageUrl:
                            "${Api.imageUrl}${c.event.value?.event?.thumbnail}",

                        width: 200,
                        height: 200,
                        boxFit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    c.event.value?.event?.description != null
                        ? RichText(
                            text: TextSpan(
                                text: 'Description: ',
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: c.event.value?.event?.description,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  )
                                ]),
                          )
                        : const SizedBox.shrink(),
                    const SizedBox(
                      height: 5,
                    ),
                    c.event.value?.event?.totalSeats != null
                        ? RichText(
                            text: TextSpan(
                                text: 'TotalSeats: ',
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: c.event.value?.event?.totalSeats,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  )
                                ]),
                          )
                        : const SizedBox.shrink(),
                    const SizedBox(
                      height: 5,
                    ),
                    c.event.value?.event?.totalPublicSeats != null
                        ? RichText(
                            text: TextSpan(
                                text: 'Total Public Seats: ',
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        c.event.value?.event?.totalPublicSeats,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  )
                                ]),
                          )
                        : const SizedBox.shrink(),
                    const SizedBox(
                      height: 5,
                    ),
                    c.event.value?.event?.totalVipSeats != null
                        ? RichText(
                            text: TextSpan(
                                text: 'Total VIP Seats: ',
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: c.event.value?.event?.totalVipSeats,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  )
                                ]),
                          )
                        : const SizedBox.shrink(),
                    const SizedBox(
                      height: 5,
                    ),
                    c.event.value?.event?.totalAvailablePublicSeats != null
                        ? RichText(
                            text: TextSpan(
                                text: 'Total Public Available Seats: ',
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: c.event.value?.event
                                        ?.totalAvailablePublicSeats,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  )
                                ]),
                          )
                        : const SizedBox.shrink(),
                    const SizedBox(
                      height: 5,
                    ),
                    c.event.value?.event?.totalAvailableVipSeats != null
                        ? RichText(
                            text: TextSpan(
                                text: 'Total VIP Available Seats: ',
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: c.event.value?.event
                                        ?.totalAvailableVipSeats,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  )
                                ]),
                          )
                        : const SizedBox.shrink(),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
