class Usersmodel {
  int id;
  String? name; // Allow null values
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  Usersmodel({
    required this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  factory Usersmodel.fromJson(Map<String, dynamic> json) {
    return Usersmodel(
      id: json['id'],
      name: json['name'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      address:
          json['address'] != null ? Address.fromJson(json['address']) : null,
      phone: json['phone'] as String?,
      website: json['website'] as String?,
      company:
          json['company'] != null ? Company.fromJson(json['company']) : null,
    );
  }
}

class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'] as String?,
      suite: json['suite'] as String?,
      city: json['city'] as String?,
      zipcode: json['zipcode'] as String?,
      geo: json['geo'] != null ? Geo.fromJson(json['geo']) : null,
    );
  }
}

class Geo {
  String? lat;
  String? lng;

  Geo({
    this.lat,
    this.lng,
  });

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
    );
  }
}

class Company {
  String? name;
  String? catchPhrase;
  String? bs;

  Company({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'] as String?,
      catchPhrase: json['catchPhrase'] as String?,
      bs: json['bs'] as String?,
    );
  }
}
