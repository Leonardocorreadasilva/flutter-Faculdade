import 'package:flutter/material.dart';

class EmployeeForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _registrationController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _salaryController = TextEditingController();
  TextEditingController _roleController = TextEditingController();
  TextEditingController _departmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _registrationController,
                decoration: InputDecoration(labelText: 'Registration'),
                validator: (value) {

                  return null;
                },
              ),
              // Outros TextFormField e botão de envio continuam aqui...
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {

                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
