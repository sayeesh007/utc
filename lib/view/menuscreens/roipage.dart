import 'package:flutter/material.dart';
import 'package:trading_app/helper/constants.dart';

import 'package:trading_app/helper/fuctions.dart';

// import 'menupage.dart';

class RoiPage extends StatelessWidget {
  final bool isHomepage;

  const RoiPage({Key? key, required this.isHomepage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/wallpaper.png'),
              fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isHomepage
                ? const Padding(
                    padding: EdgeInsets.all(30.0),
                    child: SizedBox(),
                    //  GestureDetector(
                    //   onTap: () async {
                    //     // Navigator.of(context).push(MaterialPageRoute(
                    //     //     builder: (context) =>  MenuPage()));
                    //   },
                    //   //     child: SizedBox(
                    //   //         height: 50.0,
                    //   //         width: 50.0,
                    //   //         child: Image.asset('assets/icons/menu.png')),
                    // ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: SizedBox(
                          height: 50.0,
                          width: 50.0,
                          child: Image.asset('assets/icons/back.png')),
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.only(
                left: 45.0,
              ),
              child: Text(
                'ROI Income',
                style: tittle(),
              ),
            ),
            Expanded(
              child: Container(
                // height: size.height * 0.73,
                padding:
                    const EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const SizedBox(height: 20.0),
                      const RoiCard(
                          investment: '50000',
                          payout: '50000',
                          from: '01/11/2021',
                          to: '01/11/2021',
                          date: '01/11/2021',
                          status: true),
                      const SizedBox(height: 20.0),
                      const RoiCard(
                          investment: '50000',
                          payout: '50000',
                          from: '01/11/2021',
                          to: '01/11/2021',
                          date: '01/11/2021',
                          status: false),
                      const SizedBox(height: 20.0),
                      const RoiCard(
                          investment: '50000',
                          payout: '50000',
                          from: '01/11/2021',
                          to: '01/11/2021',
                          date: '01/11/2021',
                          status: false),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RoiCard extends StatelessWidget {
  final String investment, payout, from, to, date;
  final bool status;
  const RoiCard({
    Key? key,
    required this.investment,
    required this.payout,
    required this.from,
    required this.to,
    required this.date,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Paints.purple.withOpacity(0.2)),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Investment',
                style: normal(),
              ),
              const Spacer(),
              Text(
                investment,
                style: normal(),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Text(
                'Payout',
                style: normal(),
              ),
              const Spacer(),
              Text(
                payout,
                style: normal(),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Text(
                'From Date',
                style: normal(),
              ),
              const Spacer(),
              Text(
                from,
                style: normal(),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Text(
                'To Date',
                style: normal(),
              ),
              const Spacer(),
              Text(
                to,
                style: normal(),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Text(
                'Date',
                style: normal(),
              ),
              const Spacer(),
              Text(
                date,
                style: normal(),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Text(
                'Status',
                style: normal(),
              ),
              const Spacer(),
              Image.asset(
                status
                    ? 'assets/icons/Tick-Square.png'
                    : 'assets/icons/wrong-square.png',
                height: 20,
                width: 20,
                fit: BoxFit.fill,
              ),
              const SizedBox(width: 10.0),
              Text(
                status ? 'Paid' : 'UnPaid',
                style: normal(),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
