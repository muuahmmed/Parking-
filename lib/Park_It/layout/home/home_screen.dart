import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:f/Park_It/components/components.dart';
import 'package:f/Park_It/layout/home/cubit/cubit.dart';
import 'package:f/Park_It/layout/home/cubit/states.dart';
import 'package:f/Park_It/layout/home/user_profile_screen.dart';
import 'package:f/Park_It/layout/location_area/location_area_screen.dart';
import 'package:f/Park_It/layout/login/login_screen.dart';
import 'package:f/Park_It/layout/parking_status/parking_status.dart';
import 'package:f/Park_It/layout/payments/payments_screen.dart';
import '../parking date/parking date screen.dart';
import '../parkingcart/parkingcartscreen.dart';
import '../tracker/tracker.dart';
import '../feedback/feedback screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ParkingCubit, ParkingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        ParkingCubit cubit = ParkingCubit.get(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          key: scaffoldKey,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                if (scaffoldKey.currentState!.isDrawerOpen) {
                  scaffoldKey.currentState!.closeDrawer();
                } else {
                  scaffoldKey.currentState!.openDrawer();
                }
              },
            ),
            title: const Text(
              'Park-It',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://pbs.twimg.com/profile_images/1788505585568145408/OJiK572Q_400x400.jpg'),
                        radius: 30,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        cubit.userModel?.userName ?? "",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                ListTile(
                  title: const Text('Profile'),
                  onTap: () {
                    navigateAndFinish(context,  const UserProfileScreen());
                  },
                ),
                const SizedBox(height: 10),
                ListTile(
                  title: const Text('light Mode'),
                  onTap: () {
                    // Update the UI based on drawer item tap
                  },
                ),
                const SizedBox(height: 10),
                ListTile(
                  title: const Text('Support contact'),
                  onTap: () {
                    // Update the UI based on drawer item tap
                  },
                ),
                const SizedBox(height: 10),
                ListTile(
                  title: const Text('share'),
                  onTap: () {
                    // Update the UI based on drawer item tap
                  },
                ),
                const SizedBox(height: 10),
                ListTile(
                  title: const Text('Logout'),
                  onTap: () {
                    navigateAndFinish(context, const Login());
                  },
                ),
              ],
            ),
          ),
          body: ParkingCubit.get(context).userModel != null
              ? Column(
            children: [
              const SizedBox(height: 20),
              Container(
                color: const Color.fromRGBO(20, 50, 70, 5),
                height: 180,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.red,
                              ),
                              width: 140,
                              child: const Image(
                                image: AssetImage('assets/images/logo.png'),
                                width: double.infinity,
                                height: 140,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Hello, ${cubit.userModel!.userName}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                height: 120,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        color: Colors.white,
                        width: 95,
                        height: 95,
                        child: Column(
                          children: [
                            MaterialButton(
                              onPressed: () {
                                navigateTo(context, const Tracker());
                              },
                              child: const Icon(
                                Icons.track_changes,
                                size: 55,
                                color: Colors.red,
                              ),
                            ),
                            const Text(
                              'Tracker',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        color: Colors.white,
                        width: 95,
                        height: 95,
                        child: Column(
                          children: [
                            MaterialButton(
                              onPressed: () {
                                navigateTo(context, const DataScreen(slotLabel: ''));
                              },
                              child: const Icon(
                                Icons.date_range,
                                size: 55,
                                color: Colors.red,
                              ),
                            ),
                            const Text(
                              'Parking Date',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        color: Colors.white,
                        width: 95,
                        height: 95,
                        child: Column(
                          children: [
                            MaterialButton(
                              onPressed: () {
                                navigateTo(context, const CartScreen());
                              },
                              child: const Icon(
                                Icons.local_parking,
                                size: 55,
                                color: Colors.red,
                              ),
                            ),
                            const Text(
                              'Parking cart',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 120,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        color: Colors.white,
                        width: 95,
                        height: 95,
                        child: Column(
                          children: [
                            MaterialButton(
                              onPressed: () {
                                DateTime selectedTimeFrom = DateTime.now();
                                DateTime selectedTimeTo = selectedTimeFrom.add(const Duration(hours: 1));

                                // Convert DateTime to TimeOfDay
                                TimeOfDay timeFrom = TimeOfDay(hour: selectedTimeFrom.hour, minute: selectedTimeFrom.minute);
                                TimeOfDay timeTo = TimeOfDay(hour: selectedTimeTo.hour, minute: selectedTimeTo.minute);

                                navigateTo(
                                  context,
                                  PaymentScreen(
                                    key: UniqueKey(),
                                    selectedTimeFrom: timeFrom,
                                    selectedTimeTo: timeTo,
                                  ),
                                );
                              },

                              child: const Icon(
                                Icons.payment_outlined,
                                size: 55,
                                color: Colors.red,
                              ),
                            ),


                            const Text(
                              'Payments',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        color: Colors.white,
                        width: 95,
                        height: 95,
                        child: Column(
                          children: [
                            MaterialButton(
                              onPressed: () {
                                navigateTo(context, const ParkingStatusScreen());
                              },
                              child: const Icon(
                                Icons.show_chart,
                                size: 55,
                                color: Colors.red,
                              ),
                            ),
                            const Text(
                              'Parking Status',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        color: Colors.white,
                        width: 95,
                        height: 95,
                        child: Column(
                          children: [
                            MaterialButton(
                              onPressed: () {
                                navigateTo(context, const FeedbackScreen());
                              },
                              child: const Icon(
                                Icons.feed_outlined,
                                size: 55,
                                color: Colors.red,
                              ),
                            ),
                            const Text(
                              'Feedback',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 120,
                width: double.infinity,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        color: Colors.white,
                        width: 95,
                        height: 95,
                        child: Column(
                          children: [
                            MaterialButton(
                              onPressed: () {
                                navigateAndFinish(context, const LocationAreaScreen());
                              },
                              child: const Icon(
                                Icons.location_on_outlined,
                                size: 55,
                                color: Colors.red,
                              ),
                            ),
                            const Text(
                              'Location area',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
              : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
