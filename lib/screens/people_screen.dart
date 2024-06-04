import 'package:flutter/material.dart';
import 'package:randomuser_api_flutter/models/person.dart';
import 'package:randomuser_api_flutter/screens/widgets/custom_search_bar.dart';
import 'package:randomuser_api_flutter/screens/widgets/people_list.dart';
import 'package:randomuser_api_flutter/services/person_service.dart';

class PeopleScreen extends StatefulWidget {
  const PeopleScreen({super.key});

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  List<Person> people = [];
  final PersonService personService = PersonService();
  bool isLoading = false;
  String query = "";

  void onQueryChanged(String value) {
    setState(() {
      query = value;
    });
  }

  Future<void> fetchPeople() async {
    setState(() {
      isLoading = true;
    });
    try {
      int count = int.tryParse(query) ?? 0;
      if (count > 0) {
        List<Person> result = await personService.searchPeople(count);
        setState(() {
          people = result;
        });
      }
    } catch (e) {
      print("Error fetching people: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personas')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomSearchBar(
              callback: (value) {
                onQueryChanged(value);
                fetchPeople();
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : PeopleList(people: people),
            ),
          ],
        ),
      ),
    );
  }
}
