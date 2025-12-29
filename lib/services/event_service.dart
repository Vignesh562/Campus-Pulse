import 'package:supabase_flutter/supabase_flutter.dart';

class EventService {
  EventService._();                     // private constructor
  static final EventService instance = EventService._();

  final supabase = Supabase.instance.client;

  List<Map<String, dynamic>> _cache = [];
  bool _loaded = false;

  Future<List<Map<String, dynamic>>> getEvents() async {
    if (_loaded) return _cache;         // <- returns cached data

    final response = await supabase
        .from('event_details')
        .select('*');

    _cache = List<Map<String, dynamic>>.from(response);
    _loaded = true;

    return _cache;
  }

  // Optional: refresh if you ever need pull-to-refresh
  Future<List<Map<String, dynamic>>> refresh() async {
    final response = await supabase
        .from('event_details')
        .select('*');

    _cache = List<Map<String, dynamic>>.from(response);
    _loaded = true;

    return _cache;
  }
}
