import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:milesed/constant/constant.dart';
import 'package:sizer/sizer.dart';


/// Footer content

class FooterContent extends StatelessWidget {
  const FooterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return       Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Flag bearer for ',
                            style: GoogleFonts.roboto(
                                fontSize: 26.sp, fontWeight: FontWeight.w800),
                            children: [
                              TextSpan(
                                text: "Accountants!",
                                style: GoogleFonts.roboto(
                                    fontSize: 33.sp,
                                    fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                        ),
                        spacer10Height,
                        Text(
                          "Created at Miles Education",
                          style: GoogleFonts.roboto(
                              fontSize: 10.sp, fontWeight: FontWeight.w500),
                        ),
                        spacer50Height,
                      ],
                    ),
                  );
             
  }
}