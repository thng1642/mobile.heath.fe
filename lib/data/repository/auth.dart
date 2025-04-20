import 'package:healthycare/data/model/song.dart';
import 'package:healthycare/data/source/auth.dart';
import 'package:healthycare/data/source/source.dart';

abstract interface class Repository {
  Future<bool> login(String username, String password);
}

class AuthRepository implements Repository {
  final _remoteDataSource = RemoteAuthSource();

  @override
  Future<bool> login(String username, String password) async {
    return await _remoteDataSource.login(username, password);
  }
}
