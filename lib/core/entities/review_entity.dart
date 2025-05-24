class ReviewEntity {
  final String name;
  final String image;
  final String reviewDescripation;
  final num rating;
  final String date;

  ReviewEntity(
      {required this.name,
      required this.image,
      required this.reviewDescripation,
      required this.rating,
      required this.date});
}
