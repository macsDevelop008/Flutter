import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          //TODO: Primera parte
          _FirstPart(),
          //TODO: Segunda parte
          Padding(
            padding: const EdgeInsets.only(left: 35, top: 38, right: 35),
            child: Expanded(
              child: Container(
                color: Colors.transparent,
                child: Column(
                  children: [
                    //TODO: Titulo-boton
                    Row(
                      children: [
                        //Todo: titulo
                        Container(
                          color: Colors.transparent,
                          width: 290,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mi primera pintura',
                                style: TextStyle(
                                    fontSize: 28, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.add_location_alt_outlined,
                                      color:
                                          Color.fromARGB(190, 100, 100, 100)),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('Japon, Tokyo',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              190, 100, 100, 100)))
                                ],
                              )
                            ],
                          ),
                        ),
                        //Todo: Boton
                        Padding(
                          padding: const EdgeInsets.only(left: 0, top: 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                                topRight: Radius.circular(12),
                                topLeft: Radius.circular(2.5)),
                            child: Container(
                              width: 45,
                              height: 45,
                              color: Color.fromARGB(255, 62, 114, 234),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.cloud_download_outlined,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    //Todo: Texto
                    Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: Text(
                        'Ad sunt cillum  ut amet ton ad consequat labore excepteur Lorem magna tempor deserunt. Ipsum et aute in et quis enim proident cupidatat qui tempor consequat adipisicing.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    //Todo: Tags
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Row(
                        children: [
                          //Tag
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              color: Color.fromARGB(24, 0, 0, 0),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 3.5, bottom: 3.5, right: 10, left: 10),
                                child: Text(
                                  '#ceo',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color.fromARGB(59, 0, 0, 0),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          //Tag
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              color: Color.fromARGB(24, 0, 0, 0),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 3.5, bottom: 3.5, right: 10, left: 10),
                                child: Text(
                                  '#superart',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color.fromARGB(59, 0, 0, 0),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          //Tag
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              color: Color.fromARGB(24, 0, 0, 0),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 3.5, bottom: 3.5, right: 10, left: 10),
                                child: Text(
                                  '#travel',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color.fromARGB(59, 0, 0, 0),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Row(
                        children: [
                          Icon(
                            Icons.favorite,
                            size: 27,
                            color: Color.fromARGB(255, 157, 167, 195),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.more_horiz_rounded,
                            size: 27,
                            color: Color.fromARGB(255, 157, 167, 195),
                          ),
                          Expanded(
                            child: SizedBox(),
                          ),
                          Icon(
                            Icons.account_tree_sharp,
                            size: 27,
                            color: Color.fromARGB(255, 157, 167, 195),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: const BottonBar(),
    );
  }
}

class _FirstPart extends StatelessWidget {
  const _FirstPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 420,
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
              child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://i.pinimg.com/564x/05/4b/ea/054beaef962bf50e44e4ba41954217c1.jpg')),
            ),
          ),
          Positioned(
              top: 40,
              left: 0,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {},
              )),
          Positioned(
              top: 40,
              right: 0,
              child: IconButton(
                icon: const Icon(Icons.access_time_outlined),
                color: Colors.white,
                onPressed: () {},
              )),
        ],
      ),
    );
  }
}

class BottonBar extends StatelessWidget {
  const BottonBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      backgroundColor: Colors.white,
      showSelectedLabels: false, //selected item
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.amp_stories_outlined,
              color: Color.fromARGB(110, 0, 0, 0),
              size: 30,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box_outlined,
              color: Color.fromARGB(110, 0, 0, 0),
              size: 30,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.account_box_outlined,
              color: Color.fromARGB(81, 0, 0, 0),
              size: 30,
            ),
            label: ''),
      ],
    );
  }
}
