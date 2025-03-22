// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isChecked = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  String _selectedCountryCode = "+91"; // ✅ Default to +91
    String? selectedRole; // ✅ Declare a variable for the dropdown

  void _validateAndSignup() {
    if (_formKey.currentState!.validate()) {
      // Signup logic
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(), // ✅ Fixes pixel overflow
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),

                  // Lottie Animation
                  Center(
                    child: SizedBox(
                      height: 180,
                      child: Lottie.asset(
                        'assets/animations/login_animation.json',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Title
                  Text(
                    "Get Started",
                    style: GoogleFonts.montserrat(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Subtitle
                  Text(
                    "by creating a free account.",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Full Name Field
                  TextFormField(
                    controller: _nameController,
                    decoration: _buildInputDecoration("Full Name", Icons.person),
                    validator: (value) => value!.isEmpty ? "Please enter your full name" : null,
                  ),
                  const SizedBox(height: 16),

                  // Email Field
                  TextFormField(
                    controller: _emailController,
                    decoration: _buildInputDecoration("Valid Email", Icons.email),
                    validator: (value) {
                      if (value!.isEmpty) return "Please enter your email";
                      if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(value)) {
                        return "Enter a valid email";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Phone Field with Country Code Picker
                  Row(
                    children: [
                      CountryCodePicker(
                        onChanged: (code) {
                          setState(() {
                            _selectedCountryCode = code.dialCode!;
                          });
                        },
                        initialSelection: 'IN', // ✅ Default to India (+91)
                        favorite: ['+91'],
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        alignLeft: false,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: _buildInputDecoration("Phone Number", Icons.phone),
                          validator: (value) => value!.isEmpty ? "Please enter your phone number" : null,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Role Selection Dropdown (Now Uses _buildInputDecoration)
DropdownButtonFormField<String>(
  decoration: _buildInputDecoration("Select Your Role", Icons.person), // ✅ Uses the same decoration
  value: selectedRole,
  isExpanded: true,
  icon: const Icon(Icons.arrow_drop_down, color: Colors.black54),
  style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
  dropdownColor: Colors.grey[200],
  borderRadius: BorderRadius.circular(12),

  // ✅ Validation for role selection
  validator: (value) {
    if (value == null || value.isEmpty) {
      return "Please select a role";
    }
    return null;
  },

  onChanged: (value) {
    setState(() {
      selectedRole = value;
    });
  },

  items: ["Job Seeker", "Employer"].map((role) {
    return DropdownMenuItem(
      value: role,
      child: Text(role),
    );
  }).toList(),
),
const SizedBox(height: 16),


                  // Password Field with Eye Button
                  TextFormField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: _buildPasswordInputDecoration("Strong Password", _isPasswordVisible, () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    }),
                    validator: (value) {
                      if (value!.isEmpty) return "Please enter your password";
                      if (value.length < 6) return "Password must be at least 6 characters";
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Confirm Password Field with Eye Button
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: !_isConfirmPasswordVisible,
                    decoration: _buildPasswordInputDecoration("Confirm Password", _isConfirmPasswordVisible, () {
                      setState(() {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                      });
                    }),
                    validator: (value) {
                      if (value!.isEmpty) return "Please confirm your password";
                      if (value != _passwordController.text) return "Passwords do not match";
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),

                  // Terms & Conditions Checkbox
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isChecked = !_isChecked;
                      });
                    },
                    child: Row(
                      children: [
                        Checkbox(
                          value: _isChecked,
                          activeColor: Colors.red,
                          onChanged: (value) {
                            setState(() {
                              _isChecked = value!;
                            });
                          },
                        ),
                        Expanded(
                          child: Text(
                            "By checking this box, you agree to our Terms and Conditions.",
                            style: GoogleFonts.poppins(fontSize: 12, color: Colors.black54),
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Next Button
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
                      onPressed: _validateAndSignup,
                      child: Text(
                        "Next",
                        style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                   SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.black26),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: Image.asset('assets/images/google_icon.png', height: 24), // ✅ Custom Google Image
                      onPressed: () {},
                      label: Text(
                        "Sign up with Google",
                        style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Already a Member? Login
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginScreen()),
                        );
                      },
                     child: RichText(
                          text: TextSpan(
                            text: "Already a member? ",
                            style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
                            children: [
                              TextSpan(
                                text: "Log in",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Floating Label Input Decoration
  InputDecoration _buildInputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      labelStyle: GoogleFonts.poppins(fontSize: 14, color: Colors.black45),
      prefixIcon: Icon(icon, color: Colors.black54),
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
    );
  }

  // Password Input Decoration with Eye Button
  InputDecoration _buildPasswordInputDecoration(String label, bool isVisible, VoidCallback toggle) {
    return _buildInputDecoration(label, Icons.lock).copyWith(
      suffixIcon: IconButton(
        icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off, color: Colors.black54),
        onPressed: toggle,
      ),
    );
  }
}
