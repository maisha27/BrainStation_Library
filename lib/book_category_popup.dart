import 'package:flutter/material.dart';

class CategoryBookPopup extends StatelessWidget {
  final List<String> categories = [
    "Machine learning",
    "System Design",
    "Frameworks mastery",
    "Javascript Mastery",
    "UI/UX Journey",
    "Next.js easy way",
    "C, C++, Python in one"
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Header Row
            Row(
              children: [
                Icon(Icons.book, size: 36, color: Color(0xFFD5E7F0)), // ✅ Correct
                SizedBox(width: 10),
                Text(
                  'Book Category',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.close, color: Colors.red),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            SizedBox(height: 10),

            /// Category List
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 6.0, horizontal: 12.0),
                    child: Text(categories[index]),
                  );
                },
              ),
            ),
            SizedBox(height: 20),

            /// Action Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD5E7F0),

                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {
                      // Handle remove action
                    },
                    child: Text('REMOVE'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      // Handle add action
                    },
                    child: Text('ADD'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
