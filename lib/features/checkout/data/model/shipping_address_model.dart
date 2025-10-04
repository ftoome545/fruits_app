import 'package:fruits_hub/features/checkout/domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  String? fullName;
  String? email;
  String? address;
  String? city;
  String? addressDetails;
  String? phone;

  ShippingAddressModel(
      {this.fullName,
      this.email,
      this.address,
      this.city,
      this.addressDetails,
      this.phone});

  @override
  String toString() {
    return '$address $addressDetails $city';
  }

  factory ShippingAddressModel.fromEntity(
      ShippingAddressEntity shippingAddressEntity) {
    return ShippingAddressModel(
      fullName: shippingAddressEntity.fullName,
      email: shippingAddressEntity.email,
      address: shippingAddressEntity.address,
      city: shippingAddressEntity.city,
      addressDetails: shippingAddressEntity.addressDetails,
      phone: shippingAddressEntity.phone,
    );
  }

  toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'address': address,
      'city': city,
      'addressDetails': addressDetails,
      'phone': phone,
    };
  }
}
