class ExternalReview {
  final Map<String, dynamic> authorDetails;
  final String content;
  final String createdAt;

  const ExternalReview({
    required this.authorDetails,
    required this.content,
    required this.createdAt,
  });

  factory ExternalReview.fromJson(Map<String, dynamic> json) {
    return ExternalReview(
      authorDetails: json['author_details'],
      content: json['content'],
      createdAt: json['created_at'],
    );
  }
}
