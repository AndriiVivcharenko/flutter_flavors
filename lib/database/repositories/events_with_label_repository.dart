import 'package:drift/drift.dart';
import 'package:flutter_flavors/common/event_with_label/event_with_label.dart';
import 'package:flutter_flavors/database/repositories/base_repository.dart';

class EventsWithLabelRepository extends BaseRepository<EventWithLabel> {
  EventsWithLabelRepository({required super.database});

  @override
  Future<EventWithLabel?> create(EventWithLabel domain) async {
    try {
      final res =
          await (database.eventWithLabelEntity.insert().insert(domain.toDrift(
                create: true,
              )));
      return get(res);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<EventWithLabel?> delete(EventWithLabel domain) async {
    try {
      final res = await (database.eventWithLabelEntity.delete()
            ..where((tbl) => tbl.id.equals(domain.id as int)))
          .go();
      return get(res);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<EventWithLabel?> get(int id) async {
    try {
      final res = await (database.eventWithLabelEntity.select()
            ..where((tbl) => tbl.id.equals(id)))
          .getSingle();

      return EventWithLabel.fromDrift(res);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<EventWithLabel>> getAll() async {
    try {
      final res = await (database.eventWithLabelEntity.select()).get();
      return res.map((e) => EventWithLabel.fromDrift(e)).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<EventWithLabel?> update(EventWithLabel domain) async {
    try {
      final res = await (database.eventWithLabelEntity.update()
            ..where((tbl) => tbl.id.equals(domain.id as int)))
          .write(domain.toDrift(update: true));
      return get(res);
    } catch (e) {
      return null;
    }
  }
}
