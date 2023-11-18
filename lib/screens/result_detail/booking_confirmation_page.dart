import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:ocean_hack/components/_index.dart';
import 'package:ocean_hack/components/ehp_sliver_app_bar.dart';
import 'package:ocean_hack/constant/constant.dart';
import 'package:ocean_hack/utils/color_utils.dart';

import '../../routes/route_name.dart';

class BookingConfirmationPage extends StatefulWidget {
  const BookingConfirmationPage({super.key});

  @override
  State<BookingConfirmationPage> createState() =>
      _BookingConfirmationPageState();
}

class _BookingConfirmationPageState extends State<BookingConfirmationPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          EhpSliverAppBar(
            appBarTitle: 'Booking Confirmation',
          ),
          SliverToBoxAdapter(
            child: FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  EhpTextFieldTitle(
                    name: 'userName',
                    titleName: 'User Name',
                    placeHolder: 'Who is this ticket for?',
                    onChanged: () {},
                  ),
                  EhpDateTimePickerTitle(
                    name: 'Date Visiting',
                    placeHolder: 'Select visiting date',
                    titleName: 'Visit Date',
                    firstDate: DateTime.now(),
                    format: DateFormat('dd MMM yyyy'),
                    initialEntryMode: DatePickerEntryMode.calendar,
                    inputType: InputType.date,
                    suffixIcon: const Icon(Icons.calendar_month),
                    onChanged: (_) {},
                  ),
                  EhpTextFieldTitle(
                    name: 'Remark',
                    titleName: 'Remark',
                    placeHolder: 'Any remarks you want to let the owner know?',
                    onChanged: () {},
                  ),
                  EhpSizedBox.h24,
                  const Divider(
                    endIndent: 2,
                    color: Colors.black,
                    indent: 2,
                  ),
                  const SizedBox(
                    height: 300,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            EhpText(
                              "Total",
                              textStyle: EhpTextStyle.h1,
                            ),
                            EhpText(
                              "RM300.00",
                              textStyle: EhpTextStyle.b1,
                            ),
                          ],
                        ),
                      ),
                      EhpSingleButton(
                        text: 'Checkout',
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            RouteName.success,
                          );
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
