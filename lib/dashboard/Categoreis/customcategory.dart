// import 'package:flutter/material.dart';
// import 'package:newsapp/dashboard/General/model/model.dart';
// import 'package:newsapp/dashboard/General/veiw/general.dart';

// class CustomCategory extends StatelessWidget {
//   const CustomCategory({super.key, required this.category});
//   final CategoryModel category;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: InkWell(
//               onTap: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => General(categoryName: '',),
//                   ),
//                 );
//               },
//               child: Container(
//                 height: 100,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                         image: AssetImage(category.image ?? 'assets/img1.jpeg'),
//                         fit: BoxFit.fill)),
//                 child: Center(
//                   child: Text(
//                     category.title ?? '',
//                     style: const TextStyle(
//                         fontSize: 32,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white),
//                   ),
//                 ),
//               ),
//             ),
//           );
//   }
// }