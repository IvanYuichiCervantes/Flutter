import 'package:flutter/material.dart';
import '../models/students.dart';

class HomePage extends StatelessWidget {
  final List<Student> students = [
    Student(
      id: 1,
      name: 'John Doe',
      age: 20,
      course: 'BSIT',
      profileImage: 'assets/images/student1.png',
    ),
    Student(
      id: 2,
      name: 'Jane Smith',
      age: 22,
      course: 'BSCS',
      profileImage: 'assets/images/student2.png',
    ),
    Student(
      id: 2,
      name: 'Jarred Gaa',
      age: 69,
      course: 'HM',
      profileImage: 'assets/images/student3.png',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Students')),
      body: ListView.builder(
  itemCount: students.length,
  itemBuilder: (context, index) {
    final student = students[index];
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(student.profileImage),
        ),
        title: Text(student.name),
        subtitle: Text('${student.course} (${student.age} years old)'),
        onTap: () {
          Navigator.pushNamed(
            context,
            '/profile',
            arguments: student, // Pass the student to ProfilePage
          );
        },
      ),
    );
  },
)

    );
  }
}
