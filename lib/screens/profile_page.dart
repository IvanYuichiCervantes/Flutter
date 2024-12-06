import 'package:flutter/material.dart';
import '../models/students.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retrieve student data passed from HomePage
    final Student student = ModalRoute.of(context)!.settings.arguments as Student;

    return Scaffold(
      appBar: AppBar(
        title: Text(student.name),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Navigate to EditStudentPage and pass the student object
              Navigator.pushNamed(
                context,
                '/edit',
                arguments: student,
              ).then((_) {
                // Optionally, you can use setState() in the parent widget to refresh the list of students after editing
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              // Delete logic here, you should have a mechanism to remove the student
              _showDeleteConfirmationDialog(context, student);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(student.profileImage),
            ),
            SizedBox(height: 16),
            Text('Name: ${student.name}', style: TextStyle(fontSize: 20)),
            Text('Age: ${student.age}', style: TextStyle(fontSize: 16)),
            Text('Course: ${student.course}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, Student student) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Student'),
          content: Text('Are you sure you want to delete ${student.name}?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Here you should remove the student from the data list
                // Since we don't have access to the parent widget here, 
                // you need to pass the logic to delete the student from the parent widget
                Navigator.pop(context); // Close the dialog
                // Call the delete function in the parent widget or handle the deletion
                // For example: deleteStudent(student.id);
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
