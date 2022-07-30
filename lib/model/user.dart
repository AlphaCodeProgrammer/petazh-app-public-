class User {
  final String id;
  final String postalCode;
  final String address;
  final String city;
  final bool isMan;
  final String email;
  final double wallet;
  final List<dynamic> favoriteBarbers;
  final List<dynamic> favoriteModels;
  final List<dynamic> favoriteProducts;
  final List<dynamic> cart;
  final bool ban;
  final String userPhoto;
  final String referralCode;
  final String invitationCode;
  final String phone;
  final String username;
  final String password;

  const User({
    required this.id,
    required this.postalCode,
    required this.address,
    required this.city,
    required this.isMan,
    required this.email,
    required this.wallet,
    required this.favoriteBarbers,
    required this.favoriteModels,
    required this.favoriteProducts,
    required this.cart,
    required this.ban,
    required this.userPhoto,
    required this.referralCode,
    required this.invitationCode,
    required this.phone,
    required this.username,
    required this.password,
  });
}
