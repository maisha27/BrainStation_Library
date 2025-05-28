import 'package:flutter/material.dart';

class UpdateUserPopup extends StatelessWidget {
  const UpdateUserPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController languageController = TextEditingController();
    final TextEditingController typeController = TextEditingController();
    final TextEditingController quantityController = TextEditingController();

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Top Row with Icon and Title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: Color(0xFFD5EDF6),
                        child: Icon(Icons.menu_book, size: 30, color: Colors.black87),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Update Book",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red.shade100,
                      ),
                      child: const Icon(Icons.close, size: 16, color: Colors.red),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),
              const Divider(),

              const SizedBox(height: 10),

              /// Input Fields
              _buildInputField(nameController, "Name"),
              const SizedBox(height: 10),
              _buildInputField(languageController, "Language"),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(child: _buildInputField(typeController, "Type")),
                  const SizedBox(width: 10),
                  Expanded(child: _buildInputField(quantityController, "Quantity")),
                ],
              ),

              const SizedBox(height: 20),

              /// Action Buttons
              _buildActionRow(context, "CANCEL", " UPDATE"),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(TextEditingController controller, String hint) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget _buildActionRow(BuildContext context, String leftText, String rightText) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: const Color(0xFFD5E7F0),
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: Text(leftText),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              // TODO: Add functionality
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: Text(
              rightText,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
