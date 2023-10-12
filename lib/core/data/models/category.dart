enum Category {
  hotel(name: 'Отель', iconFileName: 'hotel.svg'),
  restaurant(name: 'Ресторан', iconFileName: 'restourant.svg'),
  specialPlace(name: 'Особое место', iconFileName: 'particular_place.svg'),
  park(name: 'Парк', iconFileName: 'park.svg'),
  museum(name: 'Музей', iconFileName: 'museum.svg'),
  cafe(name: 'Кафе', iconFileName: 'cafe.svg');

  const Category({
    required this.name,
    required this.iconFileName
  });

  final String name;
  final String iconFileName;
}
