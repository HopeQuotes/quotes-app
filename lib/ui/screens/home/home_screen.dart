import 'package:flutter/material.dart';
import 'package:quotes/resources/colors.dart';
import 'package:quotes/ui/screens/home/quotes_list_item_widget.dart';

import 'dashboard_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 100,
      itemBuilder: (BuildContext context, int index) {
        if (index > 0) {
          return QuoteItem(index: index);
        } else {
          return DashBoard();
        }
      },
    );
  }
}
