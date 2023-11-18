import 'package:flutter/material.dart';
import 'package:ocean_hack/components/_index.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerArgs {
  PdfViewerArgs({this.title, required this.pdfLink});

  String? title;
  String pdfLink;
}

class PdfViewerPage extends StatefulWidget {
  const PdfViewerPage({
    super.key,
    this.args,
  });

  final PdfViewerArgs? args;

  @override
  State<PdfViewerPage> createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          EhpSliverAppBar(
            appBarTitle: widget.args?.title,
          ),
          SliverFillRemaining(
            child: SfPdfViewer.network(
              widget.args!.pdfLink,
              key: _pdfViewerKey,
            ),
          )
        ],
      ),
    );
  }
}
