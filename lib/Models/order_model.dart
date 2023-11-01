import 'dart:ffi';

class Orders {
  final String order_id;
  final String ordered_at;
  final String status;

  Orders({
    required this.order_id,
    required this.ordered_at,
    required this.status,
  });

  factory Orders.fromJson(Map<String, dynamic> responseData) {
    return Orders(
      order_id: responseData['order_id'],
      ordered_at: responseData['ordered_at'],
      status: responseData['status'],
    );
  }
}

class Order {
  final String order_id;
  final String ordered_at;
  final String status;
  final String customer_name;
  final String contact_no;
  final String delivery_address;
  final String delivery_person;
  final String deliver_at;
  final Int payment_amount;
  final List medicines;
  final List images;

  Order({
    required this.order_id,
    required this.ordered_at,
    required this.status,
    required this.customer_name,
    required this.contact_no,
    required this.delivery_address,
    required this.delivery_person,
    required this.deliver_at,
    required this.payment_amount,
    required this.medicines,
    required this.images,
  });

  factory Order.fromJson(Map<String, dynamic> responseData) {
    return Order(
      order_id: responseData['order_id'],
      ordered_at: responseData['ordered_at'],
      status: responseData['status'],
      customer_name: responseData['customer_name'],
      contact_no: responseData['contact_no'],
      delivery_address: responseData['delivery_address'],
      delivery_person: responseData['delivery_person'],
      deliver_at: responseData['deliver_at'],
      payment_amount: responseData['payment_amount'],
      medicines: responseData['medicines'],
      images: responseData['images'],
    );
  }
}
