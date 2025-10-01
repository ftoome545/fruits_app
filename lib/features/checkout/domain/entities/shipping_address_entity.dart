class ShippingAddressEntity {
  String? fullName;
  String? email;
  String? address;
  String? city;
  String? addressDetails;
  String? phone;

  ShippingAddressEntity(
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
}
