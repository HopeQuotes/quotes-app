import 'package:flutter/material.dart';
import 'package:quotes/resources/colors.dart';
import 'package:quotes/ui/screens/home/quotes_list_item.dart';

import 'dashboard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 700,
      color: AppColors.backgroundColor,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          if (index > 0) {
            return QuoteItem(index: index);
          } else {
            return DashBoard();
          }
        },
      ),
    );
  }
}
