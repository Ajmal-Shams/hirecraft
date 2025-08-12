import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../home/JobSeeker/main/screens/job_seeker_home.dart.dart';


class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  int _secondsRemaining = 30;
  bool _canResend = false;
  Timer? _timer;
  String _otpCode = "";
  bool _otpError = false; // ✅ Error state for OTP validation

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        setState(() {
          _canResend = true;
          _timer?.cancel();
        });
      }
    });
  }

  void _resendCode() {
    setState(() {
      _secondsRemaining = 30;
      _canResend = false;
    });
    _startTimer();
  }

  void _verifyOtp() {
    setState(() {
      _otpError = _otpCode.length < 6; // ✅ Error when OTP is incomplete
    });

    if (!_otpError) {
      // Proceed with OTP verification logic
      print("OTP Verified: $_otpCode");
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // ✅ Prevents overflow issues
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),

                      // Title
                      Text(
                        "Almost there",
                        style: GoogleFonts.montserrat(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Subtitle
                      Text(
                        "Please enter the 6-digit code sent to\nyour email contact.uiuxexperts@gmail.com for verification.",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 30),

                      // OTP Text Fields
                      Center(
                        child: Column(
                          children: [
                            OtpTextField(
                              numberOfFields: 6,
                              borderColor:
                                  _otpError
                                      ? Colors.red
                                      : Colors.black26, // ✅ Error highlight
                              focusedBorderColor: Colors.red,
                              textStyle: GoogleFonts.poppins(fontSize: 18),
                              showFieldAsBox: true,
                              borderWidth: 1.5,
                              fieldWidth: 40,
                              onCodeChanged: (code) {
                                setState(() {
                                  _otpCode = code;
                                  _otpError =
                                      false; // ✅ Remove error when typing
                                });
                              },
                              onSubmit: (otp) {
                                setState(() {
                                  _otpCode = otp;
                                });
                              },
                            ),
                            if (_otpError) // ✅ Show error message if OTP is incomplete
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  "Please enter the full 6-digit OTP",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Verify Button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed:
                              _verifyOtp, // ✅ Now checks OTP before proceeding
                          child: Text(
                            "Verify",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Resend OTP
                      Center(
                        child: GestureDetector(
                          onTap: _canResend ? _resendCode : null,
                          child: Text(
                            _canResend
                                ? "Resend Again"
                                : "Didn't receive any code? Resend Again\nRequest new code in 00:${_secondsRemaining.toString().padLeft(2, '0')}",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: _canResend ? Colors.red : Colors.black45,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // "Test Home Screen" Button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.black, // Black button for testing
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  JobSeekerHomeScreen(),
                              ), // ✅ Navigates to Home Screen
                            );
                          },
                          child: Text(
                            "Test Home Screen",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Back Button (Inside Bottom Section)
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 20),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  backgroundColor: Colors.black,
                  shape: const CircleBorder(),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
