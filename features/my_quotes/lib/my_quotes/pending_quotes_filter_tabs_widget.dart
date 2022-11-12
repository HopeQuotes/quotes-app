import 'package:common/core/widgets/translate_anim_widget.dart';
import 'package:common/resources/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PendingQuotesFilterTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        margin: const EdgeInsets.all(12),
        child: TabBar(
          unselectedLabelColor: Colors.black,
          indicator: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              color: AppColors.indigo),
          indicatorColor: AppColors.black,
          tabs: [
            TransitionAnimWidget(
              startDirection: StartDirection.start,
              duration: 500,
              child: Tab(
                child: Text(
                  "Pending",
                  style: GoogleFonts.nunito(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
            ),
            TransitionAnimWidget(
              startDirection: StartDirection.bottom,
              duration: 500,
              child: Tab(
                child: Text(
                  "Verified",
                  style: GoogleFonts.nunito(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
            ),
            TransitionAnimWidget(
              startDirection: StartDirection.end,
              duration: 500,
              child: Tab(
                child: Text(
                  "Rejected",
                  style: GoogleFonts.nunito(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
