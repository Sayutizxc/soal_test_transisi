import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../providers/flutter_secure_storage_provider.dart';

const _tokenKey = 'token-login';

final tokenRepositoryProvider = Provider.autoDispose<TokenRepository>((ref) {
  return TokenRepositoryImpl(
    storage: ref.watch(flutterSecureStorageProvider),
  );
});

abstract class TokenRepository {
  late FlutterSecureStorage storage;
  Future<void> addToken({required String token});
  Future<void> removeToken();
  Future<bool> hasToken();
}

class TokenRepositoryImpl implements TokenRepository {
  @override
  FlutterSecureStorage storage;
  TokenRepositoryImpl({
    required this.storage,
  });

  @override
  Future<void> addToken({required String token}) async {
    await storage.write(key: _tokenKey, value: token);
  }

  @override
  Future<bool> hasToken() async {
    final result = await storage.read(key: _tokenKey);
    return result != null;
  }

  @override
  Future<void> removeToken() async {
    await storage.delete(key: _tokenKey);
  }
}
