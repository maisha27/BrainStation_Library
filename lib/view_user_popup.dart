import 'package:flutter/material.dart';

class ViewUserPopup extends StatelessWidget {
  const ViewUserPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // Light blue icon box
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFD5E7F0), // Light blue background
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: const Icon(Icons.menu_book, color: Colors.black, size: 24),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "View User",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close, color: Colors.red),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // BLACK underline
            const Divider(
              thickness: 1,
              color: Colors.black,
            ),

            const SizedBox(height: 10),

            // Book Info Box
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  // Left side: Book Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("User ID : 1"),
                        SizedBox(height: 8),
                        Text("Name : Wimal Gurusinghe"),
                        SizedBox(height: 8),
                        Text("Email : wimalgsh@gmail.com"),
                        SizedBox(height: 8),
                        Text("Username : wimalguru"),
                      ],
                    ),
                  ),

                  // Vertical Divider
                  Container(
                    height: 80,
                    width: 1,
                    color: Colors.grey.shade300,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                  ),

                  // Right side: Saved By
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Saved by :"),
                        SizedBox(height: 8),
                        Text("Nisal Gunasekara"),
                        Text("(Admin)"),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Close Button with white text
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "CLOSE",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
