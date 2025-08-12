import 'package:flutter/material.dart';

class FilterOptions extends StatelessWidget {
  final String selectedCategory;
  final Function(String) onCategorySelected;

  const FilterOptions({
    Key? key,
    required this.selectedCategory,
    required this.onCategorySelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = ['All', 'Free', 'Premium', 'ATS'];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          bool isSelected = selectedCategory == category;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ChoiceChip(
              label: Text(category),
              selected: isSelected,
              onSelected: (selected) {
                onCategorySelected(category);
              },
              selectedColor: Colors.blueAccent, // Selected chip color
              backgroundColor: Colors.grey[200], // Default chip color
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
