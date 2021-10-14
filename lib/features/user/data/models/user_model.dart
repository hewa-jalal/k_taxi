import 'package:geolocator/geolocator.dart';
import 'package:k_taxi/features/user/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final Position position;

  UserModel({
    required this.position,
  }) : super(
          position: position,
        );
}
