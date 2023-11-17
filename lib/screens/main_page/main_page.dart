import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:ocean_hack/components/_index.dart';
import 'package:ocean_hack/constant/constant.dart';
import 'package:ocean_hack/routes/route_name.dart';
import 'package:ocean_hack/screens/main_page/profile_section.dart';
import 'package:ocean_hack/screens/result_detail/result_chips.dart';
import 'package:ocean_hack/utils/string_utils.dart';

import 'constant.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
              ),
              Column(
                children: [
                  const ProfileSection(),
                  EhpSizedBox.h16,
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.32,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: customShadow,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                    ),
                    child: Column(children: [
                      EhpSizedBox.h8,
                      FormBuilder(
                        key: _formKey,
                        child: Column(
                          children: [
                            EhpTextFieldTitle(
                              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                              name: FindingPlaceConstant.destination,
                              titleName: 'Destination',
                              placeHolder: 'Enter your destination',
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.search),
                                onPressed: () {},
                              ),
                              onChanged: (_) {},
                            ),
                            EhpDateTimePickerTitle(
                              name: FindingPlaceConstant.startDate,
                              placeHolder: 'Select reminder date',
                              titleName: 'Date',
                              firstDate: DateTime.now(),
                              format: DateFormat('dd MMM yyyy'),
                              initialEntryMode: DatePickerEntryMode.calendar,
                              inputType: InputType.date,
                              suffixIcon: const Icon(Icons.calendar_month),
                              onChanged: (_) {},
                            ),
                          ],
                        ),
                      ),
                      // EhpDateTimePickerTitle(
                      //   name: FindingPlaceConstant.startDate,
                      //   placeHolder: 'Select reminder date',
                      //   titleName: 'Date',
                      //   firstDate: DateTime.now(),
                      //   format: DateFormat('dd MMM yyyy'),
                      //   initialEntryMode: DatePickerEntryMode.calendar,
                      //   inputType: InputType.date,
                      //   suffixIcon: const Icon(Icons.calendar_month),
                      //   onChanged: (_) {},
                      // ),
                      EhpSizedBox.h8,
                      EhpSingleButton(
                        text: 'Search',
                        color: ehpLightPrimaryColor2,
                        onPressed: () {
                          if (_formKey.currentState?.saveAndValidate() ??
                              false) {
                            String? destination = _formKey.currentState
                                ?.value[FindingPlaceConstant.destination];
                            Navigator.pushNamed(
                              context,
                              RouteName.resultChips,
                              arguments: ResultChipsArgs(
                                placeName: destination!.toTitleCase(),
                              ),
                            );
                            _formKey.currentState?.reset();
                          }
                        },
                      )
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Column(
                      children: [
                        EhpHorizontalSection(
                          sectionTitle: 'Place Recommendations',
                          sectionSubtitle: "Malaysia hotspots",
                          child: SizedBox(
                            height: 150,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return EhpColoredCard(
                                  cardHeight: 130,
                                  cardWidth: 260,
                                  borderRadius: 5,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 6,
                                        child: Padding(
                                          padding: EhpPadding.a16,
                                          child: Column(
                                            children: [
                                              EhpText(
                                                'Hi',
                                                maxLines: 2,
                                                textStyle: EhpTextStyle.h3,
                                              ),
                                              EhpSizedBox.h4,
                                              EhpText(
                                                'Hello',
                                                maxLines: 3,
                                                textStyle:
                                                    EhpTextStyle.b4.copyWith(
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: SizedBox(
                                          child: Image.network(
                                            'https://ocean-hackathon.cheesysun.com/pictures/charmander.jpg',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          viewAllOnTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
