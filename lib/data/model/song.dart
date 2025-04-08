class Song {
  String id;
  String title;
  String artist;
  String album;
  String source;
  String image;
  int duration;

  factory Song.fromJson(Map<String, dynamic> map) => Song(
    id: map["id"],
    title: map["title"],
    artist: map["artist"],
    album: map["album"],
    source: map["source"],
    image: map["image"],
    duration: map["duration"],
  );

  Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.source,
    required this.image,
    required this.duration,
  });

  @override
  bool operator ==(Object other) => other is Song && other.id == id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() =>
      'Song(id: $id, title: $title, artist: $artist, album: $album, source: $source, image: $image, duration: $duration)';
}
