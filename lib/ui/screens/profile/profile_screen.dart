import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes/ui/core/widgets/elevated_container_widget.dart';

import '../../../resources/colors.dart';
import '../../../utils/constants.dart';
import '../../core/widgets/translate_anim_widget.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 700,
      color: AppColors.backgroundColor,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 32),
          ),
          TransitionAnimWidget(
            duration: 1000,
            startDirection: StartDirection.bottom,
            child: ElevatedContainer(
              width: 50,
              margin: const EdgeInsets.all(12),
              height: 128,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(12),
                    child: const Icon(
                      Icons.ac_unit,
                      size: 62,
                      color: Colors.indigo,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Jack Horton",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 22),
                      ),
                      Text(
                        "example@gmail.com",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black12, fontSize: 18),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: TransitionAnimWidget(
                  duration: 1100,
                  startDirection: StartDirection.bottom,
                  child: ElevatedContainer(
                    margin: EdgeInsets.all(12),
                    gradient: LinearGradient(
                        colors: [
                          Colors.indigo.withOpacity(0.5),
                          Colors.indigoAccent.withOpacity(0.8),
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(0.9, 0.0),
                        stops: const [0.0, 1.0],
                        tileMode: TileMode.clamp),
                    height: 200,
                    child: ClipRRect(
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.all(12),
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.white.withAlpha(52),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(12.0) //                 <--- border radius here
                                  ),
                            ),
                            child: const Icon(
                              size: 32,
                              Icons.favorite_border,
                              color: Colors.white,
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              margin: const EdgeInsets.only(left: 52),
                              child: const Icon(
                                Icons.favorite_border,
                                size: 200,
                                color: Colors.white12,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              margin: const EdgeInsets.all(24),
                              child: const Text(
                                "Favorites",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: TransitionAnimWidget(
                  duration: 1100,
                  startDirection: StartDirection.bottom,
                  child: ElevatedContainer(
                    margin: EdgeInsets.all(12),
                    gradient: LinearGradient(
                        colors: [
                          Colors.indigo.withOpacity(0.5),
                          Colors.indigoAccent.withOpacity(0.8),
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(0.9, 0.0),
                        stops: const [0.0, 1.0],
                        tileMode: TileMode.clamp),
                    height: 200,
                    child: ClipRRect(
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.all(12),
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.white.withAlpha(52),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(12.0) //                 <--- border radius here
                                  ),
                            ),
                            child: const Icon(
                              size: 32,
                              Icons.notifications_none_rounded,
                              color: Colors.white,
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Stack(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 52),
                                  child: const Icon(
                                    Icons.favorite_border,
                                    size: 200,
                                    color: Colors.white12,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 42,top: 6),
                                  width: 20,
                                  height: 20,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.red, borderRadius: BorderRadius.circular(100)),
                                  child: Text(
                                    "6",
                                    style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              margin: const EdgeInsets.all(24),
                              child: const Text(
                                "Notifactions",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
