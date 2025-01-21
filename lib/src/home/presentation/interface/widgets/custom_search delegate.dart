import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate()
      : super(
          searchFieldLabel: "Search",
          searchFieldStyle: const TextStyle(color: Colors.grey),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
        );

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.grey),
      ),
      textTheme: const TextTheme(
        titleSmall: TextStyle(color: Colors.grey),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent, // Transparent AppBar
        elevation: 0, // No shadow
        iconTheme: IconThemeData(color: Colors.grey),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
      IconButton(
        icon: const Icon(Icons.filter_list), // Your trailing icon here
        onPressed: () {
          // Implement your filter logic
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(IconlyLight.search, color: Colors.grey), // Prefix icon
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement your search results
    return const Center(
      child: Text("Search Results"),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Implement your search suggestions
    return const Center(
      child: Text("Search Suggestions"),
    );
  }
}
