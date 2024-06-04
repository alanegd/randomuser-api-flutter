import 'package:flutter/material.dart';
import 'package:randomuser_api_flutter/models/person.dart';
import 'package:randomuser_api_flutter/screens/components/people_list.dart';

class PeopleScreen extends StatefulWidget {
  const PeopleScreen({super.key});

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  final List<Person> people = [
    const Person(
        picture: Picture(thumbnail: 'url1'),
        title: 'Mr.',
        name: Name(first: 'Winston', last: 'Smith'),
        gender: 'Male',
        city: 'New York',
        email: 'john@example.com',
        cell: '1234567890'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                'Personas',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Expanded(
                    child: SearchBar(
                      hintText: 'Number of people',
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      print('Button pressed');
                    },
                    child: const Text('Show people'),
                  )
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: PeopleList(people: people),
              ),
            ],
          )),
    );
  }
}
