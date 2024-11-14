import 'package:no_broker_demo/shared/extension.dart';

class LandDetails {
  String? landName;
  String? location;
  String? price;
  String? owner;
  String? areaUnit;
  String? areaSize;
  String? purpose;
  String? parking;
  String? fullLocation;

  LandDetails({
    this.landName,
    this.location,
    this.price,
    this.owner,
    this.areaUnit,
    this.areaSize,
    this.purpose,
    this.parking,
    this.fullLocation,
  });

  LandDetails.fromJson(Map<String, dynamic> json)
      : this(
          landName: json.hasProp('landname') ? json['landname'] as String : '',
    areaSize: json.hasProp('areasize') ? json['areasize'] as String : '',
          location: json.hasProp('location') ? json['location'] as String : '',
          price: json.hasProp('price') ? json['price'] as String : '',
          owner: json.hasProp('owner') ? json['owner'] as String : '',
          fullLocation: json.hasProp('fulllocation')
              ? json['fulllocation'] as String
              : '',
    areaUnit: json.hasProp('areaunit') ? json['areaunit'] as String : '',
    parking: json.hasProp('parking') ? json['parking'] as String : '',
          purpose: json.hasProp('purpose') ? json['purpose'] as String : '',
        );

  Map<String, dynamic> toJson() => {
        'landname': landName,
        'location': location,
        'fulllocation': fullLocation,
    'purpose': purpose,
        'price': price,
    'parking': parking,
    'owner': owner,
        'areasize': areaSize,
        'areaunit': areaUnit
      };
}
