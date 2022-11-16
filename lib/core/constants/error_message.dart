class ErrorMessage {
  const ErrorMessage._();

  static const String error400 = 'Server tidak dapat memproses permintaan';
  static const String error401 = 'Sesi telah berakhir';
  static const String error404 = 'Data tidak ditemukan';
  static const String error500 = 'Terjadi masalah pada server';
  static const String formatException = 'Data yang diterima tidak sesuai';
  static const String unknownException = 'Terjadi kesalahan';
  static const String noInternetConnection = 'Tidak ada koneksi internet';
  static const String loginError = 'Akun tidak sesuai';
}
