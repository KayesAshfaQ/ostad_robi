import 'dart:io';

void main() {
  List<Map<String, dynamic>> students = [];

  while (true) {
    print('\n--- Student Management System ---');
    print('1. Add Student(s)');
    print('2. Remove a Student');
    print('3. Search for a Student');
    print('4. View All Students');
    print('5. Exit');
    stdout.write('Select an option (1-5): ');

    String? choice = stdin.readLineSync()?.trim();

    switch (choice) {
      case '1':
        while (true) {
          stdout.write('\nEnter Student Name: ');
          String name = stdin.readLineSync()?.trim() ?? 'Unknown Student';

          stdout.write('Enter Student Id: ');
          int id =
              int.tryParse(stdin.readLineSync()?.trim() ?? 'Unknown Id') ?? 0;

          stdout.write('Enter Student Department: ');
          String department =
              stdin.readLineSync()?.trim() ?? 'Unknown Department';

          // add student to the list
          students.add({'name': name, 'id': id, 'department': department});
          print('Student added successfully!');

          stdout.write(
            'Type "done" or "finish" to stop adding students (or press Enter to add another): ',
          );
          String? exitStr = stdin.readLineSync()?.trim();

          if (exitStr != null &&
              (exitStr.toLowerCase() == 'done' ||
                  exitStr.toLowerCase() == 'finish')) {
            break;
          }
        }
        break;

      case '2':
        stdout.write('\nEnter Student ID to remove: ');
        int? removeId = int.tryParse(stdin.readLineSync()?.trim() ?? '');

        if (removeId != null) {
          int initialCount = students.length;
          students.removeWhere((s) => s['id'] == removeId);

          if (students.length < initialCount) {
            print('Student with ID $removeId removed successfully.');
          } else {
            print('No student found with ID $removeId.');
          }
        } else {
          print('Invalid ID entered.');
        }
        break;

      case '3':
        stdout.write('\nEnter student name or ID to search: ');
        String? query = stdin.readLineSync()?.trim();

        if (query != null && query.isNotEmpty) {
          var results = students.where((s) {
            return s['name'].toString().toLowerCase().contains(
                  query.toLowerCase(),
                ) ||
                s['id'].toString() == query;
          }).toList();

          if (results.isEmpty) {
            print('No student found matching "$query".');
          } else {
            print('Found ${results.length} student(s):');
            for (var student in results) {
              print(
                '  - Name: ${student['name']}, ID: ${student['id']}, Department: ${student['department']}',
              );
            }
          }
        }
        break;

      case '4':
        if (students.isEmpty) {
          print('\nNo students enrolled yet.');
        } else {
          print('\n--- Enrolled Students ---');
          for (var student in students) {
            print(
              'Name: ${student['name']}, ID: ${student['id']}, Department: ${student['department']}',
            );
          }
        }
        break;

      case '5':
        print('Exiting program...');
        return; // Exit the main function to terminate

      default:
        print('Invalid choice. Please enter a number between 1 and 5.');
    }
  }
}
