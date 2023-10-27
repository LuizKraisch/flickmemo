class Review {
  final String uuid;
  final String score;
  final String note;
  final bool noteHasSpoilers;
  final bool favorite;
  final String createdAt;

  const Review({
    required this.uuid,
    required this.score,
    required this.note,
    required this.noteHasSpoilers,
    required this.favorite,
    required this.createdAt,
  });

  factory Review.fromJson(Map<String, dynamic>? json) {
    return Review(
      uuid: json?['uuid'] ?? '',
      score: json?['score'].toString() ?? '',
      note: json?['note'] ?? '',
      noteHasSpoilers: json?['note_has_spoilers'] ?? false,
      favorite: json?['favorite'] ?? false,
      createdAt: json?['created_at'] ?? '',
    );
  }
}
