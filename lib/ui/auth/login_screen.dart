import 'package:flutter/material.dart';
import 'package:shoelora/consts.dart';
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
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              "assets/images/img_auth.png",
              height: 240,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
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
                      decoration: InputDecoration(
                        labelText: 'Email*',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: primaryLightColor),
                        ),
                      ),
                      validator: (value) {
                        // kondisi ketika user ngga di isi (dua kondisi yang sama aja, pengecekan dua kali)
                        //1. dari kita sendiri, 
                        //2. dari sistem yang ngecek
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
                      decoration: InputDecoration(
                        labelText: 'Password*',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: primaryLightColor),
                        ),
                        
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
                          //if the validation of form fields is success, it will navigate to home screen
                          Navigator.pushReplacement(
                            context, 
                            MaterialPageRoute(builder: (context) => const CatalogueScreen())
                          );// pushReplacement, pindah screen dengan bawa data
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ), 
                      child: const Text('Login')
                    ),
                    const SizedBox(height: 10.0),
                    TextButton(
                      onPressed: (){
                        Navigator.pushNamed(context, '/register');
                      }, 
                      style: TextButton.styleFrom(foregroundColor: primaryColor),
                      child: const Text("Don't have an account? Register")
                    )
                  ],
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}