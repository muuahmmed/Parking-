import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:f/Park_It/components/components.dart';
import 'package:f/Park_It/layout/register/cubic/cubit.dart';
import 'package:f/Park_It/layout/register/cubic/states.dart';
import '../login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ParkingRegisterCubit(),
        child: BlocConsumer<ParkingRegisterCubit, ParkingRegisterState>(
            listener: (context, state) {
          if (state is ParkingCreateUserSuccessState) {
            navigateAndFinish(context, const Login());
          }
        }, builder: (context, state) {
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    //physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    20), // Apply border radius
                                color: Colors
                                    .red, // Optional: Set a background color
                              ),
                              width: 100,
                              child: const Image(
                                image: AssetImage('assets/images/logo.png'),
                                width: double.infinity,
                                height: 100,
                                color: Colors.white,
                              ),
                            ),
                            /* const Icon(
                              Icons.drive_eta_outlined,
                              size: 100,
                              color: Colors.redAccent,
                            ),*/
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'REGISTER NOW',
                              style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            TextFormField(
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return ('Enter your Email Address');
                                }
                                return null;
                              },
                              controller: emailController,
                              decoration: const InputDecoration(
                                  // fillColor: Colors.white,
                                  filled: true,
                                  labelText: 'Email Address',
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.email,
                                      color: Color(0xff0d2331)),
                                  labelStyle: TextStyle(
                                    color: Color(0xff0d2331),
                                  )),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            TextFormField(
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return ('Enter your FullName');
                                }
                                return null;
                              },
                              controller: nameController,
                              decoration: const InputDecoration(
                                  //  fillColor: Colors.white,
                                  filled: true,
                                  labelText: 'FullName',
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.person,
                                      color: Color(0xff0d2331)),
                                  labelStyle: TextStyle(
                                    color: Color(0xff0d2331),
                                  )),
                              keyboardType: TextInputType.name,
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            TextFormField(
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return ('Enter your Phone Number');
                                }
                                return null;
                              },
                              controller: phoneController,
                              decoration: const InputDecoration(
                                  // fillColor: Colors.white,
                                  filled: true,
                                  labelText: 'Number',
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.phone,
                                      color: Color(0xff0d2331)),
                                  labelStyle: TextStyle(
                                    color: Color(0xff0d2331),
                                  )),
                              keyboardType: TextInputType.number,
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            TextFormField(
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return ('Enter your password');
                                }
                                return null;
                              },
                              obscureText: true,
                              controller: passwordController,
                              decoration: const InputDecoration(
                                // fillColor: Colors.white,
                                filled: true,
                                labelText: 'Password',
                                suffixIcon: Icon(
                                  Icons.remove_red_eye,
                                  color: Color(0xff0d2331),
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Color(0xff0d2331),
                                ),
                                labelStyle: TextStyle(
                                  color: Color(0xff0d2331),
                                ),
                                border: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.visiblePassword,
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            SizedBox(
                              width: 250.0,
                              height: 50,
                              child: ConditionalBuilder(
                                condition: state is! ParkingRegisterLoadState,
                                builder: (context) => MaterialButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {}
                                    {
                                      ParkingRegisterCubit.get(context)
                                          .userRegister(
                                        email: emailController.text,
                                        password: passwordController.text,
                                        name: nameController.text,
                                        number: phoneController.text,
                                      );
                                    }
                                  },
                                  color: Colors.red,
                                  child: const Text(
                                    'REGISTER',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                                fallback: (context) => const Center(
                                    child: CircularProgressIndicator()),
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'you have an account?',
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Login(),
                                    ));
                              },
                              child: const Text(
                                'LOGIN NOW!',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
