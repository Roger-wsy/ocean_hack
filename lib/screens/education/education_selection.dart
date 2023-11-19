import 'package:flutter/material.dart';
import 'package:ocean_hack/components/_index.dart';
import 'package:ocean_hack/screens/education/map_view.dart';
import 'package:ocean_hack/screens/education/pdf_viewer.dart';

import '../../constant/constant.dart';
import '../../routes/route_name.dart';

class EducationSelectionPage extends StatefulWidget {
  const EducationSelectionPage({super.key});

  @override
  State<EducationSelectionPage> createState() => _EducationSelectionPageState();
}

class _EducationSelectionPageState extends State<EducationSelectionPage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> educationList = {
      'Look, Don\'t Touch!': {
        'imageUrl':
            'https://ocean-hackathon.cheesysun.com/pictures/underwater_fish.jpg',
        'pdfLink': 'https://ocean-hackathon.cheesysun.com/assets/pdf/1.pdf',
      },
      'Self-Grazing, NO Hand-Feeding!': {
        'imageUrl':
            'https://ocean-hackathon.cheesysun.com/pictures/turtle_playing_corals.jpg',
        'pdfLink': 'https://ocean-hackathon.cheesysun.com/assets/pdf/2.pdf',
      },
      'Like Sunscreen, but BETTER!': {
        'imageUrl':
            'https://ocean-hackathon.cheesysun.com/pictures/dock_waves.jpg',
        'pdfLink': 'https://ocean-hackathon.cheesysun.com/assets/pdf/3.pdf',
      },
      'Shocking Ocean Pollution Statistics': {
        'imageUrl':
            'https://ocean-hackathon.cheesysun.com/pictures/dolphins.jpg',
        'pdfLink': 'https://ocean-hackathon.cheesysun.com/assets/pdf/4.pdf',
      }
    };
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          EhpSliverAppBar(
            appBarTitle: 'Learn',
          ),
          SliverPadding(
            padding: EhpPadding.a16,
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  var entry = educationList.entries.elementAt(index);
                  var title = entry.key; // Title from the map's key
                  var imageUrl = entry.value['imageUrl'];
                  var pdfLink = entry.value['pdfLink'];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RouteName.pdfViewer,
                        arguments: PdfViewerArgs(
                          title: title,
                          pdfLink: pdfLink,
                        ),
                      );
                    },
                    child: EducationCard(
                      title: title,
                      imageUrl: imageUrl,
                    ),
                  );
                },
                childCount: educationList.length,
              ),
            ),
          ),
          // SliverToBoxAdapter(
          //   child: Column(
          //     children: [
          //       EhpSizedBox.h16,
          //       Center(
          //         child: EhpText(
          //           'National Marine Water Quality Monitoring',
          //           textStyle: EhpTextStyle.h1,
          //           textAlign: TextAlign.center,
          //         ),
          //       ),
          //       GestureDetector(
          //         onTap: () {
          //           Navigator.pushNamed(context, RouteName.worldMap);
          //         },
          //         child: Container(
          //           padding: EhpPadding.a16,
          //           height: 150,
          //           width: MediaQuery.of(context).size.width * 0.9,
          //           decoration: const BoxDecoration(
          //               borderRadius: BorderRadius.all(
          //                 Radius.circular(15),
          //               ),
          //               color: Colors.green),
          //         ),
          //       )
          //     ],
          //   ),
          //)
        ],
      ),
    );
  }
}

class EducationCard extends StatelessWidget {
  final String? title;
  final String? imageUrl;

  const EducationCard({
    Key? key,
    this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              imageUrl!,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Positioned(
            top: 140,
            left: 0,
            right: 0,
            child: Container(
              height: 50,
              // 20% of the card's height
              decoration: BoxDecoration(
                color:
                    Colors.black.withOpacity(0.6), // Semi-transparent overlay
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Center(
                child: EhpText(
                  title ?? '',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
