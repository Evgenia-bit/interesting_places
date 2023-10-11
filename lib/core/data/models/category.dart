enum Category {
  hotel(name: 'Отель', iconPath: 'assets/icons/hotel.svg'),
  restaurant(name: 'Ресторан', iconPath: 'assets/icons/restourant.svg'),
  specialPlace(name: 'Особое место', iconPath: 'assets/icons/particular_place.svg'),
  park(name: 'Парк', iconPath: 'assets/icons/park.svg'),
  museum(name: 'Музей', iconPath: 'assets/icons/museum.svg'),
  cafe(name: 'Кафе', iconPath: 'assets/icons/cafe.svg');

  const Category({
    required this.name,
    required this.iconPath
  });

  final String name;
  final String iconPath;
}
