import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget{
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0d2331),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Center(
                  child: Text('BOOK YOUR SPOT',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 37,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 70.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    color: Colors.white,
                    child: TextFormField(
                      //controller: titleController,
                      validator:(String? value)
                      {
                        if (value!.isEmpty)
                        {
                          return 'title must not be empty';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        label: Text("ID"),
                        prefixIcon: Icon(Icons.car_crash_outlined),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    color: Colors.white,
                    child: TextFormField(
                      //controller: titleController,
                      validator:(String? value)
                      {
                        if (value!.isEmpty)
                        {
                          return 'title must not be empty';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        label: Text("SPOT NUM"),
                        prefixIcon: Icon(Icons.numbers_outlined),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    color: Colors.white,
                    child: TextFormField(
                      //controller: titleController,
                      validator:(String? value)
                      {
                        if (value!.isEmpty)
                        {
                          return 'title must not be empty';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        label: Text("HOURS"),
                        prefixIcon: Icon(Icons.watch_later_outlined),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: 290,
                    height: 55,
                    color: Colors.redAccent,
                    child: TextButton(onPressed: (){}, child:
                    const Text(
                      'BOOK',
                      style: TextStyle(
                        color: Color(0xff0d2331),
                        //Color(0xff0d2331),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}