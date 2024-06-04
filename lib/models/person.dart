class Name {
  final String first;
  final String last;

  const Name({
    required this.first,
    required this.last,
  });
}

class Picture {
  final String thumbnail;

  const Picture({
    required this.thumbnail,
  });
}

class Person {
  final Picture picture;
  final Name name;
  final String email;
  final String cell;
  final String title;
  final String gender;
  final String city;

  const Person(
      {required this.picture,
      required this.name,
      required this.email,
      required this.cell,
      required this.title,
      required this.gender,
      required this.city});
}
