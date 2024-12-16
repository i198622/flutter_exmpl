import 'package:equatable/equatable.dart';

import '../../data/models/auth_model.dart';

class TokenInfoEntity extends Equatable {
  final String refreshToken;
  final String accessToken;

  const TokenInfoEntity({
    required this.accessToken,
    required this.refreshToken,
  });

  @override
  List<Object?> get props => [
        accessToken,
        refreshToken,
      ];
}

extension TokenInfoMapper on LoginResponseModel {
  TokenInfoEntity toEntity() {
    return TokenInfoEntity(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }
}
