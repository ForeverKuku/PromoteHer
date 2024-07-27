import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _searchQuery = '';

  // Sample data for search results
  final List<Map<String, String>> searchResults = [
    {
      'imagePath': 'assets/images/cloud computing.jpg',
      'name': 'Isador',
      'occupation': 'Cloud computing  at XYZ Corp',
    },
    {
      'imagePath': 'assets/images/data sceince.jpg',
      'name': 'Mary Doe',
      'occupation': 'Data science at ABC Ltd',
    },
    {
      'imagePath': 'assets/images/marketing.jpg',
      'name': 'Janette',
      'occupation': 'marketing at QRS Inc',
    },
    {
      'imagePath': 'assets/images/programming.jpg',
      'name': 'Janette',
      'occupation': 'Developer at LMN Co',
    },
    {
      'imagePath': 'assets/images/ui ux.jpg',
      'name': 'Janette',
      'occupation': 'UI Designer at LMN Co',
    },
  ];

  List<Map<String, String>> get filteredResults {
    if (_searchQuery.isEmpty) {
      return searchResults;
    } else {
      return searchResults
          .where((result) =>
              result['name']!
                  .toLowerCase()
                  .contains(_searchQuery.toLowerCase()) ||
              result['occupation']!
                  .toLowerCase()
                  .contains(_searchQuery.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Enter a name or occupation',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            Text(
              'Search Results for: $_searchQuery',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                itemCount: filteredResults.length,
                itemBuilder: (context, index) {
                  return SearchResultCard(
                    imagePath: filteredResults[index]['imagePath']!,
                    name: filteredResults[index]['name']!,
                    occupation: filteredResults[index]['occupation']!,
                    onPressed: () {
                      // Handle booking action or navigation
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchResultCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String occupation;
  final VoidCallback onPressed;

  const SearchResultCard({
    required this.imagePath,
    required this.name,
    required this.occupation,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              imagePath,
              width: 100.0,
              height: 100.0,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  occupation,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 8.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onPressed,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 143, 34, 246)),
                    ),
                    child: Text(
                      'Book',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
