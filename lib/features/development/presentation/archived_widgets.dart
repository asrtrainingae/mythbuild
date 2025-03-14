// Widget Segments(){
//   ValueNotifier<String> _controller = ValueNotifier("primary");
//   return  AdvancedSegment(
//   controller: _controller, // AdvancedSegmentController
//   segments: { // Map<String, String>
//     'primary': 'Primary',
//     'secondary': 'Secondary',
//     'tertiary': 'Tertiary',
//   },
//   activeStyle: TextStyle( // TextStyle
//     color: primary_color,
//     fontWeight: FontWeight.w600,
//   ),
//   inactiveStyle: TextStyle( // TextStyle
//     color: Colors.grey,
//   ),
//   backgroundColor: Colors.transparent, // Color
//   sliderColor: Colors.white, // Color
//   sliderOffset: 2.0, // Double
//   borderRadius: const BorderRadius.all(Radius.circular(8.0)), // BorderRadius
//   itemPadding: const EdgeInsets.symmetric( // EdgeInsets
//     horizontal: 30,
//     vertical: 10,
//   ),
//   animationDuration: Duration(milliseconds: 250), // Duration
//   shadow: const <BoxShadow>[
//     BoxShadow(
//       color: Colors.black26,
//       blurRadius: 8.0,
//     ),
//   ],
// );
// }