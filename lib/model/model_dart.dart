class Book {
  final int id;
  final String title;
  final String description;
  final int totalPages;
  final double rating;
  final String publishedDate;
  final String authorName;
  final String? coverImageUrl;

  Book({
    required this.id,
    required this.title,
    required this.description,
    required this.totalPages,
    required this.rating,
    required this.publishedDate,
    required this.authorName,
    this.coverImageUrl,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      totalPages: json['total_pages'],
      rating: (json['rating'] ?? 0).toDouble(),
      publishedDate: json['published_date'],
      authorName: json['author_name'],
      coverImageUrl: json['cover_image_url'],
    );
  }
}
