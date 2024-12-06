  // lib/models/students.dart
  class Student {
    final int id;
    final String name;
    final int age;
    final String course;
    final String profileImage;

    Student({
      required this.id,
      required this.name,
      required this.age,
      required this.course,
      required this.profileImage,
    });

    factory Student.fromJson(Map<String, dynamic> json) {
      return Student(
        id: json['id'],
        name: json['name'],
        age: json['age'],
        course: json['course'],
        profileImage: json['profileImage'],
      );
    }
  }
