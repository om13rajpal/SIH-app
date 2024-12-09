import 'package:drdo/components/background.dart';
import 'package:drdo/components/button.dart';
import 'package:drdo/components/input.dart';
import 'package:drdo/components/text.dart';
import 'package:drdo/homepage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataForm extends StatefulWidget {
  const DataForm({super.key});

  @override
  State<DataForm> createState() => _FormState();
}

class _FormState extends State<DataForm> {
  int _currentStep = 0;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  int? _selectedValue;

  final _formKey = GlobalKey<FormState>();

  DateTime? _selectedDate;
  DateTime? selectedDate;

  final List<Map<String, TextEditingController>> _skills = [];

  void _addSkill() {
    setState(() {
      _skills.add({
        "skill": TextEditingController(),
        "years": TextEditingController(),
      });
    });
  }

  void _removeSkill(int index) {
    setState(() {
      _skills[index]["skill"]?.dispose();
      _skills[index]["years"]?.dispose();
      _skills.removeAt(index);
    });
  }

  @override
  void dispose() {
    for (var skill in _skills) {
      skill["skill"]?.dispose();
      skill["years"]?.dispose();
    }
    for (var experience in _experienceList) {
      for (var controller in experience.values) {
        controller.dispose();
      }
    }
    for (var education in _educationList) {
      for (var controller in education.values) {
        controller.dispose();
      }
    }
    super.dispose();
  }

  void _onStepContinue() {
    if (_currentStep < 2) {
      setState(() {
        _currentStep++;
      });
    } else {
      if (_formKey.currentState?.validate() ?? false) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Expert added successfully!')),
        );

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Homepage(),
            ));
      }
    }
  }

  void _onStepCancel() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectDate(
    BuildContext context,
    TextEditingController controller,
  ) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        controller.text = DateFormat('dd/MM/yyyy').format(pickedDate);
      });
    }
  }

  void _addExperience() {
    setState(() {
      _experienceList.add({
        "position": TextEditingController(),
        "department": TextEditingController(),
        "startDate": TextEditingController(),
        "endDate": TextEditingController(),
        "companyName": TextEditingController(),
      });
    });
  }

  final List<Map<String, TextEditingController>> _experienceList = [];
  final List<Map<String, TextEditingController>> _educationList = [];

  void _removeExperience(int index) {
    setState(() {
      for (var controller in _experienceList[index].values) {
        controller.dispose();
      }
      _experienceList.removeAt(index);
    });
  }

  void _addEducation() {
    setState(() {
      _educationList.add({
        "degree": TextEditingController(),
        "institution": TextEditingController(),
        "startDate": TextEditingController(),
        "endDate": TextEditingController(),
        "linkedin": TextEditingController(),
      });
    });
  }

  void _removeEducation(int index) {
    setState(() {
      for (var controller in _educationList[index].values) {
        controller.dispose();
      }
      _educationList.removeAt(index);
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Form(
          key: _formKey,
          child: Stepper(
            type: StepperType.horizontal,
            currentStep: _currentStep,
            onStepContinue: _onStepContinue,
            onStepCancel: _onStepCancel,
            steps: [
              Step(
                title: const Text('Personal'),
                content: Column(
                  children: [
                    Input(
                      controller: _nameController,
                      hintText: "Om Rajpal",
                      obscureText: false,
                      labelText: "Name",
                      icon: const Icon(
                        Icons.person,
                        size: 17,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Input(
                      controller: _emailController,
                      hintText: "om@gmail.com",
                      obscureText: false,
                      labelText: "Email",
                      icon: const Icon(
                        Icons.email,
                        size: 17,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Input(
                      controller: _phoneController,
                      hintText: "8950291327",
                      obscureText: false,
                      labelText: "Mobile Number",
                      icon: const Icon(
                        Icons.phone,
                        size: 17,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: 1,
                              groupValue: _selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  _selectedValue = value;
                                });
                              },
                            ),
                            const TextData(
                              text: "Male",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 2,
                              groupValue: _selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  _selectedValue = value;
                                });
                              },
                            ),
                            const TextData(
                              text: "Female",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            _selectedDate != null
                                ? DateFormat('dd/MM/yyyy')
                                    .format(_selectedDate!)
                                : "Select your DoB",
                            style: const TextStyle(
                                fontSize: 14,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ),
                        Button(
                            onPressed: () => selectDate(context),
                            text: "Select Date",
                            width: 110)
                      ],
                    ),
                    const SizedBox(height: 20),
                    Button(
                        onPressed: _addSkill, text: "Add Skills", width: 100),
                    const SizedBox(height: 20),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: _skills.length,
                      itemBuilder: (context, index) {
                        final skillController = _skills[index]["skill"]!;
                        final yearsofexperiencecontroller =
                            _skills[index]["years"]!;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Row(
                            children: [
                              Expanded(
                                  child: TextField(
                                controller: skillController,
                                decoration: const InputDecoration(
                                  labelText: "Skill",
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                ),
                              )),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  controller: yearsofexperiencecontroller,
                                  decoration: const InputDecoration(
                                    labelText: "Years of experience",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon:
                                    const Icon(Icons.close, color: Colors.red),
                                onPressed: () => _removeSkill(index),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
                isActive: _currentStep >= 0,
              ),
              Step(
                title: const Text('Experience'),
                content: Column(
                  children: [
                    Input(
                      controller: _nameController,
                      hintText: "Tech",
                      obscureText: false,
                      labelText: "Current Department",
                      icon: const Icon(
                        Icons.person,
                        size: 17,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Input(
                      controller: _emailController,
                      hintText: "Software Developer",
                      obscureText: false,
                      labelText: "Current Position",
                      icon: const Icon(
                        Icons.email,
                        size: 17,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Button(
                        onPressed: _addExperience,
                        text: "Add Experience",
                        width: 150),
                    const SizedBox(height: 20),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: _experienceList.length,
                      itemBuilder: (context, index) {
                        final experience = _experienceList[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xff9CAFB7)),
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  TextField(
                                    controller: experience["position"],
                                    decoration: InputDecoration(
                                        prefixIconColor: const Color.fromARGB(
                                            255, 43, 43, 43),
                                        hintText: "Position",
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              color: Colors.black),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              color: Colors.black),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              color: Colors.black),
                                        ),
                                        hintStyle: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 59, 59, 59),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                  const SizedBox(height: 10),
                                  TextField(
                                    controller: experience["department"],
                                    decoration: InputDecoration(
                                        prefixIconColor: const Color.fromARGB(
                                            255, 43, 43, 43),
                                        hintText: "Department",
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              color: Colors.black),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              color: Colors.black),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              color: Colors.black),
                                        ),
                                        hintStyle: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 59, 59, 59),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                  const SizedBox(height: 10),
                                  TextField(
                                    controller: experience["companyName"],
                                    decoration: InputDecoration(
                                        prefixIconColor: const Color.fromARGB(
                                            255, 43, 43, 43),
                                        hintText: "Company Name",
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              color: Colors.black),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              color: Colors.black),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              color: Colors.black),
                                        ),
                                        hintStyle: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 59, 59, 59),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          controller: experience["startDate"],
                                          readOnly: true,
                                          decoration: InputDecoration(
                                            prefixIcon: const Icon(
                                                Icons.calendar_today,
                                                color: Color.fromARGB(
                                                    255, 43, 43, 43)),
                                            hintText: "Start Date",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: const BorderSide(
                                                  color: Colors.black),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: const BorderSide(
                                                  color: Colors.black),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: const BorderSide(
                                                  color: Colors.black),
                                            ),
                                            hintStyle: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 59, 59, 59),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            suffixIcon: IconButton(
                                              icon: const Icon(
                                                  Icons.calendar_today),
                                              onPressed: () => _selectDate(
                                                context,
                                                experience["startDate"]!,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: TextField(
                                          controller: experience["endDate"],
                                          readOnly: true,
                                          decoration: InputDecoration(
                                            prefixIcon: const Icon(
                                                Icons.calendar_today,
                                                color: Color.fromARGB(
                                                    255, 43, 43, 43)),
                                            hintText: "End Date",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: const BorderSide(
                                                  color: Colors.black),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: const BorderSide(
                                                  color: Colors.black),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: const BorderSide(
                                                  color: Colors.black),
                                            ),
                                            hintStyle: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 59, 59, 59),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            suffixIcon: IconButton(
                                              icon: const Icon(
                                                  Icons.calendar_today),
                                              onPressed: () => _selectDate(
                                                context,
                                                experience["endDate"]!,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: IconButton(
                                  icon: const Icon(Icons.close,
                                      color: Colors.red),
                                  onPressed: () => _removeExperience(index),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
                isActive: _currentStep >= 1,
              ),
              Step(
                title: const Text('Education'),
                content: Column(
                  children: [
                    Button(onPressed: _addEducation, text: "Add Education", width: 150),
                    const SizedBox(height: 20),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: _educationList.length,
                      itemBuilder: (context, index) {
                        final education = _educationList[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xff9CAFB7),
                          ),
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  TextField(
                                    controller: education["degree"],
                                    decoration: InputDecoration(
                                      prefixIconColor:
                                          const Color.fromARGB(255, 43, 43, 43),
                                      hintText: "Degree",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                            color: Colors.black),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                            color: Colors.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                            color: Colors.black),
                                      ),
                                      hintStyle: const TextStyle(
                                        color: Color.fromARGB(255, 59, 59, 59),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  TextField(
                                    controller: education["institution"],
                                    decoration: InputDecoration(
                                      prefixIconColor:
                                          const Color.fromARGB(255, 43, 43, 43),
                                      hintText: "Institution",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                            color: Colors.black),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                            color: Colors.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                            color: Colors.black),
                                      ),
                                      hintStyle: const TextStyle(
                                        color: Color.fromARGB(255, 59, 59, 59),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          controller: education["startDate"],
                                          readOnly: true,
                                          decoration: InputDecoration(
                                            prefixIcon: const Icon(
                                                Icons.calendar_today,
                                                color: Color.fromARGB(
                                                    255, 43, 43, 43)),
                                            hintText: "Start Date",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: const BorderSide(
                                                  color: Colors.black),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: const BorderSide(
                                                  color: Colors.black),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: const BorderSide(
                                                  color: Colors.black),
                                            ),
                                            hintStyle: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 59, 59, 59),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            suffixIcon: IconButton(
                                              icon: const Icon(
                                                  Icons.calendar_today),
                                              onPressed: () => _selectDate(
                                                  context,
                                                  education["startDate"]!),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: TextField(
                                          controller: education["endDate"],
                                          readOnly: true,
                                          decoration: InputDecoration(
                                            prefixIcon: const Icon(
                                                Icons.calendar_today,
                                                color: Color.fromARGB(
                                                    255, 43, 43, 43)),
                                            hintText: "End Date",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: const BorderSide(
                                                  color: Colors.black),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: const BorderSide(
                                                  color: Colors.black),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: const BorderSide(
                                                  color: Colors.black),
                                            ),
                                            hintStyle: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 59, 59, 59),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            suffixIcon: IconButton(
                                              icon: const Icon(
                                                  Icons.calendar_today),
                                              onPressed: () => _selectDate(
                                                  context,
                                                  education["endDate"]!),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  TextField(
                                    controller: education["linkedin"],
                                    decoration: InputDecoration(
                                      prefixIconColor:
                                          const Color.fromARGB(255, 43, 43, 43),
                                      hintText: "Field",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                            color: Colors.black),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                            color: Colors.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                            color: Colors.black),
                                      ),
                                      hintStyle: const TextStyle(
                                        color: Color.fromARGB(255, 59, 59, 59),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: IconButton(
                                  icon: const Icon(Icons.close,
                                      color: Colors.red),
                                  onPressed: () => _removeEducation(index),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
                isActive: _currentStep >= 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
