import 'package:flutter/material.dart';
// import 'package:helloazisrpl2/main.dart';

void main() {
  runApp( FormulirPage());
}

class FormulirPage extends StatefulWidget {
   FormulirPage({super.key});

  @override
  State<FormulirPage> createState() => _FormulirPageState();
}

class _FormulirPageState extends State<FormulirPage> {
  // memberikan 
  final _formkey = GlobalKey<FormState>();
  // memberi variable (wadah) untuk textfield
  final TextEditingController _namecontroller = TextEditingController();
  String _outputName = '';
  @override
    void dispose() {
      // setelah di submit nilai dari textfield akan terhapus
      _namecontroller.dispose();
      super.dispose();
  }

  void _submitForm() {
    print('Nama Lengkap: ${_namecontroller.text}');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Nama Lengkap ${_namecontroller.text}")),
    );
    setState(() {
      _outputName = _namecontroller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(title: const Text('Formulir Data Diri')),
        body: Center(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: _namecontroller,
                    decoration: InputDecoration(
                      labelText: 'Ketik Nama Anda',
                      border: OutlineInputBorder(),
                    ),
                  )
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                  print('Name: ${_namecontroller.text}');
                  },
                  child: const Text('Get Name'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                  _submitForm();
                  },
                  child: const Text('Kirim'),
                ),
                Text(
                 ' Nama: ${_outputName.isEmpty ? "-" : _outputName}',
                 style: const TextStyle(fontSize: 16),
                )
              ]
            ),
          ),
        )
      )
    );
  }
}