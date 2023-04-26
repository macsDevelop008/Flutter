import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.access_time,
                  color: Colors.black,
                )),
          )
        ],
      ),
      body: const Center(
          child: Column(
        children: [_FirstPart(), _SecontPart()],
      )),
      bottomNavigationBar: const BottonBar(),
    );
  }
}

class _SecontPart extends StatelessWidget {
  const _SecontPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(12.0),
        color: Colors.transparent,
        child: GridView.count(
          childAspectRatio: 0.8,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 3,
          children: [
            ImageBody(
              url:
                  'https://i.pinimg.com/236x/ca/2a/40/ca2a406a6f9dc3072492f6ac9138440d.jpg',
            ),
            ImageBody(
              url:
                  'https://i.pinimg.com/236x/de/07/d0/de07d0dd2ce364c69a7d9d0b958d0683.jpg',
            ),
            ImageBody(
              url:
                  'https://i.pinimg.com/236x/0b/f8/48/0bf848c36eb4850a32407984aded5585.jpg',
            ),
            ImageBody(
              url:
                  'https://i.pinimg.com/236x/78/bc/0b/78bc0b31fc4656ccd7995b0ef5fd46c9.jpg',
            ),
            ImageBody(
              url:
                  'https://i.pinimg.com/236x/c6/4c/34/c64c34e83624bd31b1e397f0aaf04a7c.jpg',
            ),
            ImageBody(
              url:
                  'https://i.pinimg.com/236x/4e/d2/c9/4ed2c965e962ef9d0db2b07632f0bedf.jpg',
            ),
            ImageBody(
              url:
                  'https://i.pinimg.com/236x/5a/80/4e/5a804eb11ec3ee70aa8a9f327266bf63.jpg',
            ),
            ImageBody(
              url:
                  'https://i.pinimg.com/564x/00/89/4d/00894df3bb2a12e047ff6c1c6677bc3e.jpg',
            ),
            ImageBody(
              url:
                  'https://i.pinimg.com/236x/98/8a/cb/988acb7cf4cfa0bdc35b7aaded7e1cca.jpg',
            ),
          ],
        ),
      ),
    );
  }
}

class ImageBody extends StatelessWidget {
  const ImageBody({
    super.key,
    required this.url,
  });
  final String url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image(
        image: NetworkImage(url),
        fit: BoxFit.cover,
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

class _FirstPart extends StatelessWidget {
  const _FirstPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 300,
      width: double.infinity,
      child: const Padding(
        padding: EdgeInsets.only(left: 25, right: 25),
        child: Column(
          children: [
            //TODO: Foto y titulos
            TitleAndButtons(),
            //TODO: Datos
            DataProfile()
          ],
        ),
      ),
    );
  }
}

class DataProfile extends StatelessWidget {
  const DataProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 130,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '210',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 0,
                ),
                Text(
                  'Photos',
                  style: TextStyle(
                      color: Color.fromARGB(85, 0, 0, 0),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0.0, right: 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '150M',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 0,
                ),
                Text(
                  'Followers',
                  style: TextStyle(
                      color: Color.fromARGB(85, 0, 0, 0),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0.0, right: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '2',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 0,
                ),
                Text(
                  'Following',
                  style: TextStyle(
                      color: Color.fromARGB(85, 0, 0, 0),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TitleAndButtons extends StatelessWidget {
  const TitleAndButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 170,
      child: Row(
        children: [
          //TODO: foto
          CircleAvatar(
            backgroundImage: AssetImage('assets/aki_dog.jpg'),
            radius: 70,
          ),
          //TODO: Titulos y botones
          Padding(
            padding: EdgeInsets.only(left: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //TODO: Nombre
                Text(
                  'Aki Dog',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //TODO: Ocupación
                const Text(
                  'Engineer',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(132, 0, 0, 0)),
                ),
                const SizedBox(
                  height: 10,
                ),
                //TODO: Botones
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Follow',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      style: ButtonStyle(
                          minimumSize:
                              MaterialStateProperty.all(const Size(1, 1)),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.only(
                                  top: 5.0,
                                  bottom: 5.0,
                                  right: 23.0,
                                  left: 23.0)),
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 54, 116, 249)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: const BorderSide(
                                          color: Colors.transparent)))),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.send,
                        size: 18,
                        color: Colors.white,
                      ),
                      style: ButtonStyle(
                          minimumSize:
                              MaterialStateProperty.all(const Size(1, 1)),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.only(
                                  top: 5.0,
                                  bottom: 5.0,
                                  right: 15.0,
                                  left: 15.0)),
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 70, 219, 238)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: const BorderSide(
                                          color: Colors.transparent)))),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
