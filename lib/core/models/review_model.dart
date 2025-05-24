import 'package:fruits_hub/core/entities/review_entity.dart';

class ReviewModel {
  final String name;
  final String image;
  final String reviewDescripation;
  final num rating;
  final String date;

  ReviewModel(
      {required this.name,
      required this.image,
      required this.reviewDescripation,
      required this.rating,
      required this.date});

  factory ReviewModel.fromEntity(ReviewEntity reviewEntity) {
    return ReviewModel(
        name: reviewEntity.name,
        image: reviewEntity.image,
        reviewDescripation: reviewEntity.reviewDescripation,
        rating: reviewEntity.rating,
        date: reviewEntity.date);
  }

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
        name: json['name'],
        image: json['image'],
        reviewDescripation: json['reviewDescripation'],
        rating: json['rating'],
        date: json['date']);
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'reviewDescripation': reviewDescripation,
      'rating': rating,
      'date': date,
    };
  }
}
