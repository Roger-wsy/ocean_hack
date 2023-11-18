// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:ocean_hack/components/_index.dart';
// import 'package:syncfusion_flutter_maps/maps.dart';

// import '../../model/location.dart';

// class WorldMapPage extends StatefulWidget {
//   @override
//   _WorldMapPageState createState() => _WorldMapPageState();
// }

// class _WorldMapPageState extends State<WorldMapPage> {
//   late List<Location> locations = [];
//   final MapShapeSource _shapeSource = const MapShapeSource.asset(
//     'assets/geoBoundaries-MYS-ADM1_simplified.geojson',
//     shapeDataField: 'shapeName',
//   );
//   List<MapMarker> _markers = []; // Initialize as an empty list
//   Future<void> loadLocations() async {
//     final jsonString = await rootBundle.loadString('assets/data.json');
//     final jsonResponse = json.decode(jsonString) as List;
//     List<Location> loadedLocations =
//         jsonResponse.map((location) => Location.fromJson(location)).toList();

//     // Populate _markers based on loadedLocations
//     setState(() {
//       _markers = loadedLocations.map((location) {
//         return MapMarker(
//           latitude: location.latitude,
//           longitude: location.longitude,
//           child: const Icon(
//             Icons.location_on,
//             color: Colors.red,
//           ),
//         );
//       }).toList();
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     loadLocations();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: EhpText('Malaysia'),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back_ios,
//             color: Colors.black,
//           ),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.fromLTRB(10, 50, 0, 0),
//             child: SfMaps(
//               layers: [
//                 MapShapeLayer(
//                   source: _shapeSource,
//                   initialMarkersCount: _markers.length,
//                   markerBuilder: (BuildContext context, int index) {
//                     // Here, we return the marker at the given index
//                     return _markers[index];
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
