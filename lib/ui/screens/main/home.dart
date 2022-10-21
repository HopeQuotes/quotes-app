import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes/resources/colors.dart';
import 'package:quotes/ui/core/elevated_container.dart';
import 'package:quotes/ui/core/translate_anim_widget.dart';

import '../../../utils/constants.dart';

class HomeScreen extends StatelessWidget {
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
            return TransitionAnimWidget(
              duration: 700 + index,
              child: ElevatedContainer(
                height: 232,
                margin: const EdgeInsets.all(18),
                child: ClipRRect(
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                              style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black26),
                              textAlign: TextAlign.center,
                              "- Oprah Winfrey -"),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          margin: const EdgeInsets.all(24),
                          alignment: Alignment.center,
                          child: Text(
                              style: GoogleFonts.nunito(fontWeight: FontWeight.w600, fontSize: 16),
                              textAlign: TextAlign.center,
                              "If you look at what you have in life, you'll always have more. If you look at what you don't have in life, you'll never have enough."),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 1000, bottom: 1300),
                        child: Icon(
                          Icons.circle_outlined,
                          size: 125,
                          color: Colors.indigo.withAlpha(6),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          margin: const EdgeInsets.only(left: 200, top: 80),
                          child: Icon(
                            Icons.favorite_border,
                            size: 200,
                            color: Colors.indigo.withAlpha(8),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          margin: const EdgeInsets.only(left: 24, top: 80, bottom: 32),
                          child: Icon(
                            Icons.rectangle_outlined,
                            size: 62,
                            color: Colors.indigo.withAlpha(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return SizedBox(
              height: 350,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(Corners.cornerRadius * 4),
                            bottomRight: Radius.circular(Corners.cornerRadius * 4)),
                        color: Colors.red,
                        gradient: LinearGradient(
                            colors: [
                              AppColors.indigo.withOpacity(1),
                              Colors.indigoAccent.withOpacity(0.75),
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 0.0),
                            stops: const [0.0, 1.0],
                            tileMode: TileMode.clamp),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12.withOpacity(0.05),
                            blurRadius: 18.0,
                            spreadRadius: 10.0,
                            offset: const Offset(0, 0), // shadow direction: bottom right
                          )
                        ],
                      ),
                      height: 300,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 24, left: 24),
                                child: TransitionAnimWidget(
                                  startDirection: StartDirection.top,
                                  duration: 400,
                                  child: Text(
                                    "October 17",
                                    style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 32,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              TransitionAnimWidget(
                                startDirection: StartDirection.end,
                                duration: 400,
                                child: Container(
                                  margin: const EdgeInsets.only(right: 24, top: 24),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12.withOpacity(0.05),
                                        blurRadius: 24.0,
                                        spreadRadius: 24.0,
                                        offset:
                                            const Offset(0, 0), // shadow direction: bottom right
                                      )
                                    ],
                                    border: Border.all(width: 2.5, color: Colors.white),
                                    borderRadius: const BorderRadius.all(Radius.circular(
                                            12.0) //                 <--- border radius here
                                        ),
                                  ),
                                  child: const Icon(
                                    Icons.person_outlined,
                                    size: 32,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.only(left: 24),
                            child: TransitionAnimWidget(
                              startDirection: StartDirection.start,
                              duration: 400,
                              child: Text(
                                "Hello Jack",
                                style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20,
                                    color: Colors.white.withAlpha(232)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: const EdgeInsets.only(left: 24, top: 80, bottom: 32),
                      child: Icon(
                        Icons.circle_outlined,
                        size: 82,
                        color: Colors.white.withAlpha(12),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      margin: const EdgeInsets.only(right: 24, top: 24, bottom: 32),
                      child: Icon(
                        Icons.rectangle_outlined,
                        size: 92,
                        color: Colors.white.withAlpha(12),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedContainer(
                      margin: const EdgeInsets.all(18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 1,
                            child: TransitionAnimWidget(
                                startDirection: StartDirection.start,
                                duration: 400,
                                child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "25",
                                        style: GoogleFonts.nunito(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 22,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        "Quotes",
                                        style: GoogleFonts.nunito(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.black.withAlpha(100)),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                          Flexible(
                            flex: 1,
                            child: TransitionAnimWidget(
                                startDirection: StartDirection.bottom,
                                duration: 400,
                                child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "45",
                                        style: GoogleFonts.nunito(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 22,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        "Hashtags",
                                        style: GoogleFonts.nunito(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.black.withAlpha(100)),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                          Flexible(
                            flex: 1,
                            child: TransitionAnimWidget(
                                startDirection: StartDirection.end,
                                duration: 400,
                                child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "12",
                                        style: GoogleFonts.nunito(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 22,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        "Users",
                                        style: GoogleFonts.nunito(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.black.withAlpha(100)),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
