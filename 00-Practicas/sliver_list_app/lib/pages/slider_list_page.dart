import 'package:flutter/material.dart';

class SliderListPage extends StatelessWidget {
  const SliderListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _MainScroll(),
          Positioned(bottom: -10, right: 0, child: _ButtonNewList())
        ],
      ),
    );
  }
}

class _ButtonNewList extends StatelessWidget {
  const _ButtonNewList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ButtonTheme(
      height: 100,
      minWidth: size.width * 0.9,
      child: MaterialButton(
        color: Colors.red,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(50))),
        onPressed: () {},
        child: Text(
          'CREATE NEW LIST',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        /*SliverAppBar(
          backgroundColor: Colors.red,
          title: Text('Hola mundo'),
          floating: true,
        ),*/
        SliverPersistentHeader(
            floating: true,
            delegate: _SliverCustomHeaderDelegate(
                minHeight: 170,
                maxHeight: 200,
                child: Container(
                    alignment: Alignment.centerLeft,
                    color: Colors.white,
                    child: _Titulo()))),
        SliverList(
            delegate: SliverChildListDelegate([
          _ListItem(
              titulo: 'Orange', color: Color.fromARGB(255, 102, 240, 153)),
          _ListItem(titulo: 'Family', color: Color(0xffF2A38A)),
          _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
          _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
          _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
          _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
          _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
          _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
          SizedBox(
            height: 100,
          )
        ]))
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate(
      {required this.minHeight, required this.maxHeight, required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    //Ocupa todo el espacio posible
    return SizedBox.expand(
      child: this.child,
    );
  }

  //Tamaño maximo al que se puede extender
  //Se toma el mayor de los 2 valores
  @override
  double get maxExtent =>
      (this.maxHeight > this.minHeight) ? this.maxHeight : this.minHeight;

  //Tamaño minimo al que se puede extender
  //Se toma el menor de los 2 valores
  @override
  double get minExtent =>
      (this.maxHeight < this.minHeight) ? this.maxHeight : this.minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return this.maxHeight != oldDelegate.maxExtent ||
        this.minHeight != oldDelegate.minExtent;
  }
}

class _Titulo extends StatelessWidget {
  const _Titulo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            'New',
            style: TextStyle(color: Color(0xff532128), fontSize: 50),
          ),
        ),
        Stack(
          children: [
            SizedBox(
              width: 100,
            ),
            Positioned(
              bottom: 8,
              child: Container(
                width: 120,
                height: 8,
                decoration: BoxDecoration(color: Color(0xffF7CDD5)),
              ),
            ),
            Container(
              child: Text('List',
                  style: TextStyle(
                      color: Color(0xffD93A30),
                      fontSize: 50,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        )
      ],
    );
  }
}

class _ListaTareas extends StatelessWidget {
  final items = [
    _ListItem(titulo: 'Orange', color: Color(0xffF08F66)),
    _ListItem(titulo: 'Family', color: Color(0xffF2A38A)),
    _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
    _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
    _ListItem(titulo: 'Orange', color: Color(0xffF08F66)),
    _ListItem(titulo: 'Family', color: Color(0xffF2A38A)),
    _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
    _ListItem(titulo: 'Books', color: Color(0xffFCEBAF))
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => items[index],
    );
  }
}

class _ListItem extends StatelessWidget {
  final String titulo;
  final Color color;
  const _ListItem({
    super.key,
    required this.titulo,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(30),
      child: Text(
        this.titulo,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      margin: EdgeInsets.all(10),
      height: 130,
      decoration: BoxDecoration(
          color: this.color, borderRadius: BorderRadius.circular(30)),
    );
  }
}
