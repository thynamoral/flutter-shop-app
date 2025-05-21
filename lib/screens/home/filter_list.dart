import 'package:flutter/material.dart';

class FilterList extends StatelessWidget {
  final List<String> filterList;
  final String selectedFilter;
  final Function onSelectFilter;
  const FilterList({
    super.key,
    required this.filterList,
    required this.selectedFilter,
    required this.onSelectFilter,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, top: 32, bottom: 32),
      child: SizedBox(
        width: double.infinity,
        height: 80,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: filterList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: () => onSelectFilter(filterList[index]),
                child: Chip(
                  backgroundColor:
                      selectedFilter == filterList[index]
                          ? Theme.of(context).colorScheme.onSecondary
                          : Theme.of(context).colorScheme.onPrimary,
                  label: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 16,
                    ),
                    child: Text(filterList[index]),
                  ),
                  labelStyle: TextStyle(
                    fontSize: 16,
                    color:
                        selectedFilter == filterList[index]
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
