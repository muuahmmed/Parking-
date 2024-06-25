// import 'package:flutter/material.dart';
// import 'package:f/Park_It/components/components.dart';
// import 'package:f/Park_It/layout/payments/payments_screen.dart';
//
// class ParkingTicketScreen extends StatelessWidget {
//   const ParkingTicketScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Parking Ticket',style: TextStyle(fontSize: 24,color: Colors.white),),
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
//             Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: const Column(
//                 children: [
//                   Center(
//                     child: Icon(Icons.qr_code, size: 100,color: Colors.white,),
//                   ),
//                   SizedBox(height: 16),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text('Name'),
//                       Text('Mohammed Magdy'),
//                     ],
//                   ),
//                   SizedBox(height: 8),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text('Parking Area'),
//                       Text('Slot 1'),
//                     ],
//                   ),
//                   SizedBox(height: 8),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text('Duration'),
//                       Text('4 Hours'),
//                     ],
//                   ),
//                   SizedBox(height: 8),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text('Date'),
//                       Text('May 16, 2024'),
//                     ],
//                   ),
//                   SizedBox(height: 8),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text('Hours'),
//                       Text('OF 9AM-2PM'),
//                     ],
//                   ),
//                   SizedBox(height: 8),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text('Phone'),
//                       Text('+20-111-883-1924'),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             const Spacer(),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Handle confirm payment action
//                 },
//                 child: const Text('Confirm Payment', style: TextStyle(color:  Color(0xff0d2331),fontSize: 18),),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }