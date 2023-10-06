enum Category {
  cinema(name: 'Кинотеатр'),
  restaurant(name: 'Ресторан'),
  specialPlace(name: 'Особое место'),
  theatre(name: 'Театр'),
  museum(name: 'Музей'),
  cafe(name: 'Кафе');

  const Category({
    required this.name,
  });

  final String name;
}
