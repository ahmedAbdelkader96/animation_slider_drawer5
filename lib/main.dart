import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';void main() {
  runApp( MyApp1());
}








class MyApp1 extends StatefulWidget {
  @override
  State<MyApp1> createState() => _MyApp1State();
}

class _MyApp1State extends State<MyApp1> {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}






class MyApp extends StatefulWidget {

  MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  final Color primary = Colors.white;

  final Color active = Colors.grey.shade800;

  final Color divider = Colors.grey.shade600;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        backgroundColor: Colors.amber[300],
        title: const Text('Animation Drawer'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            setState(() {
              _key.currentState?.openDrawer();
            });
          },
        ),
      ),

      /// ----------------
      /// Building drawer here .
      /// ---------------
      drawer: _buildDrawer(),

      body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (details.delta.dx > 0){
            setState(() {
              _key.currentState?.openDrawer();
            });
          }
          else {
            setState(() {
              _key.currentState.openEndDrawer();
            });
          };

        },
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.only(top: 20.0),

          itemBuilder: (_, int index) {
            return Column(
              children: [Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NewPadd("assets/second.jpeg","ahmed") ,
                  NewPadd("assets/second.jpeg","ahmed") ,
                ],
              ),
                SizedBox(height: 13,),],
            );

          },
          itemCount: 10,
        ),
      ),
    );
  }

  _buildDrawer() {
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      child: MediaQuery.of(context).orientation == Orientation.portrait ? Drawer(
        child:  Container(
          padding: const EdgeInsets.only(left: 16.0, right: 40),
          decoration: BoxDecoration(
              color: Colors.white, boxShadow: const[BoxShadow(color: Colors.black45)]),
          width: 300,
          child: SafeArea(
            child: Column(
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height*0.05),
                EmptyEffect(
                  play: _key.currentState?.isDrawerOpen == false? false : true ,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("assets/second.jpeg"),
                  ),
                  borderColor: Colors.amber[500],
                  outermostCircleStartRadius: 40,
                  outermostCircleEndRadius: 60,
                  numberOfCircles: 3,
                  animationTime: Duration(milliseconds: 1000),
                  delay: Duration(seconds: 1),
                  gap: 5,
                  borderWidth: 2,
                  startOpacity: 0.3,
                ),

                 SizedBox(height: MediaQuery.of(context).size.height*0.02),
                const Text(
                  "Ahmed Abdelkader",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "@ahmedabdelkaderkhedr",
                  style: TextStyle(color: active, fontSize: 12.0),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.05),
                _buildRow(Icons.category_outlined, "Categories"),
                _buildDivider(),
                _buildRow(Icons.add_alert_outlined, "Notifications", showBadge: true),
                _buildDivider(),
                _buildRow(Icons.chat_bubble_outline, "Messages"),
                _buildDivider(),
                _buildRow(Icons.email, "Inbox",
                    showBadge: true),
                _buildDivider(),
                _buildRow(Icons.favorite_border, "Favorites"),
                _buildDivider(),
                _buildRow(Icons.email, "Contact us"),
                _buildDivider(),
                _buildRow(Icons.info_outline, "Help"),
                _buildDivider(),
                SizedBox(height: MediaQuery.of(context).size.height*0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.nightlight_round,color: divider),

                        Switch(value: true, onChanged: (bool){} ,activeColor:Colors.amber[300],activeTrackColor:Colors.amber[300] ,),

                        Icon(Icons.lightbulb_outline,color: divider,),

                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30,right: 30),
                      child: Text("|"),
                    ),

                    Column(
                      children: [
                        Icon(
                          Icons.power_settings_new,size: 20,
                          color: active,
                        ),
                        Text("logout",style: TextStyle(color: active,fontSize: 15),),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ) :
      Drawer(
          child: Padding(
            padding: const EdgeInsets.only(left: 30,right: 40),
            child: Center(
              child: ListView(
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height*0.05),
                  Center(
                    child: EmptyEffect(
                      play: _key.currentState?.isDrawerOpen == false? false : true ,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("assets/second.jpeg"),
                      ),
                      borderColor: Colors.amber[500],
                      outermostCircleStartRadius: 40,
                      outermostCircleEndRadius: 60,
                      numberOfCircles: 3,
                      animationTime: Duration(milliseconds: 1000),
                      delay: Duration(seconds: 1),
                      gap: 5,
                      borderWidth: 2,
                      startOpacity: 0.3,
                    ),
                  ),

                  const SizedBox(height: 15.0),
                  Center(
                    child: const Text(
                      "Ahmed Abdelkader",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Center(
                    child: Text(
                      "@ahmedabdelkaderkhedr",
                      style: TextStyle(color: active, fontSize: 12.0),
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  Center(child: _buildRow(Icons.category_outlined, "Categories")),
                  _buildDivider(),
                  Center(child: _buildRow(Icons.add_alert_outlined, "Notifications", showBadge: true)),
                  _buildDivider(),
                  Center(child: _buildRow(Icons.chat_bubble_outline, "Messages")),
                  _buildDivider(),
                  Center(
                    child: _buildRow(Icons.email, "Inbox",
                        showBadge: true),
                  ),
                  _buildDivider(),
                  Center(child: _buildRow(Icons.favorite_border, "Favorites")),
                  _buildDivider(),
                  Center(child: _buildRow(Icons.email, "Contact us")),
                  _buildDivider(),
                  Center(child: _buildRow(Icons.info_outline, "Help")),
                  _buildDivider(),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.nightlight_round,color: divider),

                          Switch(value: true, onChanged: (bool){} ,activeColor:Colors.amber[300],activeTrackColor:Colors.amber[300] ,),

                          Icon(Icons.lightbulb_outline,color: divider,),

                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30,right: 30),
                        child: Text("|"),
                      ),

                      Column(
                        children: [
                          Icon(
                            Icons.power_settings_new,size: 20,
                            color: active,
                          ),
                          Text("logout",style: TextStyle(color: active,fontSize: 15),),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 30,),

                ],
              ),
            ),
          ),
      ),
    ) ;
  }

  Divider _buildDivider() {
    return Divider(
      color: divider,
    );
  }

  Widget _buildRow(IconData icon, String title, {bool showBadge = false}) {
    final TextStyle tStyle = TextStyle(color: active, fontSize: 16.0);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: active,
          ),
          const SizedBox(width: 5.0),
          Text(
            title,
            style: tStyle,
          ),
          const Spacer(),
          if (showBadge)
            Material(
              color: Colors.deepOrange,
              elevation: 5.0,
              shadowColor: Colors.red,
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                width: 23,
                height: 23,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.lightGreenAccent.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: const Text(
                  "7",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          const SizedBox(width: 5.0),

        ],
      ),
    );
  }
}

class OvalRightBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width - 40, 0);
    path.quadraticBezierTo(
        size.width, size.height / 4, size.width, size.height / 2);
    path.quadraticBezierTo(size.width, size.height - (size.height / 4),
        size.width - 40, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}






class NewPadd extends StatelessWidget {
  const NewPadd(this.image , this.text );
  final String image ;
  final String text ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 0),
                ),
              ],
              image: DecorationImage(image: AssetImage(image))
          ),

        ),
        SizedBox(height: 6,),
        Text(
          text,
          style: const TextStyle(
              color: Colors.black87,
              fontSize: 15,
              decoration: TextDecoration.none),
        )
      ],
    );
  }
}












Color kPinkColor = Color(0xFFF42173);




class EmptyEffect extends StatefulWidget {
  Widget _child;
  double _outermostCircleStartRadius;
  double _outermostCircleEndRadius;
  double _startOpacity;
  Duration _animationTime;
  int _numberOfCircles;
  double _borderWidth;
  Color _borderColor;
  double _gap;
  Duration _delay;
  bool _play ;

  EmptyEffect({
    @required Widget child,
    @required Color borderColor,
    @required double outermostCircleStartRadius,
    @required double outermostCircleEndRadius,
    double startOpacity = 0.1,
    int numberOfCircles = 2,
    Duration delay = const Duration(seconds: 2),
    Duration animationTime = const Duration(seconds: 1),
    double borderWidth = 8,
    double gap = 15,
    @required bool play,
  }) {
    assert(numberOfCircles > 0);
    assert(gap > 0);
    assert(outermostCircleStartRadius > 0);
    assert(outermostCircleEndRadius > 0);
    assert(startOpacity > 0);
    assert(child != null);
    assert(delay >= animationTime);

    _child = child;
    _outermostCircleStartRadius = outermostCircleStartRadius;
    _outermostCircleEndRadius = outermostCircleEndRadius;
    _startOpacity = startOpacity;
    _animationTime = animationTime;
    _numberOfCircles = numberOfCircles;
    _borderWidth = borderWidth;
    _borderColor = borderColor;
    _gap = gap;
    _delay = delay;
    _play = play;
  }

  @override
  _EmptyEffectState createState() => _EmptyEffectState();
}

class _EmptyEffectState extends State<EmptyEffect>
    with TickerProviderStateMixin {
  AnimationController _radiusOpacityController;
  Animation _radiusAnimation;
  Animation _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _radiusOpacityController = AnimationController(
      vsync: this,
      duration: widget._animationTime,
    )..repeat();

    {
      _radiusOpacityController.addListener(() {
        if(widget._play == true){
          setState(() {});

        }else{print("finished");}
      });
    }

    {

    };

    _radiusAnimation = Tween(
        begin: widget._outermostCircleStartRadius,
        end: widget._outermostCircleEndRadius)
        .animate(
      CurvedAnimation(parent: _radiusOpacityController, curve: Curves.linear),
    );

    _opacityAnimation = Tween(begin: widget._startOpacity, end: 0.0).animate(
        CurvedAnimation(
            parent: _radiusOpacityController, curve: Curves.linear));


  }

  @override
  void dispose() {
    _radiusOpacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Opacity(
          opacity: _opacityAnimation.value,
          child: CustomPaint(
            painter: _CustomPainter(
              numberOfCircles: widget._numberOfCircles,
              borderColor: widget._borderColor,
              borderWidth: widget._borderWidth,
              gap: widget._gap,
              outermostCircleRadius: _radiusAnimation.value,
            ),
          ),
        ),
        widget._child,
      ],
    );
  }
}

class _CustomPainter extends CustomPainter {
  int _numberOfCircles;
  double _borderWidth;
  Color _borderColor;
  double _gap;
  double _outermostCircleRadius;

  _CustomPainter({
    int numberOfCircles,
    double borderWidth,
    Color borderColor,
    double gap,
    double outermostCircleRadius,
  }) {
    _numberOfCircles = numberOfCircles;
    _borderWidth = borderWidth;
    _borderColor = borderColor;
    _outermostCircleRadius = outermostCircleRadius;
    _gap = gap;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final borderPaint = Paint()
      ..color = _borderColor
      ..strokeWidth = _borderWidth
      ..style = PaintingStyle.stroke;

    var center = Offset(size.width / 2, size.height / 2);

    //We draw from outermost to innermost possible circle
    int circleNum = 0;
    while (circleNum != _numberOfCircles &&
        (_outermostCircleRadius - _gap * circleNum) > 0) {
      canvas.drawCircle(
          center, _outermostCircleRadius - _gap * circleNum, borderPaint);
      circleNum += 1;
    }
  }

  @override
  bool shouldRepaint(_CustomPainter oldDelegate) {
    if (oldDelegate._outermostCircleRadius == _outermostCircleRadius) {
      return false;
    }
    return true;
  }
}