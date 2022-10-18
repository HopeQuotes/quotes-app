import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotes/resources/colors.dart';
import 'package:quotes/ui/core/translate_anim_widget.dart';

import '../../../utils/constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          if (index > 0) {
            return TransitionAnimWidget(
              duration: 700 + index,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Corners.cornerRadius),
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.05),
                      blurRadius: 18.0,
                      spreadRadius: 10.0,
                      offset: const Offset(0, 0), // shadow direction: bottom right
                    )
                  ],
                ),
                margin: const EdgeInsets.all(18),
                height: 200,
                width: double.infinity,
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
                              Colors.pink.withOpacity(0.5),
                              Colors.red.withOpacity(0.4),
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
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
                                margin: const EdgeInsets.all(24),
                                child: const TransitionAnimWidget(
                                  startDirection: StartDirection.top,
                                  duration: 400,
                                  child: Text(
                                    "October 17",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 32),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: const EdgeInsets.all(24),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Corners.cornerRadius),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12.withOpacity(0.05),
                            blurRadius: 18.0,
                            spreadRadius: 10.0,
                            offset: const Offset(0, 0), // shadow direction: bottom right
                          )
                        ],
                      ),
                      height: 100,
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
                                    children: const [
                                      Text(
                                        "25",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 22),
                                      ),
                                      Text(
                                        "Quotes",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black45,
                                            fontSize: 14),
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
                                    children: const [
                                      Text(
                                        "25",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 22),
                                      ),
                                      Text(
                                        "Quotes",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black45,
                                            fontSize: 14),
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
                                    children: const [
                                      Text(
                                        "25",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 22),
                                      ),
                                      Text(
                                        "Quotes",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black45,
                                            fontSize: 14),
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
