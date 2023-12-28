class Album {
  int id;
  String title;

  Album({
    required this.id,
    required this.title,
  });

  @override
  String toString() {
    return 'Album{id: $id, title: $title}';
  }
}
