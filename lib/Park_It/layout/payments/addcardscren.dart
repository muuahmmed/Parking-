// import 'package:flutter/material.dart';
// import 'package:f/Park_It/components/components.dart';
// import 'package:f/Park_It/layout/payments/payments_screen.dart';
//
// class AddCardScreen extends StatelessWidget {
//   const AddCardScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('New Card',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 23)),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back,color: Colors.white,),
//           onPressed: () {
//             navigateAndFinish(context, const PaymentScreen());
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             const Card(
//               elevation: 4.0,
//               child: Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Icon(Icons.credit_card, size: 40,),
//                         SizedBox(width: 16),
//                         Text(
//                           '1234 5432 3521 3090',
//                           style: TextStyle(fontSize: 24,color: Colors.black),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 16),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text('Mohammed Magdy',style: TextStyle(fontSize: 24,color: Colors.black),),
//                         Text('09/24',style: TextStyle(fontSize: 24,color: Colors.black),),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             const TextField(
//               decoration: InputDecoration(
//                 fillColor: Colors.white,
//                 filled: true,
//                 labelText: 'Cardholder Name',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 16),
//             const TextField(
//               decoration: InputDecoration(
//                 fillColor: Colors.white,
//                 filled: true,
//                 labelText: 'Card Number',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 16),
//             const Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(
//                       fillColor: Colors.white,
//                       filled: true,
//                       labelText: 'Expiry Date',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 16),
//                 Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(
//                       fillColor: Colors.white,
//                       filled: true,
//                       labelText: 'CVV',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const Spacer(),
//             Container(
//               color: Colors.white,
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Handle add card action
//                 },
//                 child: const Text('Continue',style: TextStyle(fontSize: 20,color:  Color(0xff0d2331), ),),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }