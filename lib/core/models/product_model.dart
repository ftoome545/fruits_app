import 'dart:io';
import 'package:fruits_hub/core/models/review_model.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final File image;
  final bool isFeatured;
  String? imageUrl;
  final bool isOrganic;
  final int expirationsMonths;
  final int numberOfCalories;
  final int unitAmount;
  final num avgRating;
  final num ratingCount = 0;
  final List<ReviewModel> review;
  final int sellingCount;

  ProductModel({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.image,
    required this.isFeatured,
    this.imageUrl,
    required this.expirationsMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.isOrganic,
    required this.review,
    required this.sellingCount,
    required this.avgRating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        name: json['name'],
        code: json['code'],
        description: json['description'],
        price: json['price'],
        image: json['image'],
        isFeatured: json['isFeatured'],
        expirationsMonths: json['expirationsMonths'],
        numberOfCalories: json['numberOfCalories'],
        unitAmount: json['unitAmount'],
        isOrganic: json['isOrganic'],
        review: json['review'] != null
            ? List<ReviewModel>.from(
                json['review'].map((e) => ReviewModel.fromJson(e)))
            : [],
        sellingCount: json['sellingCount'],
        avgRating: 0);
  }

  toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationsMonths': expirationsMonths,
      'numberOfCalories': numberOfCalories,
      'uniteAmount': unitAmount,
      'isOrganic': isOrganic,
      'review': review.map((e) => e.toJson()).toList(),
      'sellingCount': sellingCount,
    };
  }
}
