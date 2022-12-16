import 'package:common/core/widgets/elevated_container_widget.dart';
import 'package:common/core/widgets/scale_tap.dart';
import 'package:common/core/widgets/translate_anim_widget.dart';
import 'package:common/resources/colors.dart';
import 'package:common/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home/home/bloc/home_bloc.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
        builder: (context, state) {
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
                          bottomRight:
                              Radius.circular(Corners.cornerRadius * 4)),
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
                          offset: const Offset(
                              0, 0), // shadow direction: bottom right
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
                                  "${months[DateTime.now().month - 1]} ${DateTime.now().day}",
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
                              child: ScaleTap(
                                onPressed: () {},
                                onLongPress: () {},
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(right: 24, top: 24),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12.withOpacity(0.05),
                                        blurRadius: 24.0,
                                        spreadRadius: 24.0,
                                        offset: const Offset(0,
                                            0), // shadow direction: bottom right
                                      )
                                    ],
                                    border: Border.all(
                                        width: 2.5, color: Colors.white),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(
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
                              "Hello ${state.user?.name ?? ""}",
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
                    margin:
                        const EdgeInsets.only(left: 24, top: 80, bottom: 32),
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
                    margin:
                        const EdgeInsets.only(right: 24, top: 24, bottom: 32),
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
                    spread: 24,
                    blur: 5,
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
                            ),
                          ),
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
        },
        listener: (context, state) {});
  }
}
