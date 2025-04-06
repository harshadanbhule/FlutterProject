import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:tutorial1/location.dart';
import 'package:tutorial1/locationdetail.dart';
import 'package:intl_phone_field/intl_phone_field.dart'; // Added package

class UserFormPage extends StatefulWidget {
  @override
  _UserFormPageState createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  String? phoneNumberWithCode; // Will hold the full phone number

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() && phoneNumberWithCode != null) {
      String firstName = _firstNameController.text;
      String lastName = _lastNameController.text;

      print("First Name: $firstName");
      print("Last Name: $lastName");
      print("Phone Number: $phoneNumberWithCode");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Form submitted successfully!")),
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LocationMapPage(
            firstName: firstName,
            lastName: lastName,
            phoneNumber: phoneNumberWithCode!, // Pass the phone number
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Info Form')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(labelText: 'First Name'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter First Name' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(labelText: 'Last Name'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter Last Name' : null,
              ),
              SizedBox(height: 16),
              IntlPhoneField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                initialCountryCode: 'IN',
                onChanged: (phone) {
                  phoneNumberWithCode = phone.completeNumber;
                },
                validator: (phone) =>
                    phone == null || phone.number.isEmpty ? 'Enter Phone Number' : null,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
