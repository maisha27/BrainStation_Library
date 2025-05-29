import 'package:flutter/material.dart';
import 'package:library_management_app/user_authentication/reset_password.dart';

class CheckMail extends StatefulWidget {
  const CheckMail({super.key});

  @override
  State<CheckMail> createState() => _CheckMailState();
}

class _CheckMailState extends State<CheckMail> {
  final TextEditingController _otpController = TextEditingController();

  void _goToResetPassword() {
    final otp = _otpController.text.trim();
    if (otp.isEmpty) {
      _showMessage("OTP cannot be empty");
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResetPassword(otp: otp),
      ),
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('Asset/images/logo.jpg', height: 100),
              const SizedBox(height: 20),
              const Text('Check your Mailbox', style: TextStyle(fontSize: 40, color: Colors.blue)),
              const Text('Please enter the OTP to proceed'),
              const SizedBox(height: 20),
              SizedBox(
                width: 300,
                child: TextFormField(
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'OTP',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.lightGreen),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.lightGreenAccent, width: 2),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _goToResetPassword,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text('VERIFY', style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 40),
              const Text('Brain Station 23', style: TextStyle(fontSize: 24, color: Colors.blue)),
              const Text('Library', style: TextStyle(fontSize: 18, color: Colors.black54)),
              const SizedBox(height: 10),
              const SizedBox(
                width: 300,
                child: Text(
                  'Your Premier Digital Library for Exploring Technical, Training, and IT Books',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
