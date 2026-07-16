class OrderModel {
  final String orderId;
  final String productName;
  final String farmerName;
  final double totalPrice;
  final int quantity;
  final String status;

  OrderModel({
    required this.orderId,
    required this.productName,
    required this.farmerName,
    required this.totalPrice,
    required this.quantity,
    required this.status,
  });
}