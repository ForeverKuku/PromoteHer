// team_members_page.dart

import 'package:flutter/material.dart';
import 'package:promote_her_app/registration_screens/home_screen.dart';



class MyApp extends StatelessWidget {
  final List<String> images = [
    'assets/images/th.jpg',
    'assets/images/th.jpg',
    // 'assets/images/MuhumuzaImage.png',
    'assets/images/th.jpg',
    'assets/images/th.jpg',
    'assets/images/th.jpg',
  ];

  final List<String> names = [
    'Wadge Waren',
    'John Doe',
    'Jane Smith',
    'Jane Smith',
    'Jane Smith',
    'Jane Smith',
  ];

  final List<String> occupations = [
    'Software',
    'Designer',
    'Tech Support',
    'Software Engineer',
    'Software Engineer',
    'Software Engineer',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding:EdgeInsets.all(8.0),
                child:   Text(
                  'Team Members',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return CardWidget(
                      imagePath: images[index],
                      name: names[index],
                      occupation: occupations[index],
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
                      description: 'This is a description of ${names[index]}.', salary: '',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
