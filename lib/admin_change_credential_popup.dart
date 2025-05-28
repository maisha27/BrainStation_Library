import 'package:flutter/material.dart';

class ChangeCredentialsPopup extends StatelessWidget {
  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      contentPadding: const EdgeInsets.all(20),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header Row
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.settings, size: 30, color: Colors.black87),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Change Credentials',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.close, color: Colors.red),
                ),
              ],
            ),

            SizedBox(height: 10),
            Divider(),

            // Form Fields
            SizedBox(height: 20),
            _buildTextField('Enter Current Password', currentPasswordController),
            SizedBox(height: 15),
            _buildTextField('Enter New Password', newPasswordController),
            SizedBox(height: 15),
            _buildTextField('Confirm New Password', confirmPasswordController),

            SizedBox(height: 30),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildButton(
                  text: 'CANCEL',
                  color: Colors.blueGrey[100],
                  textColor: Colors.black,
                  onTap: () => Navigator.pop(context),
                ),
                _buildButton(
                  text: 'CONFIRM',
                  color: Colors.black87,
                  textColor: Colors.white,
                  onTap: () {
                    // TODO: Add validation and submission logic
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }

  Widget _buildButton({required String text, Color? color, Color? textColor, required VoidCallback onTap}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.symmetric(vertical: 14),
          ),
          child: Text(text, style: TextStyle(color: textColor, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
