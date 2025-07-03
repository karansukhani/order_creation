class OrderItem {
  String? selectedCategory;
  String? selectedProduct;
  int quantity;
  bool isExpanded;

  OrderItem({
    this.selectedCategory,
    this.selectedProduct,
    this.quantity = 1,
    this.isExpanded = true,
  });
}
