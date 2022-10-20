import 'package:flutter/material.dart';
import 'package:trading_app/helper/constants.dart';
import 'package:trading_app/helper/fuctions.dart';

class Investment extends StatelessWidget {
  const Investment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            Padding(
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
                left: 40.0,
              ),
              child: Text(
                'My Investment',
                style: tittle(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30.0),
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(colors: [
                    Paints.voilet.withOpacity(0.5),
                    Paints.voilet.withOpacity(0)
                  ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
              child: Row(
                children: [
                  const SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    'My Investment',
                    style: h2(),
                  ),
                  const Spacer(),
                  Text(
                    '100000',
                    style: normal(),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30.0),
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(colors: [
                    Paints.voilet.withOpacity(0.5),
                    Paints.voilet.withOpacity(0)
                  ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
              child: Row(
                children: [
                  const SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    'Team Investment',
                    style: h2(),
                  ),
                  const Spacer(),
                  Text(
                    '100000',
                    style: normal(),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30.0),
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(colors: [
                    Paints.voilet.withOpacity(0.5),
                    Paints.voilet.withOpacity(0.1)
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/bill.png',
                      width: 80,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 15.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Plan B',
                        style: normal(),
                      ),
                      Text(
                        'Package B',
                        style: normal(),
                      ),
                      Text(
                        '50000',
                        style: normal(),
                      ),
                      Text(
                        'Cash Deposite',
                        style: normal(),
                      ),
                    ],
                  ),
                  const SizedBox(width: 15.0),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '10 Aug 2021',
                        style: normal(),
                      ),
                      const SizedBox(height: 20.0),
                      Image.asset(
                        'assets/images/seal.png',
                        width: 100,
                        height: 25,
                        fit: BoxFit.fill,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
