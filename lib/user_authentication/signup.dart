import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isLoading = false;

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      final url = Uri.parse('http://172.16.227.200:8000/auth/signup/');
      final bodyData = {
        'first_name': _firstNameController.text.trim(),
        'last_name': _lastNameController.text.trim(),
        'contact_number': _contactController.text.trim(),
        'email': _emailController.text.trim(),
        'username': _usernameController.text.trim(),
        'password': _passwordController.text.trim(),
      };

      try {
        final response = await http.post(
          url,
          headers: {'Content-Type': 'application/json'},
          body: json.encode(bodyData),
        );

        setState(() {
          _isLoading = false;
        });

        print('Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');

        if (response.statusCode == 201 || response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Signup successful!')),
          );
          Navigator.pop(context);
        } else {
          String message = 'Signup failed!';
          try {
            final data = json.decode(response.body);
            if (data is Map && data.containsKey('error')) {
              message = data['error'].toString();
            } else if (data is Map && data.containsKey('detail')) {
              message = data['detail'].toString();
            } else if (data is Map) {
              message = data.values.first.toString(); // Get first error if available
            }
          } catch (e) {
            print('Error decoding JSON: $e');
          }

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message)),
          );
        }
      } catch (e) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Network error: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset('Asset/images/logo.jpg', height: 100),
              SizedBox(height: 20),
              Text('Sign Up', style: TextStyle(fontSize: 40, color: Colors.blue)),
              Text('Please provide your information to sign up.'),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Container(
                  width: 450,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _firstNameController,
                              decoration: _inputDecoration('First Name'),
                              validator: (val) => val!.isEmpty ? 'Required' : null,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              controller: _lastNameController,
                              decoration: _inputDecoration('Last Name'),
                              validator: (val) => val!.isEmpty ? 'Required' : null,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _contactController,
                              decoration: _inputDecoration('Contact No'),
                              keyboardType: TextInputType.phone,
                              validator: (val) => val!.isEmpty ? 'Required' : null,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              controller: _emailController,
                              decoration: _inputDecoration('Email'),
                              keyboardType: TextInputType.emailAddress,
                              validator: (val) => val!.isEmpty ? 'Required' : null,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _usernameController,
                              decoration: _inputDecoration('Username'),
                              validator: (val) => val!.isEmpty ? 'Required' : null,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: !_isPasswordVisible,
                              decoration: _inputDecoration('Password').copyWith(
                                suffixIcon: IconButton(
                                  icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  },
                                ),
                              ),
                              validator: (val) => val!.length < 6 ? 'Min 6 characters' : null,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              _isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                ),
                child: Text('SIGN UP', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 40),
              Column(
                children: [
                  Text('Brain Station 23', style: TextStyle(fontSize: 24, color: Colors.blue)),
                  Text('Library', style: TextStyle(fontSize: 18, color: Colors.black54)),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 300,
                    child: Text(
                      'Your Premier Digital Library for Exploring Technical, Training, and IT Books',
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: BorderSide(color: Colors.lightGreen),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: BorderSide(color: Colors.lightGreenAccent, width: 2.0),
      ),
    );
  }
}
