import 'package:healthycare/data/model/song.dart';
import 'package:healthycare/data/source/source.dart';

abstract interface class Repository {
  Future<List<Song>?> loadData();
}

class DefaultRepository implements Repository {
  final _localDataSource = LocalDataSource();
  final _remoteDataSource = RemoteDataSource();

  @override
  Future<List<Song>?> loadData() async {
    List<Song> songs = [];
    await _remoteDataSource.loadData().then(
      (remoteSongs) => {
        if (remoteSongs != null)
          {songs.addAll(remoteSongs)}
        else
          {
            _localDataSource.loadData().then(
              (localSongs) => {
                if (localSongs != null) {songs.addAll(localSongs)},
              },
            ),
          },
      },
    );
    return songs;
  }
}
