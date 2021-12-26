class Calculate {
  final int harga;
  final int jumlah;
  late int _total;
  Calculate({required this.harga, required this.jumlah});
// Calculate({required this.harga required this.jumlah});
  int calculateTotal() {
    _total = harga * jumlah;
    return _total;
  }
}
