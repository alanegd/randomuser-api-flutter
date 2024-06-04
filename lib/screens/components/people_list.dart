import 'package:flutter/material.dart';
import 'package:randomuser_api_flutter/models/person.dart';
import 'package:randomuser_api_flutter/screens/components/person_card.dart';

class PeopleList extends StatefulWidget {
  final List<Person> people;
  const PeopleList({super.key, required this.people});

  @override
  State<PeopleList> createState() => _PeopleListState();
}

class _PeopleListState extends State<PeopleList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.people.length,
      itemBuilder: (context, index) {
        return PersonCard(
          thumbnail: widget.people[index].picture.thumbnail,
          title: widget.people[index].title,
          first: widget.people[index].name.first,
          last: widget.people[index].name.last,
          gender: widget.people[index].gender,
          city: widget.people[index].city,
          email: widget.people[index].email,
          cell: widget.people[index].cell,
        );
      },
    );
  }
}
