import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soal_test_transisi/core/repositories/token_repository.dart';

final tokenProvider = StateNotifierProvider<TokenNotifier, bool?>((ref) {
  return TokenNotifier(ref);
});

class TokenNotifier extends StateNotifier<bool?> {
  TokenNotifier(this.ref) : super(null);

  final Ref ref;
  Future<bool> hasToken() async {
    return await ref.read(tokenRepositoryProvider).hasToken();
  }

  Future<void> addToken({required String token}) async {
    await ref.read(tokenRepositoryProvider).addToken(token: token);
  }

  Future<void> removeToken() async {
    await ref.read(tokenRepositoryProvider).removeToken();
  }
}
