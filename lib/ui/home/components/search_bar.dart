import 'package:shoelora/consts.dart';
import 'package:flutter/material.dart';
import 'package:standard_searchbar/old/standard_searchbar.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Set the width based on the screen size
    double searchBarWidth = screenWidth < 600 ? screenWidth * 0.9 : 360; // Example: 90% width for mobile, 360 for larger screens
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding, 
        vertical: 10
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0x489E9E9E)), 
          borderRadius: BorderRadius.circular(50)
        ),
        child: StandardSearchBar(
          width: searchBarWidth,
          suggestions: const [
            'flat',
            'formal',
            'crocs',
            'melissa',
            'sport',
            'high heels'
          ],
          hintText: "Find your kicks here...",
        ),
      ),
    );
  }
}
