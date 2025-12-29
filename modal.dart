// import 'package:campuspulse/common/widgets/pulse_tag.dart';
// import 'package:campuspulse/common/widgets/glass_card.dart';
// import 'package:campuspulse/common/widgets/gradient_background.dart';
// import 'package:campuspulse/common/widgets/pulse_appbar.dart';
// import 'package:campuspulse/common/widgets/shadow_container.dart';
// import 'package:campuspulse/screens/event_details/widgets/event_button.dart';
// import 'package:campuspulse/utils/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:qr_flutter/qr_flutter.dart';
//
// import '../../utils/constants/pulse_colors.dart';
//
// class MyTicketScreen extends StatefulWidget {
//   const MyTicketScreen({super.key});
//
//   @override
//   State<MyTicketScreen> createState() => _MyTicketScreenState();
// }
//
// class _MyTicketScreenState extends State<MyTicketScreen> {
//   /// Replace this later with Firestore / API results
//
//
//   Future<void> fetchMyTickets () async{
//     try{
//
//     } catch (e){
//       print(e);
//     }finally{
//
//     }
//
//   }
//
//   final List<Map<String, dynamic>> tickets = [
//     {
//       "name": "Neon Night Music Fest",
//       "confirmed": true,
//       "qr": "neon-123",
//     },
//     {
//       "name": "Tech Innovators Meetup",
//       "confirmed": false,
//       "qr": "tech-456",
//     },
//     {
//       "name": "Sports Day 2025",
//       "confirmed": true,
//       "qr": "sports-789",
//     },
//   ];
//
//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     appBar: const PulseAppBar(title: "My Tickets"),
//   //
//   //     body: ListView.separated(
//   //       itemCount: tickets.length,
//   //       separatorBuilder: (context, index) => Utils.spacePulse(),
//   //
//   //       itemBuilder: (context, index) {
//   //         final ticket = tickets[index];
//   //         final bool isConfirmed = ticket["confirmed"];
//   //
//   //         return GestureDetector(
//   //           onTap: () {
//   //             /// SAME QR UI IN MODAL (kept for share)
//   //             showModalBottomSheet(
//   //               context: context,
//   //               shape: const RoundedRectangleBorder(
//   //                 borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//   //               ),
//   //               backgroundColor: Colors.white,
//   //               builder: (context) {
//   //                 return _qrView(ticket["qr"], ticket["confirmed"]);
//   //               },
//   //             );
//   //           },
//
//             // child : Tickets(
//             //   eventName: event['name'],
//             //   date: Utils.formatDate(event['date']),
//             //   time: Utils.formatTime(event['time']),
//             //   location: event['location'],
//             //   confirm: getTicket,
//             // ),
//
//           );
//         },
//       ),
//     );
//   }
//
//   /// Reusable QR widget (same UI everywhere)
//   // Widget _qrView(String data, bool confirmed) {
//   //   return
//   //     GradientBackground(
//   //     child: Column(
//   //       mainAxisSize: MainAxisSize.min,
//   //       children: [
//   //         Padding(
//   //           padding: Utils.screenPadding(vertical: 15),
//   //           child: GlassCard(
//   //             child: Column(
//   //               spacing: 10,
//   //               children: [
//   //                 PulseTag(
//   //                   color: confirmed ? PulseColors.green : PulseColors.red,
//   //                   text: confirmed ? "CONFIRMED" : "CANCELLED",
//   //                 ),
//   //
//   //                 Padding(
//   //                   padding: const EdgeInsets.all(10),
//   //                   child: ShadowContainer(
//   //                     color: confirmed
//   //                         ? PulseColors.green
//   //                         : PulseColors.red,
//   //                     child: GlassCard(
//   //                       child: Center(
//   //                         child: QrImageView(
//   //                           data: data,
//   //                           version: QrVersions.auto,
//   //                           size: 250,
//   //                         ),
//   //                       ),
//   //                     ),
//   //                   ),
//   //                 ),
//   //               ],
//   //             ),
//   //           ),
//   //         ),
//   //
//   //         SizedBox(
//   //           width: 400,
//   //           child: EventButton(
//   //             text: 'Share Ticket',
//   //             icon: FontAwesomeIcons.shareNodes,
//   //             txtColor: PulseColors.blue,
//   //             iconColor: PulseColors.blue,
//   //           ),
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }
// }
