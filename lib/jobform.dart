import 'package:drdo/components/background.dart';
import 'package:drdo/components/button.dart';
import 'package:drdo/components/input.dart';
import 'package:drdo/joblist.dart';
import 'package:flutter/material.dart';

class JobForm extends StatefulWidget {
  @override
  _JobFormState createState() => _JobFormState();
}

class _JobFormState extends State<JobForm> {
  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController durationController = TextEditingController();

  String? jobType;
  String? locationType;
  List<Map<String, TextEditingController>> keySkills = [];

  final List<String> jobTypeOptions = ['Full-Time', 'Part-Time', 'Internship'];
  final List<String> locationTypeOptions = ['Remote', 'On-Site', 'Hybrid'];

  void addSkill() {
    setState(() {
      keySkills.add({
        'skill': TextEditingController(),
        'description': TextEditingController(),
      });
    });
  }

  void removeSkill(int index) {
    setState(() {
      keySkills.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Job Form")),
      body: Background(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Input(
                    controller: jobTitleController,
                    hintText: "Node.js",
                    obscureText: false,
                    labelText: "Title",
                    icon: const Icon(Icons.abc)),
                const SizedBox(height: 10),
        
                Input(
                    controller: descriptionController,
                    hintText: "this job is for the backend developer",
                    obscureText: false,
                    labelText: "Description",
                    icon: const Icon(Icons.description)),
                const SizedBox(height: 10),
        
                Input(
                    controller: departmentController,
                    hintText: "Defence",
                    obscureText: false,
                    labelText: "Department",
                    icon: const Icon(Icons.local_fire_department)),
                const SizedBox(height: 10),
        
                DropdownButtonFormField<String>(
                  value: jobType,
                  items: jobTypeOptions
                      .map((type) => DropdownMenuItem(
                            value: type,
                            child: Text(type),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      jobType = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Job Type",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
        
                DropdownButtonFormField<String>(
                  value: locationType,
                  items: locationTypeOptions
                      .map((type) => DropdownMenuItem(
                            value: type,
                            child: Text(type),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      locationType = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Location Type",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
        
                Input(
                    controller: locationController,
                    hintText: "Delhi",
                    obscureText: false,
                    labelText: "Location",
                    icon: const Icon(Icons.location_city)),
                const SizedBox(height: 10),
        
                TextField(
                  controller: durationController,
                  decoration: InputDecoration(
                    hintText: "Duration",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
        
                const Text(
                  "Key Skills",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Column(
                  children: keySkills.map((skill) {
                    final skillController = skill['skill'];
                    final descriptionController = skill['description'];
        
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: skillController,
                              decoration: InputDecoration(
                                hintText: "Skill",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              controller: descriptionController,
                              decoration: InputDecoration(
                                hintText: "Description",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.remove_circle,
                                color: Colors.red),
                            onPressed: () {
                              removeSkill(keySkills.indexOf(skill));
                            },
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                Button(onPressed: addSkill, text: "Add Key Skill", width: 200),
                const SizedBox(height: 20),
        
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Job added successfully!')),
                      );
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const JobList(),
                          ));
                    },
                    child: const Text("Submit"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
