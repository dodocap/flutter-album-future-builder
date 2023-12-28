class Photo {
  int id;
  String title;
  String url;
  String thumbnailUrl;

  Photo({
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  @override
  String toString() {
    return 'Photo{id: $id, title: $title, url: $url, thumbnailUrl: $thumbnailUrl}';
  }
}