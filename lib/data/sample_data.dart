import 'package:campuspulse/models/event_details_model.dart';

final EventDetailsModel sampleData = EventDetailsModel(
  name: 'Neon Night Music Fest',
  tagline: 'Feel the beat under the lights',
  fullLocation: 'Student Union Club, Block A, Campus',
  about: 'A night filled with live performances, DJs, and electrifying vibes.',
  performer: Performer(
    svgAsset: 'assets/svg/dj.svg',
    name: 'DJ Raven',
    role: 'Headline Performer',
  ),
  agenda: [
    AgendaItem(
      time: '06:00 PM',
      title: 'Opening Ceremony',
      description: 'Welcome and introduction.',
    ),
    AgendaItem(
      time: '07:00 PM',
      title: 'Band Performance',
      description: 'Live rock band show.',
    ),
    AgendaItem(
      time: '09:00 PM',
      title: 'DJ Night',
      description: 'Non-stop music and lights.',
    ),
  ],
  imgUrl:
      "https://images.unsplash.com/photo-1516450360452-9312f5e86fc7?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  time: '10:00 PM',
  location: 'Main Stage',
  date: '21 dec',
  category: 'Professional',
);
