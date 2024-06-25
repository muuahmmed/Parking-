import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:f/Park_It/layout/home/home_screen.dart';
import 'package:f/Park_It/network/local/cache_helper.dart';
import '../../constatnts/constants.dart';
import '../../shared/components.dart';
import '../register/register screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class Login extends StatefulWidget{
  const Login({super.key});
  @override
  State<Login> createState() => LoginState();
}
class LoginState extends State<Login> {
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context) =>ParkingLoginCubit(),
      child: BlocConsumer<ParkingLoginCubit,ParkingLoginStates>(
        listener: ( context,  state) {
          if(state is ParkingLoginErrorStates)
          {
            showToast(text: state.error, state: ToastStates.ERROR);
          }
          if(state is ParkingLoginSuccessStates)
            {
              uId=state.uId;
              CacheHelper.saveData(key: 'uId', value: state.uId, ).then((value){
                navigateAndFinish(context, const Home());
              });
            }
        },
        builder: (context,state){
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20), // Apply border radius
                            color: Colors.red, // Optional: Set a background color
                          ),

                          width: 100,
                          child: const Image(image:
                          AssetImage(
                              'assets/images/logo.png'
                          ),width: double.infinity,height: 100,color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 15,),
                        //const  Icon(Icons.drive_eta_outlined,size: 100,color: Colors.redAccent,) ,
                        const Text('PARK-IT',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        TextFormField(
                          validator: (String? value)
                          {
                            if(value!.isEmpty){
                              return('Enter your Email Address');
                            }
                            return null;
                          },
                          controller: emailController,
                          decoration:const InputDecoration(
                              //fillColor: Colors.white,
                              filled: true,
                              labelText: 'Email Address',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.email,color: Color(0xff0d2331)),
                              labelStyle: TextStyle(
                              //  color: Color(0xff0d2331),
                              )
                          ) ,
                          keyboardType: TextInputType.emailAddress,

                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        TextFormField(
                          obscureText: true,
                          onFieldSubmitted: (value)
                          {
                            if (formKey.currentState!.validate())
                            {
                              ParkingLoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          },
                          validator: (String? value)
                          {
                            if(value!.isEmpty){
                              return('Enter your password');
                            }
                            return null;
                          },
                          onChanged: (String value){
                          },
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
                        TextButton(
                            onPressed: (){},
                            child:const Text(
                             'Forget your password?',
                             style: TextStyle(
                               color: Colors.white,
                             ),
                            ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          width: 250.0,
                          height: 50,
                          color: Colors.red,
                          child: ConditionalBuilder(
                            condition: state is! ParkingLoginLoadStates,
                            builder: (context) => MaterialButton(
                              onPressed: ()
                              {
                                if(formKey.currentState!.validate())
                                {
                                  ParkingLoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                              child:  const Text(
                                'LOGIN',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  color: Colors.white
                                ),
                              ),
                            ),
                            fallback: (context)=>  const Center(child: CircularProgressIndicator()),
                          ),
                        ),
                        const SizedBox(
                            height: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Don\' have an account?',),
                            MaterialButton(onPressed: ()
                            {
                              Navigator.push(context,
                                  MaterialPageRoute(builder:
                                      (context) =>  const RegisterScreen(),));
                            },child: const Text(
                              'Register Now!',style: TextStyle(
                                color:Colors.red ,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            ),),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),

          );
        },
      ),
    );
  }
}