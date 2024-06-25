import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:f/Park_It/components/components.dart';
import 'package:f/Park_It/layout/home/cubit/cubit.dart';
import 'package:f/Park_It/layout/home/cubit/states.dart';
import 'package:f/Park_It/layout/home/home_screen.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ParkingCubit, ParkingStates>(
      listener:  (context, state){},
      builder: (context, state){
        ParkingCubit cubit=ParkingCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Profile',style: TextStyle(color: Colors.white),),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back,color: Colors.white,),
              onPressed: () {
                navigateAndFinish(context, const Home());
              },
            ),
          ),
          body:
         // ParkingCubit.get(context).userModel != null ?
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://pbs.twimg.com/profile_images/1788505585568145408/OJiK572Q_400x400.jpg'),
                  ),
                ),
                const SizedBox(height: 16),
                const Center(
                  child: Text(
                    'Mohammed',
                   // '${cubit.userModel!.userName}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(height: 8),
                const Center(
                  child: Text(
                    'mohammed5@gmail.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 16),
                ListTile(
                  leading: const Icon(Icons.email,color: Colors.grey,),
                  title: const Text('Add Email',style: TextStyle(color: Colors.white),),
                  onTap: () {
                    // Navigate to settings screen
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.password,color: Colors.grey,),
                  title: const Text('Change Password',style: TextStyle(color: Colors.white),),
                  onTap: () {
                    // Navigate to edit profile screen
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.phone,color: Colors.grey,),
                  title: const Text('Change Phone',style: TextStyle(color: Colors.white),),
                  onTap: () {
                    // Handle logout
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_camera,color: Colors.grey,),
                  title: const Text('Profile Picture',style: TextStyle(color: Colors.white),),
                  onTap: () {
                    // Handle logout
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
