import 'package:flutter/material.dart';
import 'model/model_dart.dart';
import 'service/book_service.dart';

class ViewBookPopup extends StatefulWidget {
  final int bookId;

  const ViewBookPopup({super.key, required this.bookId});

  @override
  State<ViewBookPopup> createState() => _ViewBookPopupState();
}

class _ViewBookPopupState extends State<ViewBookPopup> {
  late Future<Book> _bookFuture;

  @override
  void initState() {
    super.initState();
    _bookFuture = BookService.fetchBookById(widget.bookId);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: FutureBuilder<Book>(
          future: _bookFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox(height: 150, child: Center(child: CircularProgressIndicator()));
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final book = snapshot.data!;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFD5E7F0),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.all(8),
                            child: const Icon(Icons.menu_book, color: Colors.black, size: 24),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "View Book",
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
                  const Divider(thickness: 1, color: Colors.black),
                  const SizedBox(height: 10),

                  // Book Info
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        // Left Column
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Title : ${book.title}"),
                              const SizedBox(height: 8),
                              Text("Author : ${book.authorName}"),
                              const SizedBox(height: 8),
                              Text("Pages : ${book.totalPages}"),
                              const SizedBox(height: 8),
                              Text("Rating : ${book.rating}"),
                              const SizedBox(height: 8),
                              Text("Published : ${book.publishedDate}"),
                            ],
                          ),
                        ),

                        Container(
                          height: 80,
                          width: 1,
                          color: Colors.grey.shade300,
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                        ),

                        // Right Column (Image)
                        Expanded(
                          child: book.coverImageUrl != null
                              ? Image.network(book.coverImageUrl!, height: 80)
                              : const Text("No Image"),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

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
              );
            }
          },
        ),
      ),
    );
  }
}
