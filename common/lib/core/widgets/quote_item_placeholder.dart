import 'package:common/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class QuoteItemPlaceHolder extends StatelessWidget {
  const QuoteItemPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (e, i) {
        return Shimmer.fromColors(
          baseColor: Colors.black.withAlpha(12),
          highlightColor: Colors.white10,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Corners.cornerRadius),
              color: Colors.white60,
            ),
            margin: const EdgeInsets.all(24),
            height: 250,
            width: double.infinity,
          ),
        );
      },
    );
  }
}
