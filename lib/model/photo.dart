class Photo {
  String title;
  String url;
  String thumbnailUrl;

  Photo({
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  @override
  String toString() {
    return 'Photo{title: $title, url: $url, thumbnailUrl: $thumbnailUrl}';
  }
}