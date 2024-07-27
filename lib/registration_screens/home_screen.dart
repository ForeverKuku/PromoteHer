import 'package:flutter/material.dart';
import 'package:promote_her_app/home_cards/detial_screen.dart';


class HomeScreen extends StatelessWidget {
 HomeScreen({super.key});

  final List<String> images = [
    'assets/images/cloud computing.jpg',
    'assets/images/data sceince.jpg',
    'assets/images/marketing.jpg',
    'assets/images/programming.jpg',
    'assets/images/ui ux.jpg',
    'assets/images/nurse.jpg',
  ];

  final List<String> names = [
    'Isador',
    'Mary Doe',
    'Janette',
    'Clarisse',
    'Alice',
    'Yvette',
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
    'Cloud computing  at XYZ Corp',
    'Data science at ABC Ltd Corp',
    'Marketing at Rwanda air Corp ',
    'Senior Developer at LMN Corp',
    'UI & UX Designer at LMN Corp',
    'Project Manager at LMN Corp',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                  salary: salaries[index],
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
           const  SizedBox(height: 8.0),
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12.0),
            ),
          const   SizedBox(height: 4.0),
            Text(
              occupation,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
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
  final String salary;
  final String description;

  DescriptiveContainer({
    required this.imagePath,
    required this.name,
    required this.salary,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding:const  EdgeInsets.all(8.0),
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
        const   SizedBox(height: 8.0),
          Center(
            child: Text(
              name,
              style: const  TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        const   SizedBox(height: 4.0),
          Center(
            child: Text(
              salary,
              style:const  TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
       const    SizedBox(height: 4.0),
          Center(
            child: Text(
              description,
              textAlign: TextAlign.center,
            ),
          ),
         const  SizedBox(height: 4.0),
          Container(
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
                        salary: salary,
                        description: description,
                      ),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 143, 34, 246)),
                ),
                child: const  Text(
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
