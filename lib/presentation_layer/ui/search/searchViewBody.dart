import 'package:flutter/material.dart';

import '../customWidget/customSearchBar.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSearchBar(),
      ],
    );
  }
}
