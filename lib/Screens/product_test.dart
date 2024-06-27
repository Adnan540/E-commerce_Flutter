import 'package:flutter/material.dart';

import '../Widgets/poducts_gridview.dart';

class TestProductGridView extends StatelessWidget {
  const TestProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Product gridview"),
      ),
      body: ProductGridView(),
    );
  }
}