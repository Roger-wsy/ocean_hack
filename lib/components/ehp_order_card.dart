import 'package:flutter/material.dart';
import 'package:ocean_hack/constant/constant.dart';
import '_index.dart';

class EhpOrderCard extends StatefulWidget {
  EhpOrderCard({
    super.key,
    this.leftTextList = const [],
    this.rightTextList = const [],
    this.onTap,
    this.serviceName,
    this.price,
    this.status,
  });

  List<String> leftTextList;
  List<String> rightTextList;
  VoidCallback? onTap;
  String? serviceName;
  double? price;
  String? status;

  @override
  State<EhpOrderCard> createState() => _EhpOrderCardState();
}

class _EhpOrderCardState extends State<EhpOrderCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EhpPadding.containerCenter,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ehpSecondaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: EhpPadding.containerCenter,
          child: Column(
            children: [
              _buildCardTitle(),
              const SizedBox(height: 8),
              EhpInfoList(
                leftTextList: widget.leftTextList,
                rightTextList: widget.rightTextList,
              ),
              const Divider(
                indent: 2,
                endIndent: 2,
              ),
              _buildLastRow()
            ],
          ),
        ),
      ),
    );
  }

  Row _buildLastRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        EhpText(
          fontSize: 16,
          "RM${widget.price?.toStringAsFixed(2)}",
        ),
        Padding(
          padding: EhpPadding.b4,
          child: SizedBox(
            width: 100,
            height: 35,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
              ),
              onPressed: widget.onTap,
              child: EhpText(
                color: ehpSecondaryColor,
                fontSize: 14,
                "Details",
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row _buildCardTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: EhpText(
            widget.serviceName,
            maxLines: 2,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        EhpLabel(
          labelText: widget.status!.toUpperCase(),
          padding: EdgeInsets.zero,
          labelType: LabelType.bordered,
          labelColor: widget.status == 'pending'
              ? Theme.of(context).primaryColor
              : widget.status == 'approved'
                  ? Colors.green
                  : widget.status == 'rejected'
                      ? Colors.black
                      : Colors.grey,
        )
      ],
    );
  }
}
