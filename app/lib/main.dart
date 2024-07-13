import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BloodDonorForm(),
    );
  }
}

class BloodDonorForm extends StatefulWidget {
  @override
  _BloodDonorFormState createState() => _BloodDonorFormState();
}

class _BloodDonorFormState extends State<BloodDonorForm> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String firstName = '';
  String lastName = '';
  String gender = '';
  String age = '';
  String bloodGroup = '';
  String contactNumber = '';
  String lastDonationDate = '';
  String medicalCondition = '';
  bool isSmoker = false;
  bool willingToDonate = false;
  String nearestHospital = '';
  bool agreeToStoreData = false;

  Widget _buildTextField(String labelText, Function(String) onChanged) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        style: TextStyle(color: Colors.white, fontSize: 15),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.white),
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white, width: 2.0),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
        ),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildRadioListTile(String title, String value, String groupValue,
      Function(String?) onChanged) {
    return ListTile(
      title: Text(title, style: TextStyle(color: Colors.white, fontSize: 15)),
      leading: Radio<String>(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildRadioGroup(String label, List<String> options, String groupValue,
      Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15)),
        Container(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: options
                .map((option) =>
                    _buildRadioListTile(option, option, groupValue, onChanged))
                .toList(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Blood Donor Registration',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 85, 1, 1),
              const Color.fromARGB(255, 62, 1, 0)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildTextField(
                  'Email ID',
                  (value) => setState(() {
                    email = value;
                  }),
                ),
                SizedBox(
                  height: 10,
                ),
                _buildTextField(
                  'Name of the Donor',
                  (value) => setState(() {
                    firstName = value;
                  }),
                ),
                SizedBox(
                  height: 10,
                ),
                _buildTextField(
                  'Name of the Father',
                  (value) => setState(() {
                    lastName = value;
                  }),
                ),
                SizedBox(
                  height: 30,
                ),
                _buildRadioGroup(
                  'Gender',
                  ['Male', 'Female', 'Non-Binary'],
                  gender,
                  (value) => setState(() {
                    gender = value!;
                  }),
                ),
                SizedBox(
                  height: 30,
                ),
                _buildTextField(
                  'Age',
                  (value) => setState(() {
                    age = value;
                  }),
                ),
                SizedBox(
                  height: 30,
                ),
                _buildRadioGroup(
                  'Blood Group',
                  ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'],
                  bloodGroup,
                  (value) => setState(() {
                    bloodGroup = value!;
                  }),
                ),
                SizedBox(
                  height: 30,
                ),
                _buildTextField(
                  'Contact Number',
                  (value) => setState(() {
                    contactNumber = value;
                  }),
                ),
                SizedBox(
                  height: 10,
                ),
                _buildTextField(
                  'Last Date of Donation',
                  (value) => setState(() {
                    lastDonationDate = value;
                  }),
                ),
                SizedBox(
                  height: 30,
                ),
                _buildRadioGroup(
                  'Do you have any medical conditions?',
                  ['Yes', 'No'],
                  medicalCondition,
                  (value) => setState(() {
                    medicalCondition = value!;
                  }),
                ),
                SizedBox(
                  height: 30,
                ),
                _buildRadioGroup(
                  'Do you smoke?',
                  ['Yes', 'No'],
                  isSmoker ? 'Yes' : 'No',
                  (value) => setState(() {
                    isSmoker = value == 'Yes';
                  }),
                ),
                SizedBox(
                  height: 30,
                ),
                _buildRadioGroup(
                  'Are you willing to donate in case of an emergency?',
                  ['Yes', 'No'],
                  willingToDonate ? 'Yes' : 'No',
                  (value) => setState(() {
                    willingToDonate = value == 'Yes';
                  }),
                ),
                SizedBox(
                  height: 30,
                ),
                _buildTextField(
                  'Nearest Hospital',
                  (value) => setState(() {
                    nearestHospital = value;
                  }),
                ),
                SizedBox(
                  height: 30,
                ),
                _buildRadioGroup(
                  'Do you agree to store your data for future reference?',
                  ['Yes', 'No'],
                  agreeToStoreData ? 'Yes' : 'No',
                  (value) => setState(() {
                    agreeToStoreData = value == 'Yes';
                  }),
                ),
                SizedBox(height: 20),
                Center(
                  child: Container(
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Process data
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Processing Data')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 130, 9, 0),
                        shadowColor: Colors.black,
                        elevation: 30,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
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
