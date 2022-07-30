import 'package:flutter/material.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class TIME_TABLE extends StatelessWidget {
  static const routeName = "/time-table";
  void barberDetails(BuildContext ctx) {
    Navigator.of(ctx).pop();
  }

  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);
    var turns = storeFunc.turnsOfPublic.map((t) {
      return Event(
        title: t["name"],
        description:
            "این نوبت از ساعت ${t["startTime"].toString().toPersianDigit()}"
            " تا ساعت ${t["endTime"].toString().toPersianDigit()}ادامه دارد",
        dateTime: EventDateTime(
            year: t["year".toPersianDigit()],
            month: t["month".toPersianDigit()],
            day: t["day".toPersianDigit()]),
      );
    });

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.all(5),
              child: SizedBox(
                height: 50,
                width: 50,
                child: Container(
                    child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Colors.white,
                      shadowColor: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pop();
                    // storeFunc.getBarberDetails(storeFunc.barberDetails["_id"],
                    //     storeFunc.user[0]["isMan"]);
                    // barberDetails(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.grey,
                  ),
                )),
              ),
            ),
            Text(
              storeFunc.selectedStylist,
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
      body: EventCalendar(
        eventStyle: EventStyle(
            emptyIcon: Icons.remove,
            titleColor: Colors.blue,
            backgroundColor: Colors.white70),
        dayStyle: DayStyle(
            eventCounterColor: Colors.transparent,
            eventCounterTextColor: Colors.transparent,
            weekDaySelectedColor: Colors.blue),
        calendarOptions:
            CalendarOptions(viewType: ViewType.Daily, font: "Shabnam"),
        calendarType: CalendarType.Jalali,
        calendarLanguage: 'fa',
        canSelectViewType: true,
        headersStyle: HeadersStyle(monthStringType: MonthStringTypes.Full),
        events: [...turns],
      ),
    );
  }
}
