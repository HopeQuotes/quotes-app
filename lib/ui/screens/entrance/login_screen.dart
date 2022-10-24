import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../resources/colors.dart';
import '../../core/elevated_container.dart';
import '../main/core.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Container(
            transform: Matrix4.translationValues(MediaQuery.of(context).size.width * .2, 1.0, 0.0),
            padding: const EdgeInsets.only(left: 100),
            child: Icon(
              Icons.rectangle_outlined,
              size: 200,
              color: Colors.white.withAlpha(124),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            transform:
                Matrix4.translationValues((MediaQuery.of(context).size.width) * -0.6, -200.0, 0.0),
            padding: const EdgeInsets.only(left: 100),
            child: Icon(
              Icons.track_changes,
              size: 200,
              color: Colors.white.withAlpha(124),
            ),
          ),
        ),
        Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              transform:
                  Matrix4.translationValues(MediaQuery.of(context).size.width * .36, 65.0, 0.0),
              width: double.infinity,
              child: Icon(
                Icons.circle_outlined,
                size: 200,
                color: Colors.white.withAlpha(124),
              ),
            )),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: 62,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.05),
                      blurRadius: 4.0,
                      spreadRadius: 4.0,
                      offset: const Offset(0, 0), // shadow direction: bottom right
                    )
                  ],
                ),
                margin: const EdgeInsets.only(left: 24, right: 24, top: 0),
                child: TextField(
                  textAlign: TextAlign.start,
                  controller: TextEditingController(),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide(color: AppColors.indigo, width: 2),
                    ),
                    hintText: 'Email',
                    hintStyle: GoogleFonts.nunito(fontSize: 16, color: Colors.black12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    contentPadding: const EdgeInsets.all(20),
                    fillColor: AppColors.white,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 62,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.05),
                      blurRadius: 4.0,
                      spreadRadius: 4.0,
                      offset: const Offset(0, 0), // shadow direction: bottom right
                    )
                  ],
                ),
                margin: const EdgeInsets.only(left: 24, right: 24, top: 24),
                child: TextField(
                  textAlign: TextAlign.start,
                  controller: TextEditingController(),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide(color: AppColors.indigo.withAlpha(180), width: 2),
                    ),
                    hintText: 'Password',
                    hintStyle: GoogleFonts.nunito(fontSize: 16, color: Colors.black12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    contentPadding: const EdgeInsets.all(20),
                    fillColor: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedContainer(
              spread: 4,
              blur: 4,
              color: AppColors.indigo.withAlpha(180),
              margin: const EdgeInsets.all(24),
              height: 52,
              child: InkWell(
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Login",
                    style: GoogleFonts.nunito(
                        fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => Core(),
                    ),
                  );
                },
              )),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            padding: const EdgeInsets.only(top: 62, left: 24),
            child: Text(
              "Login",
              style: GoogleFonts.nunito(
                  fontSize: 42, color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
