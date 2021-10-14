import 'package:geolocator/geolocator.dart';
import 'package:k_taxi/features/user/data/models/user_model.dart';
import 'package:geocoding/geocoding.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getUserPosition();
}

class FirebaseUserRemoteDataSource extends UserRemoteDataSource {
  @override
  Future<UserModel> getUserPosition() async {
    final position = await Geolocator.getCurrentPosition();
    final placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    final placemark = placemarks[0];

    final formattedAddress = '${placemark.locality},${placemark.country}';
    print('formattedAddress -> $formattedAddress');

    return UserModel(position: position);
  }
}
