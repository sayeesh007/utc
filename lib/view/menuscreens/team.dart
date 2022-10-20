import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:trading_app/helper/constants.dart';
import 'package:trading_app/helper/fuctions.dart';

class Team extends StatefulWidget {
  const Team({Key? key}) : super(key: key);

  @override
  State<Team> createState() => _TeamState();
}

class _TeamState extends State<Team> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
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
              padding: const EdgeInsets.only(left: 40.0),
              child: Text(
                'My Team',
                style: tittle(),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white.withOpacity(0.1)),
                child: TabBar(
                  controller: tabController,
                  labelPadding: const EdgeInsets.symmetric(vertical: 10),
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(colors: [
                        Paints.purple,
                        Paints.voilet,
                        Paints.blue,
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                  tabs: [
                    Text(
                      'Team',
                      style: h1(),
                    ),
                    Text(
                      'Direct',
                      style: h1(),
                    ),
                  ],
                )),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
                child: Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
              child: TabBarView(
                controller: tabController,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          // margin: const EdgeInsets.symmetric(horizontal: 30.0),
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                  colors: [
                                    Paints.voilet.withOpacity(0.5),
                                    Paints.voilet.withOpacity(0)
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight)),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 20.0,
                              ),
                              Text(
                                'Total Team',
                                style: h2(),
                              ),
                              const Spacer(),
                              Text(
                                '10',
                                style: normal(),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        const TeamCard(
                            username: "username",
                            fullName: 'fullName',
                            sponserid: 'sponserid',
                            level: "5",
                            investment: '500000',
                            status: false),
                        const SizedBox(height: 10.0),
                        const TeamCard(
                            username: "username",
                            fullName: 'fullName',
                            sponserid: 'sponserid',
                            level: "5",
                            investment: '500000',
                            status: true),
                        const SizedBox(height: 10.0),
                        const TeamCard(
                            username: "username",
                            fullName: 'fullName',
                            sponserid: 'sponserid',
                            level: "5",
                            investment: '500000',
                            status: true),
                        const SizedBox(height: 10.0),
                        const TeamCard(
                            username: "username",
                            fullName: 'fullName',
                            sponserid: 'sponserid',
                            level: "5",
                            investment: '500000',
                            status: true),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          // margin: const EdgeInsets.symmetric(horizontal: 30.0),
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                  colors: [
                                    Paints.voilet.withOpacity(0.5),
                                    Paints.voilet.withOpacity(0)
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight)),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 20.0,
                              ),
                              Text(
                                'Total Team',
                                style: h2(),
                              ),
                              const Spacer(),
                              Text(
                                '10',
                                style: normal(),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        const Direct(
                            username: 'username',
                            fullName: 'fullName',
                            email: 'sayeesh@gmail.com',
                            mobileno: '8606621208',
                            doj: '01 dec 2021',
                            status: false),
                        const SizedBox(height: 10.0),
                        const Direct(
                            username: 'username',
                            fullName: 'fullName',
                            email: 'sayeesh@gmail.com',
                            mobileno: '8606621208',
                            doj: '01 dec 2021',
                            status: true),
                        const SizedBox(height: 10.0),
                        const Direct(
                            username: 'username',
                            fullName: 'fullName',
                            email: 'sayeesh@gmail.com',
                            mobileno: '8606621208',
                            doj: '01 dec 2021',
                            status: true),
                        const SizedBox(height: 10.0),
                        const Direct(
                            username: 'username',
                            fullName: 'fullName',
                            email: 'sayeesh@gmail.com',
                            mobileno: '8606621208',
                            doj: '01 dec 2021',
                            status: true),
                      ],
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class TeamCard extends StatelessWidget {
  final String username, fullName, sponserid, level, investment;
  final bool status;

  const TeamCard({
    Key? key,
    required this.username,
    required this.fullName,
    required this.sponserid,
    required this.level,
    required this.investment,
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
                'Username',
                style: normal(),
              ),
              const Spacer(),
              Text(
                username,
                style: normal(),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Text(
                'Full Name',
                style: normal(),
              ),
              const Spacer(),
              Text(
                fullName,
                style: normal(),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Text(
                'Sponser Id',
                style: normal(),
              ),
              const Spacer(),
              Text(
                sponserid,
                style: normal(),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Text(
                'Level',
                style: normal(),
              ),
              const Spacer(),
              Text(
                level,
                style: normal(),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
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
                status ? 'Active' : 'InActive',
                style: normal(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Direct extends StatelessWidget {
  final String username, fullName, email, mobileno, doj;
  final bool status;
  const Direct({
    Key? key,
    required this.username,
    required this.fullName,
    required this.email,
    required this.mobileno,
    required this.doj,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        // fit: StackFit.expand,
        children: [
          ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5 * 2),
              child: Container(
                // alignment: alignment ?? Alignment.topLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: maingradient(),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Paints.purple.withOpacity(0.2)),
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Username',
                      style: normal(),
                    ),
                    const Spacer(),
                    Text(
                      username,
                      style: normal(),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Text(
                      'Full Name',
                      style: normal(),
                    ),
                    const Spacer(),
                    Text(
                      fullName,
                      style: normal(),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Text(
                      'Email Id',
                      style: normal(),
                    ),
                    const Spacer(),
                    Text(
                      email,
                      style: normal(),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Text(
                      'Mobile NO',
                      style: normal(),
                    ),
                    const Spacer(),
                    Text(
                      mobileno,
                      style: normal(),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Text(
                      'DOJ',
                      style: normal(),
                    ),
                    const Spacer(),
                    Text(
                      doj,
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
                      status ? 'Active' : 'InActive',
                      style: normal(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
