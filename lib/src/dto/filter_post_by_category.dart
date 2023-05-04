class FilterPostByCategory {
  int category_id;
  int order_type;

  FilterPostByCategory({required this.category_id, required this.order_type});
  Map<String, dynamic> toJson() => {
        "category_id": category_id,
        "order_type": order_type,
      };
}
