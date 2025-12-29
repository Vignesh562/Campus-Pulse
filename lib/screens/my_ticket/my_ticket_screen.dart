import 'package:campuspulse/common/widgets/gradient_background.dart';
import 'package:campuspulse/common/widgets/pulse_appbar.dart';
import 'package:campuspulse/screens/home/widgets/loading_screen.dart';
import 'package:campuspulse/screens/my_ticket/widgets/no_tickets.dart';
import 'package:campuspulse/screens/my_ticket/widgets/tickets.dart';
import 'package:campuspulse/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../common/widgets/glass_card.dart';
import '../../common/widgets/pulse_tag.dart';
import '../../common/widgets/shadow_container.dart';
import '../../utils/constants/pulse_colors.dart';
import '../event_details/widgets/event_button.dart';

class MyTicketScreen extends StatefulWidget {
  const MyTicketScreen({super.key});

  @override
  State<MyTicketScreen> createState() => _MyTicketScreenState();
}

class _MyTicketScreenState extends State<MyTicketScreen> {
  final supabase = Supabase.instance.client;

  /// Fetch all tickets with event details one by one
  Future<List<Map<String, dynamic>>> fetchMyTickets() async {
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) return [];

    try {
      final userTickets = await supabase
          .from('user_details')
          .select('confirmed_tickets, cancelled_tickets')
          .eq('id', userId)
          .single();

      final confirmed = (userTickets['confirmed_tickets'] ?? []) as List;
      final cancelled = (userTickets['cancelled_tickets'] ?? []) as List;

      final allTickets = [...confirmed.map((t) => {'event_id': t['event_id'], 'confirmed': true})];

      allTickets.addAll(cancelled.map((t) => {'event_id': t['event_id'], 'confirmed': false}));

      List<Map<String, dynamic>> ticketsWithDetails = [];

      // Fetch each event one by one
      for (final t in allTickets) {
        final eventId = t['event_id'];
        final eventData = await supabase
            .from('event_details')
            .select('id, name, date, time, location, category')
            .eq('id', eventId)
            .maybeSingle();

        if (eventData != null) {
          ticketsWithDetails.add({
            'id': eventData['id'],
            'name': eventData['name'],
            'date': eventData['date'],
            'time': eventData['time'],
            'location': eventData['location'],
            'category': eventData['category'],
            'confirmed': t['confirmed'],
          });
        }
      }

      return ticketsWithDetails;
    } catch (e) {
      debugPrint('Error fetching tickets: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PulseAppBar(title: 'My Tickets'),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchMyTickets(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final myTickets = snapshot.data ?? [];

          if (myTickets.isEmpty) {
            return NoTickets();
          }

          return ListView.separated(
            separatorBuilder: (_, __) => Utils.spacePulse(),
            itemCount: myTickets.length,
            itemBuilder: (context, index) {
              final t = myTickets[index];

              return GestureDetector(
                child: Tickets(
                  eventName: t['name'],
                  date: Utils.formatDate(t['date']),
                  time: Utils.formatTime(t['time']),
                  location: t['location'],
                  confirm: t['confirmed'],
                ),
                onTap:(){
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                    ),
                    backgroundColor: Colors.white,
                    builder: (_) {
                      return
                        GradientBackground(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: Utils.screenPadding(vertical: 15),
                                child: GlassCard(
                                  child: Column(
                                    spacing: 10,
                                    children: [
                                      PulseTag(
                                        color: t['confirmed'] ? PulseColors.green : PulseColors.red,
                                        text: t['confirmed'] ? "CONFIRMED" : "CANCELLED",
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: ShadowContainer(
                                          color: t['confirmed']
                                              ? PulseColors.green
                                              : PulseColors.red,
                                          child: GlassCard(
                                            child: Center(
                                              child: QrImageView(
                                                data: 'IT',
                                                version: QrVersions.auto,
                                                size: 250,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              SizedBox(
                                width: 400,
                                child: EventButton(
                                  text: 'Share Ticket',
                                  icon: FontAwesomeIcons.shareNodes,
                                  txtColor: PulseColors.blue,
                                  iconColor: PulseColors.blue,
                                ),
                              ),
                            ],
                          ),
                        );
                    },
                  );
                }
              );
            },
          );
        },
      ),
    );
  }
}
