class EventDetailsModel {
  final String imgUrl;
  final String name;
  final String tagline;
  final String date;
  final String time;
  final String location;
  final String fullLocation;
  final String about;
  final String category;

  final Performer performer;
  final List<AgendaItem> agenda;

  EventDetailsModel({
    required this.imgUrl,
    required this.name,
    required this.tagline,
    required this.date,
    required this.time,
    required this.location,
    required this.fullLocation,
    required this.about,
    required this.performer,
    required this.agenda,
    required this.category,
  });
}

class Performer {
  final String svgAsset;
  final String name;
  final String role;

  Performer({required this.svgAsset, required this.name, required this.role});
}

class AgendaItem {
  final String time;
  final String title;
  final String description;

  AgendaItem({
    required this.time,
    required this.title,
    required this.description,
  });
}
