
class ItemsData {
  final String imagePath;
  final String text;

  ItemsData({required this.imagePath, required this.text});
}

class Item {
  final String imagePath;
  final String title;
  final String description;
  final String alcoholContent;
  final String price;

  Item({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.alcoholContent,
    required this.price,
  });
}