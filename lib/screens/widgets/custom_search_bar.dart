import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  final Function(String) callback;

  const CustomSearchBar({Key? key, required this.callback}) : super(key: key);

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Number of people',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: () {
              widget.callback(_controller.text);
            },
            child: const Text('Show people'),
          ),
        ],
      ),
    );
  }
}
