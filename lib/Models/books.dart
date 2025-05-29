class Book {
  final int id;
  final String title;
  final String imageUrl;

  Book({required this.id, required this.title, required this.imageUrl});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      imageUrl: json['cover_image_url'] ?? '',
    );
  }
}