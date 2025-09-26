class AddressModel {
  String location;
  String region;
  String city;

  AddressModel({
    required this.location,
    required this.region,
    required this.city,
  });

  Map<String, dynamic> toJson() => {
        'location': location,
        'region': region,
        'city': city,
      };

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      location: json['location'],
      region: json['region'],
      city: json['city'],
    );
  }
}
