import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/appointment_card.dart';
import 'package:flutter_application_1/blank_page.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/constants/common_text.dart';
import 'package:flutter_application_1/constants/constants.dart';
import 'package:flutter_application_1/constants/dropdownsearch.dart';
import 'package:flutter_calendar_week/flutter_calendar_week.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  DropDownValues? _selectedFilter;
  String? selectedMonth = 'February';
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // var _selectedDate;
    // log(_selectedDate.toString());
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 10),
        child: Column(
          children: [
            Card(
              elevation: 2.0,
              child: SizedBox(
                height: 0.3 * height,
                width: width,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 0.95 * width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 18.0, top: 10),
                                  child: DropdownButton<String>(
                                    hint: Text(selectedMonth ??
                                        'February'), // Text to display when no item is selected
                                    value:
                                        null, // Initially no value is selected
                                    onChanged: (String? newValue) {
                                      // Handle dropdown value change

                                      print('Selected month: $newValue');
                                    },
                                    items: months.map((String month) {
                                      return DropdownMenuItem<String>(
                                        value: month,
                                        child: Text(month),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 0.05 * height,
                                      width: 0.2 * width,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GlobalTextWidget(text: "Walk-IN")
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon:
                                            const Icon(CupertinoIcons.refresh)),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        child: CalendarWeek(
                          controller: CalendarWeekController(),
                          height: 100,
                          showMonth: true,
                          dayShapeBorder: BoxShape.rectangle,
                          minDate: DateTime.now().add(
                            const Duration(days: -365),
                          ),
                          maxDate: DateTime.now().add(
                            const Duration(days: 365),
                          ),
                          onDatePressed: (DateTime datetime) {
                            // if (_selectedDate == null) {
                            //   setState(() {
                            //     _selectedDate = datetime;
                            //   });
                            // } else {
                            //   setState(() {
                            //     _selectedDate = null;
                            //   });
                            // }
                            // log(_selectedDate.toString());
                          },
                          onDateLongPressed: (DateTime datetime) {
                            // Do something
                          },
                          onWeekChanged: () {
                            // Do something
                          },
                          backgroundColor:
                              const Color.fromARGB(115, 208, 204, 204),
                          // dateBackgroundColor:
                          //     const Color.fromARGB(115, 208, 204, 204),
                          pressedDateBackgroundColor: Colors.tealAccent,
                          monthViewBuilder: (DateTime time) => Align(
                            alignment: FractionalOffset.center,
                            child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 4),
                                child: Text(
                                  DateFormat.yMMMM().format(time),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w600),
                                )),
                          ),
                          decorations: [
                            DecorationItem(
                                decorationAlignment:
                                    FractionalOffset.bottomRight,
                                date: DateTime.now(),
                                decoration: Icon(
                                  Icons.today,
                                  color: Colors.blue,
                                )),
                            DecorationItem(
                                date: DateTime.now().add(Duration(days: 3)),
                                decoration: Text(
                                  '2',
                                  style: TextStyle(
                                    color: Colors.brown,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: DropDownSearchWidget(
                                label: "Select Filter",
                                selectedValue: _selectedFilter,
                                items: filterList,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 1,
                              child: DropDownSearchWidget(
                                label: "Status",
                                selectedValue: _selectedFilter,
                                items: statusList,
                              ),
                            ),
                          ],
                        ),
                      )
                    ]),
              ),
            ),
            Container(
              child: AppointmentCard(),
            )
          ],
        ),
      ),
    ));
  }
}

// body: SafeArea(
//     child: SingleChildScrollView(
//   padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
//   child: SizedBox(
//     height: 100.h,
//     width: 100.w,
//     child: Column(
//       children: [
//         SizedBox(
//           height: 20.h,
//           width: double.infinity,
//           child: Card(
//             child: Row(
//               children: [
//                 SizedBox(
//                   width: 65.w,
//                   child: Row(
//                     children: [
//                       DropDownWidget(title: "February", onPressed: () {}),
//                       DropDownWidget(title: "2024", onPressed: () {}),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   width: 10.w,
//                   height: 5.h,
//                   child: const Row(
//                     children: [GlobalTextWidget(text: "Walk-In")],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//         ListView.builder(
//           itemCount: 5,
//           itemBuilder: (context, index) {},
//         ),
//       ],
//     ),
//   ),
// )),

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({
    super.key,
    required this.onPressed,
    required this.title,
    required this.items,
  });
  final Function() onPressed;
  final String title;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: 0.31 * width,
      height: 0.05 * height,
      child: Row(
        children: [
          // GlobalTextWidget(
          //   text: title,
          //   fontSize: 20,
          // ),
          // IconButton(
          //     onPressed: onPressed, icon: const Icon(Icons.arrow_drop_down))
        ],
      ),
    );
  }
}
