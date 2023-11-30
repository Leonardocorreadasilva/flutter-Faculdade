import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LoginPage(),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Usuário'),
              keyboardType: TextInputType.text,
              autocorrect: false,
              autofocus: true,
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(labelText: 'Senha'),
              obscureText: true,
              autocorrect: false,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lógica para processar o login
                // Ao fazer login com sucesso, navegue para a HomeScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Text('Login'),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Navegue para a tela de cadastro de novo usuário
                // Aqui você pode implementar a navegação para a tela de cadastro
              },
              child: Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> _tableData = [];

  TextEditingController _registrationController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _salaryController = TextEditingController();
  TextEditingController _roleController = TextEditingController();
  TextEditingController _departmentController = TextEditingController();

  void _addToTable() {
    final registration = _registrationController.text;
    final firstName = _firstNameController.text;
    final lastName = _lastNameController.text;
    final email = _emailController.text;
    final phoneNumber = _phoneNumberController.text;
    final salary = _salaryController.text;
    final role = _roleController.text;
    final department = _departmentController.text;

    final dataToAdd = {
      'Registration': registration,
      'First Name': firstName,
      'Last Name': lastName,
      'Email': email,
      'Phone Number': phoneNumber,
      'Salary': salary,
      'Role': role,
      'Department': department,
    };

    setState(() {
      _tableData.add(dataToAdd);
    });

    // Limpar os campos do formulário após adicionar à tabela
    _registrationController.clear();
    _firstNameController.clear();
    _lastNameController.clear();
    _emailController.clear();
    _phoneNumberController.clear();
    _salaryController.clear();
    _roleController.clear();
    _departmentController.clear();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _registrationController,
                decoration: InputDecoration(labelText: 'Matrícula'),
                keyboardType: TextInputType.text,
                autocorrect: false,
              ),
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(labelText: 'Nome'),
                keyboardType: TextInputType.text,
                autocorrect: false,
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(labelText: 'Sobrenome'),
                keyboardType: TextInputType.text,
                autocorrect: false,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
              ),
              TextFormField(
                controller: _phoneNumberController,
                decoration: InputDecoration(labelText: 'Telefone/Celular'),
                keyboardType: TextInputType.phone,
                autocorrect: false,
              ),
              TextFormField(
                controller: _salaryController,
                decoration: InputDecoration(labelText: 'Salario'),
                keyboardType: TextInputType.number,
                autocorrect: false,
              ),
              TextFormField(
                controller: _roleController,
                decoration: InputDecoration(labelText: 'Cargo'),
                keyboardType: TextInputType.text,
                autocorrect: false,
              ),
              TextFormField(
                controller: _departmentController,
                decoration: InputDecoration(labelText: 'Departamento'),
                keyboardType: TextInputType.text,
                autocorrect: false,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: _addToTable,
                child: Text('Cadastrar'),
              ),

              SizedBox(height: 20),
              Text(
                'Dados Cadastrados:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Expanded(
                child: DataTableWidget(tableData: _tableData),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class DataTableWidget extends StatelessWidget {
  final List<Map<String, dynamic>> tableData;

  const DataTableWidget({required this.tableData});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: tableData.isNotEmpty,
      child: tableData.isNotEmpty
          ? SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: tableData.first.keys
              .map((key) => DataColumn(label: Text(key)))
              .toList(),
          rows: tableData
              .map(
                (data) => DataRow(
              cells: data.entries
                  .map(
                    (entry) => DataCell(Text(entry.value.toString())),
              )
                  .toList(),
            ),
          )
              .toList(),
        ),
      )
          : Text(
        'Nenhum dado disponível',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}

