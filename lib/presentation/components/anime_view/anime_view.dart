// import 'package:anime_nya_school_uwu/domain/models/anime_preview.dart';
// import 'package:anime_nya_school_uwu/presentation/components/anime_view/anime_view_model.dart';
// import 'package:flutter/material.dart';
//
// class AnimeView extends StatelessWidget {
//   const AnimeView(this.data, {Key? key}) : super(key: key);
//
//   final AnimePreview data;
//
//   @override
//   Widget build(BuildContext context) {
//     final viewModel = AnimeViewModelImpl(data);
//     return SizedBox(
//       height: 200,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Card(
//           elevation: 8.0,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//           child: Row(
//             children: [
//               SizedBox(
//                 child: Container(
//                   width: 120,
//                   height: 200,
//                   margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: NetworkImage(viewModel.poster),
//                       fit: BoxFit.fitWidth,
//                     ),
//                     shape: BoxShape.rectangle,
//                   ),
//                 ),
//               ),
//               Flexible(
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(bottom: 8.0),
//                         child: Text(
//                           viewModel.title,
//                           overflow: TextOverflow.ellipsis,
//                           maxLines: 1,
//                           softWrap: false,
//                           style: const TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 18.0),
//                           //TextStyle(fontWeight: FontWeight.bold)
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text(
//                             viewModel.score,
//                             style: Theme.of(context).textTheme.bodyText2,
//                           ),
//                           const Icon(Icons.star),
//                         ],
//                       ),
//                     ]),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//     ;
//   }
// }
