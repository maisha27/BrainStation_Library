import 'package:flutter/material.dart';

class BookClubHomePage extends StatefulWidget {
  @override
  _BookClubHomePageState createState() => _BookClubHomePageState();
}

class _BookClubHomePageState extends State<BookClubHomePage> {
  TextEditingController _searchController = TextEditingController();

  List<Map<String, String>> groups = [
    {
      'name': 'Classic Readers Club',
      'description': 'Explore timeless classics and dive deep into historic literature.'
    },
    {
      'name': 'Sci-Fi Explorers',
      'description': 'From space operas to time travel, explore futuristic stories.'
    },
    {
      'name': 'Mystery Enthusiasts',
      'description': 'Solve gripping mysteries and discuss crime thrillers.'
    },
    {
      'name': 'Young Adult Readers',
      'description': 'For fans of YA novels filled with drama, growth, and action.'
    },
    {
      'name': 'Romantic Souls',
      'description': 'Share the joy of romance literature from past to present.'
    },
    {
      'name': 'Non-Fiction Network',
      'description': 'Discuss real-world stories and informative books together.'
    },
  ];

  String searchTerm = '';

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredGroups = groups
        .where((group) => group['name']!.toLowerCase().contains(searchTerm.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.blue),
            ),
            SizedBox(width: 10),
            Text("User", style: TextStyle(fontSize: 18))
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome to BS23 BOOK CLUB", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue.shade300)),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      setState(() {
                        searchTerm = value;
                      });
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Group Name',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),

                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade300),
                  child: Text("Search Group",style: TextStyle(color: Colors.white)),
                ),
              ]),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade300),
                  child: Text("See all popular Groups",style: TextStyle(color: Colors.white)),
                ),

            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: filteredGroups.length,
                itemBuilder: (context, index) {
                  var group = filteredGroups[index];
                  return Card(
                    color: Colors.blue[100],
                    margin: EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      leading: Image.asset('assets/group.jpg', height: 50, width: 50),
                      title: Text(group['name']!, style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(group['description']!),
                    ),
                  );
                },
              ),
            ),

        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.group_add),
        onPressed: () {
          // Add group creation logic here
        },
      ),
    );
  }
}
