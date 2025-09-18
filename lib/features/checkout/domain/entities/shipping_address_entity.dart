class ShippingAddressEntity {
  final String fullName;
  final String email;
  final String address;
  final String city;
  final String addressDetails;
  final String phone;

  ShippingAddressEntity(
      {required this.fullName,
      required this.email,
      required this.address,
      required this.city,
      required this.addressDetails,
      required this.phone});
}
