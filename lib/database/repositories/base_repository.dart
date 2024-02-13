import 'package:flutter_flavors/database/app_database.dart';

abstract class BaseRepository<TDomain> {
  final AppDatabase database;

  Future<TDomain?> get(int id);

  Future<TDomain?> create(TDomain domain);

  Future<List<TDomain>> getAll();

  Future<TDomain?> update(TDomain domain);

  Future<TDomain?> delete(TDomain domain);

  const BaseRepository({
    required this.database,
  });
}
