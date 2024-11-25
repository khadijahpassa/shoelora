import 'package:flutter/material.dart';
import 'package:shoelora/ui/home/catalogue_screen.dart';

class LoginPage extends StatelessWidget {
  // const LoginPage({super.key});

  // Menandakan alur yang crucial di dalam proses aplikasi --> auth
  // Key: pertanda bisa dipanggil kayak id di SQL
  // State: menyimpan data yang sedang berubah
  // GlobalKey: debugging kalo ada sesuatu yang error di masalah login/register, memudahkan proses debugging(labeling)
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(); //handle input data
  final _passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 176, 147, 255),
            Color.fromARGB(255, 187, 222, 251),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email*',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    // kondisi ketika user ngga di isi
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }
                    if (!value.contains('@')) {
                      return "Please fill with valid email address";
                    }
                    return null; // jika input valid, gak bakal terjadi apa2, cuman buat validasi
                  },
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password*',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true, // jika ingin password menjadi tersembunyi
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }
                    if (value.length < 8) {
                      return "Password must be at least 8 characters";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: (){
                    if (_formKey.currentState!.validate()) {
                      //if the validation is success, it will navigate to home screen
                      Navigator.pushReplacement(
                        context, 
                        MaterialPageRoute(builder: (context) => const CatalogueScreen())
                      );// pushReplacement, pindah screen dengan bawa data
                    }
                  }, 
                  child: const Text('Login')
                ),
                const SizedBox(height: 10.0),
                TextButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/register');
                  }, 
                  child: const Text("Don't have an account? Register")
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}