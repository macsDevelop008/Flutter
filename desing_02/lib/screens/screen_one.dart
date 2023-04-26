import 'package:flutter/material.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 73, 66, 108),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 50, bottom: 20, right: 35, left: 35),
          child: Container(
              color: const Color.fromARGB(0, 255, 193, 7),
              child: Column(
                children: [
                  Header(),
                  SizedBox(
                    height: 50,
                  ),
                  BodyTop(),
                  SizedBox(
                    height: 27,
                  ),
                  BodyCenter(),
                  SizedBox(
                    height: 27,
                  ),
                  Footer()
                ],
              )),
        ));
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //!Nombres
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 28,
              ),
              Text(
                'Macs',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: 'NewLincolnGothic',
                    fontSize: 23,
                    fontWeight: FontWeight.w300,
                    color: Color.fromARGB(255, 190, 163, 160)),
              ),
              Text(
                'Mr Engineer',
                style: TextStyle(
                    fontFamily: 'NewLincolnGothic',
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 190, 163, 160)),
              )
            ],
          ),
          const SizedBox(
            width: 100,
          ),
          //! Avatar
          Container(
            color: Colors.transparent,
            width: 80,
            height: 94,
            child: Stack(
              alignment: Alignment.center,
              //alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: 1,
                  child: Container(
                      height: 80,
                      width: 80,
                      child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 73, 66, 108),
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(158, 64, 60, 92),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Transform.scale(
                            scale: 0.85,
                            child: Container(
                              decoration: const BoxDecoration(
                                  //color: Color.fromARGB(255, 52, 47, 87),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18)),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      stops: [
                                        .7,
                                        .3
                                      ],
                                      colors: [
                                        Color.fromARGB(255, 52, 47, 87),
                                        Color.fromARGB(255, 73, 66, 108),
                                      ])),
                            ),
                          ))),
                ),
                Positioned(
                    top: 5,
                    child: Image.asset(
                      'assets/images/face_300x300.png',
                      scale: 4.5,
                    )),
                Positioned(
                    bottom: 6,
                    child: Text(
                      'Macs',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'NewLincolnGothic',
                          fontWeight: FontWeight.w700,
                          fontSize: 12),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BodyTop extends StatelessWidget {
  const BodyTop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 210,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 239, 193, 141),
          borderRadius: BorderRadius.all(Radius.circular(35)),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 45, 41, 69),
              offset: Offset(1, 1),
              spreadRadius: 1,
              blurRadius: 7,
            )
          ]),
      child: Padding(
        padding: EdgeInsets.only(left: 30, right: 30, top: 30),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Bill',
                  style: TextStyle(
                      fontFamily: 'NewLincolnGothic',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 73, 66, 108)),
                ),
                Text(
                  '\$250.86',
                  style: TextStyle(
                      fontFamily: 'NewLincolnGothic',
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 73, 66, 108)),
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.zero, elevation: 4),
                    child: Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 73, 66, 108),
                          borderRadius: BorderRadius.circular(17)),
                      child: Text(
                        'Pay Now',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromARGB(255, 188, 175, 156),
                            fontFamily: 'NewLincolnGothic',
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      ),
                    )),
              ],
            ),
            SizedBox(
              width: 70,
            ),
            Column(
              children: [
                Text(
                  'Pay With',
                  style: TextStyle(
                      fontFamily: 'NewLincolnGothic',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 73, 66, 108)),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 65,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(86, 45, 41, 69),
                          offset: Offset(1, 8),
                          spreadRadius: 0.5,
                          blurRadius: 7,
                        )
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(2.0), //Control de tamaño o radio
                        decoration: BoxDecoration(
                            color: Colors.cyan[300], shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.asset(
                            'assets/images/face_300x300.png',
                            scale: 9,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(2.0), //Control de tamaño o radio
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 247, 175, 155),
                            shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.plus_one,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BodyCenter extends StatelessWidget {
  const BodyCenter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 54, 52, 83),
          borderRadius: BorderRadius.circular(20)),
      child: Row(children: [
        SizedBox(
          width: 12,
        ),
        Container(
          //Los 2 con el mismo valor, ajusta el radio
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 72, 65, 106),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(86, 45, 41, 69),
                  offset: Offset(1, 1),
                  spreadRadius: 0.5,
                  blurRadius: 1,
                )
              ]),
          child: Icon(
            Icons.arrow_circle_up,
            color: const Color.fromARGB(255, 169, 154, 185),
            size: 30,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your previous payment',
              style: TextStyle(
                  color: const Color.fromARGB(255, 187, 177, 203),
                  fontSize: 17,
                  fontFamily: 'NewLincolnGothic',
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '\$598.23',
              style: TextStyle(
                  color: const Color.fromARGB(255, 187, 177, 203),
                  fontSize: 15,
                  fontFamily: 'NewLincolnGothic',
                  fontWeight: FontWeight.w700),
            )
          ],
        )
      ]),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 248,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 55, 50, 88),
          borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 233, 192, 138),
                      borderRadius: BorderRadius.circular(20)),
                  child: Icon(
                    Icons.search,
                    size: 30,
                    color: Color.fromARGB(255, 73, 67, 104),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'All Your Friends',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 187, 177, 203),
                              fontSize: 16,
                              fontFamily: 'NewLincolnGothic',
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          'Send All',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 187, 177, 203),
                              fontSize: 13,
                              fontFamily: 'NewLincolnGothic',
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 25,
                        ),
                        _Friend(
                          color: Color.fromARGB(255, 186, 165, 216),
                          name: 'Pepe',
                          pathAvatar: 'assets/images/face_300x300.png',
                        ),
                        _Friend(
                          color: Color.fromARGB(255, 213, 181, 184),
                          name: 'Pepa',
                          pathAvatar: 'assets/images/face_300x300.png',
                        ),
                        _Friend(
                          color: Color.fromARGB(255, 201, 202, 199),
                          name: 'Tilin',
                          pathAvatar: 'assets/images/face_300x300.png',
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Favourites',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 187, 177, 203),
                        fontSize: 15,
                        fontFamily: 'NewLincolnGothic',
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 0,
                    ),
                    _FavouriteFriend(
                      color: Color.fromARGB(255, 255, 192, 188),
                      name: 'Jose',
                      pathAvatar: 'assets/images/face_300x300.png',
                    ),
                    _FavouriteFriend(
                      color: Color.fromARGB(255, 242, 219, 197),
                      name: 'Daniel',
                      pathAvatar: 'assets/images/face_300x300.png',
                    ),
                    _FavouriteFriend(
                      color: Color.fromARGB(255, 205, 199, 192),
                      name: 'Pepa',
                      pathAvatar: 'assets/images/face_300x300.png',
                    ),
                    _FavouriteFriend(
                      color: Color.fromARGB(255, 163, 196, 240),
                      name: 'Pepa',
                      pathAvatar: 'assets/images/face_300x300.png',
                    ),
                    _FavouriteFriend(
                      color: Color.fromARGB(255, 236, 255, 188),
                      name: 'Lora',
                      pathAvatar: 'assets/images/face_300x300.png',
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FavouriteFriend extends StatelessWidget {
  final Color color;
  final String pathAvatar;
  final String name;

  const _FavouriteFriend({
    super.key,
    required this.color,
    required this.pathAvatar,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(2.0), //Control de tamaño o radio
            decoration:
                BoxDecoration(color: this.color, shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Image.asset(
                this.pathAvatar,
                scale: 9,
              ),
            ),
          ),
          Text(
            this.name,
            style: TextStyle(
                color: const Color.fromARGB(255, 187, 177, 203),
                fontSize: 10,
                fontFamily: 'NewLincolnGothic',
                fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}

class _Friend extends StatelessWidget {
  final String pathAvatar;
  final String name;
  final Color color;

  const _Friend({
    super.key,
    required this.pathAvatar,
    required this.name,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      width: 65,
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 1,
            child: Container(
              height: 85,
              width: 50,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 70, 65, 103),
                  borderRadius: BorderRadius.circular(35)),
            ),
          ),
          Positioned(
              top: 6,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(2.0), //Control de tamaño o radio
                    decoration: BoxDecoration(
                        color: this.color, shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Image.asset(
                        this.pathAvatar,
                        scale: 9,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.5,
                  ),
                  Text(
                    this.name,
                    style: TextStyle(
                        color: const Color.fromARGB(255, 187, 177, 203),
                        fontSize: 11,
                        fontFamily: 'NewLincolnGothic',
                        fontWeight: FontWeight.w700),
                  )
                ],
              )),
          Positioned(
              bottom: 3,
              child: Container(
                height: 17,
                width: 17,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 226, 192, 156),
                    shape: BoxShape.circle),
              ))
        ],
      ),
    );
  }
}
