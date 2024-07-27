import 'package:flutter/material.dart';
import 'package:promote_her_app/home_cards/detial_screen.dart';


void main() {
  runApp(MyApp());
}

class  MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    SearchScreen(),
    ProfileScreen(), // Added profile screen
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<String> images = [
    'assets/images/MuhumuzaImage.png',
    'assets/images/MuhumuzaImage.png',
    'assets/images/MuhumuzaImage.png',
    'assets/images/MuhumuzaImage.png',
    'assets/images/MuhumuzaImage.png',
    'assets/images/MuhumuzaImage.png',
  ];

  final List<String> names = [
    'Wadge Waren',
    'John Doe',
    'Jane Smith',
    'Jane Smith',
    'Jane Smith',
    'Jane Smith',
  ];

  final List<String> salaries = [
    '\$70,000',
    '\$80,000',
    '\$60,000',
    '\$75,000',
    '\$75,000',
    '\$75,000',
  ];

  final List<String> descriptions = [
    'Software Engineer at XYZ Corp',
    'Graphic Designer at ABC Ltd',
    'Tech Support Specialist at QRS Inc',
    'Senior Developer at LMN Co',
    'Senior Developer at LMN Co',
    'Senior Developer at LMN Co',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(
          //     'Team Members',
          //     style: TextStyle(
          //       fontSize: 18.0,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
        const   SizedBox(height: 20),
          Container(
            height: 170,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return CardWidget(
                  imagePath: images[index],
                  name: names[index],
                  occupation: descriptions[index],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 16.0,
              runSpacing: 16.0,
              children: List.generate(
                images.length,
                (index) => DescriptiveContainer(
                  imagePath: images[index],
                  name: names[index],
                  salary: salaries[index], // Pass salary parameter
                  description: descriptions[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _searchQuery = '';

  // Sample data for search results
  final List<Map<String, String>> searchResults = [
    {
      'imagePath': 'assets/images/th.jpg',
      'name': 'Wadge Waren',
      'occupation': 'Software Engineer at XYZ Corp',
    },
    {
      'imagePath': 'assets/images/th.jpg',
      'name': 'John Doe',
      'occupation': 'Graphic Designer at ABC Ltd',
    },
    {
      'imagePath': 'assets/images/th.jpg',
      'name': 'Jane Smith',
      'occupation': 'Tech Support Specialist at QRS Inc',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration:const  InputDecoration(
                labelText: 'Search',
                hintText: 'Enter a name or occupation',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                  // Implement search logic here if needed
                });
              },
            ),
         const    SizedBox(height: 16.0),
            Text(
              'Search Results for: $_searchQuery',
              style:const  TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
           const  SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  return SearchResultCard(
                    imagePath: searchResults[index]['imagePath']!,
                    name: searchResults[index]['name']!,
                    occupation: searchResults[index]['occupation']!,
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

  const SearchResultCard({
    required this.imagePath,
    required this.name,
    required this.occupation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding:const  EdgeInsets.all(8.0),
      margin:const  EdgeInsets.only(bottom: 16.0),
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
                Center(
                  child: Text(
                    name,
                    style:const  TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              const   SizedBox(height: 4.0),
                Center(
                  child: Text(
                    occupation,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle booking action
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 143, 34, 246)),
                        minimumSize: MaterialStateProperty.all(Size.fromHeight(50)),
                      ),
                      child:const  Text(
                        'Book',
                        style: TextStyle(color: Colors.white),
                      ),
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

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const  Text('Profile'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        const   SizedBox(height: 40.0), // Adjust spacing as needed
          const CircleAvatar(
            radius: 80.0,
            backgroundImage: AssetImage(
              'assets/images/th.jpg', // Replace with actual image path
            ),
          ),
          SizedBox(height: 24.0),
          Text(
            'John Doe',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            'john.doe@example.com', // Replace with actual email
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[600],
            ),
          ),
          Expanded(child: SizedBox()), // Spacer to push button to the bottom
          Container(
            margin: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
            width: double.infinity, // Adjust width to fill available space
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfileScreen(), // Navigate to EditProfileScreen
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 143, 34, 246)),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Edit Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        padding:const  EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          const   SizedBox(height: 20.0),
          const   CircleAvatar(
              radius: 80.0,
              backgroundImage: AssetImage(
                'assets/images/profile_image.jpg', // Replace with actual image path
              ),
            ),
          const   SizedBox(height: 20.0),
            // Center the input fields horizontally
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Username:',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 8.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter your username', // Optional: Add hint text
                    border: OutlineInputBorder(), // Optional: Add border styling
                    // You can customize other properties like prefixIcon, suffixIcon, etc.
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Phone Number:',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 8.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter your phone number', // Optional: Add hint text
                    border: OutlineInputBorder(), // Optional: Add border styling
                    // You can customize other properties like prefixIcon, suffixIcon, etc.
                  ),
                ),
              ],
            ),
         const    SizedBox(height: 100.0), // Adjust spacing as needed
            // Ensure the button stretches to match the width of the input fields
            SizedBox(
              width: double.infinity,
              height: 65,
              child: ElevatedButton(
                onPressed: () {
                  // Handle submit action
                  Navigator.pop(context); // Navigate back to previous screen
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 143, 34, 246)), // Use RGBA color
                ),
                child:const  Text(
                  'Submit',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 16.0), // Add additional space below the button
          ],
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String imagePath;
  final String name;
  final String occupation;

  CardWidget({
    required this.imagePath,
    required this.name,
    required this.occupation,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: 30.0,
            ),
            const SizedBox(height: 8.0),
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12.0),
            ),
            SizedBox(height: 4.0),
            Text(
              occupation,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class DescriptiveContainer extends StatelessWidget {
  final String imagePath;
  final String name;
  final String salary; // Add salary parameter
  final String description;

  DescriptiveContainer({
    required this.imagePath,
    required this.name,
    required this.salary, // Add salary parameter
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.blue, width: 2.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
         const  SizedBox(height: 8.0),
          Center(
            child: Text(
              name,
              style:const  TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
         const  SizedBox(height: 4.0),
          Center(
            child: Text(
              salary, // Display salary
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        const   SizedBox(height: 4.0),
          Center(
            child: Text(
              description,
              textAlign: TextAlign.center,
            ),
          ),
        const   SizedBox(height: 4.0),
          SizedBox(
            width: double.infinity,
            child: SizedBox(
              height: 49,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        imagePath: imagePath,
                        name: name,
                        salary: salary, // Pass salary parameter
                        description: description,
                      ),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 143, 34, 246)),
                ),
                child: const Text(
                  'Contact us',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
