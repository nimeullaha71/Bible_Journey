// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_svg/flutter_svg.dart';
// // //
// // // class CustomLanguage extends StatelessWidget {
// // //   final String svgAssetPath;
// // //   final String title;
// // //   final VoidCallback onTap;
// // //   final bool isSelected; // new
// // //
// // //   const CustomLanguage({
// // //     super.key,
// // //     required this.svgAssetPath,
// // //     required this.title,
// // //     required this.onTap,
// // //     this.isSelected = false, // default false
// // //   });
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return GestureDetector(
// // //       onTap: onTap,
// // //       child: Container(
// // //         padding: const EdgeInsets.all(10),
// // //         margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 16),
// // //         decoration: BoxDecoration(
// // //           color: Color(0xffE3E9E3),
// // //           borderRadius: BorderRadius.circular(14),
// // //           boxShadow: [
// // //             BoxShadow(
// // //               color: Colors.black12,
// // //               blurRadius: 2,
// // //               offset: const Offset(0, 2),
// // //             ),
// // //           ],
// // //         ),
// // //         child: Row(
// // //           children: [
// // //             SvgPicture.asset(svgAssetPath, width: 30, height: 30),
// // //             const SizedBox(width: 12),
// // //             Expanded(
// // //               child: Text(
// // //                 title,
// // //                 style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
// // //               ),
// // //             ),
// // //             Container(
// // //               width: 23,
// // //               height: 23,
// // //               decoration: BoxDecoration(
// // //                 color: Color(0xffE3E9E3),
// // //                 shape: BoxShape.circle,
// // //                 border: Border.all(color: isSelected ? Colors.green : Colors.black),
// // //               ),
// // //               child: isSelected
// // //                   ? Align(
// // //                 alignment: Alignment.center,
// // //                 child: Container(
// // //                   width: 13,
// // //                   height: 13,
// // //                   decoration: const BoxDecoration(
// // //                     color: Colors.green,
// // //                     shape: BoxShape.circle,
// // //                   ),
// // //                 ),
// // //               )
// // //                   : null,
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// // //
// // import 'package:flutter/material.dart';
// // import 'package:flutter_svg/flutter_svg.dart';
// //
// // class CustomLanguage extends StatelessWidget {
// //   final String imagePath; // svg বা png path
// //   final bool isSvg;       // svg কিনা
// //   final String title;
// //   final VoidCallback onTap;
// //   final bool isSelected;
// //
// //   const CustomLanguage({
// //     super.key,
// //     required this.imagePath,
// //     required this.title,
// //     required this.onTap,
// //     this.isSvg = false,
// //     this.isSelected = false,
// //   });
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTap: onTap,
// //       child: Container(
// //         padding: const EdgeInsets.all(10),
// //         margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 16),
// //         decoration: BoxDecoration(
// //           color: const Color(0xffE3E9E3),
// //           borderRadius: BorderRadius.circular(14),
// //           boxShadow: const [
// //             BoxShadow(
// //               color: Colors.black12,
// //               blurRadius: 2,
// //               offset: Offset(0, 2),
// //             ),
// //           ],
// //         ),
// //         child: Row(
// //           children: [
// //             isSvg
// //                 ? SvgPicture.asset(
// //               imagePath,
// //               width: 30,
// //               height: 30,
// //             )
// //                 : Image.asset(
// //               imagePath,
// //               width: 30,
// //               height: 30,
// //               fit: BoxFit.cover,
// //             ),
// //
// //             const SizedBox(width: 12),
// //
// //             Expanded(
// //               child: Text(
// //                 title,
// //                 style: const TextStyle(
// //                   fontSize: 14,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               ),
// //             ),
// //
// //             Container(
// //               width: 23,
// //               height: 23,
// //               decoration: BoxDecoration(
// //                 shape: BoxShape.circle,
// //                 border: Border.all(
// //                   color: isSelected ? Colors.green : Colors.black,
// //                 ),
// //               ),
// //               child: isSelected
// //                   ? Center(
// //                 child: Container(
// //                   width: 13,
// //                   height: 13,
// //                   decoration: const BoxDecoration(
// //                     color: Colors.green,
// //                     shape: BoxShape.circle,
// //                   ),
// //                 ),
// //               )
// //                   : null,
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class CustomLanguage extends StatelessWidget {
//   final String imagePath; // svg or png path
//   final bool isSvg;       // true হলে svg
//   final String title;
//   final VoidCallback onTap;
//   final bool isSelected;
//
//   const CustomLanguage({
//     super.key,
//     required this.imagePath,
//     required this.title,
//     required this.onTap,
//     this.isSvg = false,
//     this.isSelected = false,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.all(10),
//         margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 16),
//         decoration: BoxDecoration(
//           color: const Color(0xffE3E9E3),
//           borderRadius: BorderRadius.circular(14),
//           boxShadow: const [
//             BoxShadow(
//               color: Colors.black12,
//               blurRadius: 2,
//               offset: Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Row(
//           children: [
//             // 🔥 FIXED FLAG SIZE
//             SizedBox(
//               width: 36,
//               height: 36,
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(6),
//                 ),
//                 child: Center(
//                   child: isSvg
//                       ? SvgPicture.asset(
//                     imagePath,
//                     width: 36,
//                     height: 36,
//                     fit: BoxFit.contain,
//                   )
//                       : Image.asset(
//                     imagePath,
//                     width: 36,
//                     height: 36,
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ),
//             ),
//
//             const SizedBox(width: 12),
//
//             Expanded(
//               child: Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//
//             // selection circle
//             Container(
//               width: 23,
//               height: 23,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 border: Border.all(
//                   color: isSelected ? Colors.green : Colors.black,
//                 ),
//               ),
//               child: isSelected
//                   ? Center(
//                 child: Container(
//                   width: 13,
//                   height: 13,
//                   decoration: const BoxDecoration(
//                     color: Colors.green,
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//               )
//                   : null,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomLanguage extends StatelessWidget {
  final String imagePath;
  final bool isSvg;
  final String title;
  final VoidCallback onTap;
  final bool isSelected;

  const CustomLanguage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.onTap,
    this.isSvg = false,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xffE3E9E3),
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // ✅ PERFECTLY SAME SIZE FLAGS
            SizedBox(
              width: 36,
              height: 36,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: isSvg
                      ? SvgPicture.asset(imagePath)
                      : Image.asset(imagePath),
                ),
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Container(
              width: 23,
              height: 23,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? Colors.green : Colors.black,
                ),
              ),
              child: isSelected
                  ? Center(
                child: Container(
                  width: 13,
                  height: 13,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
