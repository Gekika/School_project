// market_update.dart
class MarketUpdate {
  final String symbol;
  final double price;
  final double change;
  final DateTime timestamp;

  MarketUpdate({
    required this.symbol,
    required this.price,
    required this.change,
    required this.timestamp,
  });
}
