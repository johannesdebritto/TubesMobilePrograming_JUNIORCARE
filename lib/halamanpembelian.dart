// import 'package:flutter/material.dart';

// class HalamanPembelian extends StatefulWidget {
//   @override
//   _HalamanPembelianState createState() => _HalamanPembelianState();
// }

// class _HalamanPembelianState extends State<HalamanPembelian> {
//   int quantity = 1; // Initial quantity

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Pembelian'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Display the image and name of the medicine
//             Image.asset(
//               'assets/image/obh.png', // Change to your image path
//               width: 100,
//               height: 100,
//             ),
//             SizedBox(height: 16),
//             Text(
//               'OBH Anak',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 16),
//             // Display the price
//             Text(
//               'Harga : Rp.10.000',
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             SizedBox(height: 16),
//             // Quantity selection with decrement and increment
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.remove),
//                   onPressed: () {
//                     if (quantity > 1) {
//                       setState(() {
//                         quantity--;
//                       });
//                     }
//                   },
//                 ),
//                 Text(
//                   '$quantity',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.add),
//                   onPressed: () {
//                     setState(() {
//                       quantity++;
//                     });
//                   },
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             // Display the total price based on quantity
//             Text(
//               'Total : Rp.${10000 * quantity}', // Assuming the price is 10, change accordingly
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             SizedBox(height: 16),
//             // Add your address input or selection here
//             Text(
//               'Alamat Pengiriman:',
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             // Add your address input or selection widget here
//             // ...
//           ],
//         ),
//       ),
//     );
//   }
// }
