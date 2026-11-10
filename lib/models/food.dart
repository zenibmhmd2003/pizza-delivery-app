class Food {
  final String name;
  final double price;
  final int calories;
  final String image;

  /// Optional bigger image used on the Item page. Falls back to [image].
  final String? detailImage;

  /// Size (width = height) of the image on the Item page.
  final double detailSize;
  final double rating;
  final String time;

  const Food({
    required this.name,
    required this.price,
    required this.calories,
    required this.image,
    this.detailImage,
    this.detailSize = 230,
    this.rating = 4.9,
    this.time = '20 - 30 min',
  });
}

const popularFoods = <Food>[
  Food(
    name: 'Melting Cheese',
    price: 9.47,
    calories: 44,
    image: 'assets/images/melting_cheese.png',
    detailImage: 'assets/images/melting_cheese2.png',
    detailSize: 260, // <-- Melting Cheese size on the Item page
  ),
  Food(
    name: 'Pizza Capricciosa',
    price: 12.55,
    calories: 54,
    image: 'assets/images/pizza_capricciosa.png',
    detailImage: 'assets/images/pizza_capricciosa2.png',
    detailSize: 230, // <-- Pizza Capricciosa size on the Item page
  ),
];