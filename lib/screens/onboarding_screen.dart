import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_onboarding_ui/utilities/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Color(0xFF7B51D3),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  Widget _crearBotonRedondeado( Color color, IconData icono, String texto ) {
 
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur( sigmaX: 5.0, sigmaY: 5.0 ),
        child: Container(
          height: 120.0,
          margin: EdgeInsets.all(18.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(62, 66, 107, 0.7),
            borderRadius: BorderRadius.circular(20.0)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox( height: 5.0 ),
              CircleAvatar(
                backgroundColor: color,
                radius: 35.0,
                child: Icon( icono, color: Colors.white, size: 30.0 ),
              ),
              Text( texto , style: TextStyle( color: color )),
              SizedBox( height: 5.0 )
            ],
          ),
 
        ),
      ),
    );
  }

  
  Widget _botonesRedondeados() {

    return Table(
      children: [
        TableRow(
          children: [
            //_crearBotonRedondeado( Colors.blue, Icons.thumb_up, 'Lavado por kilo' ),
            _crearBotonRedondeado( Colors.blue, FontAwesomeIcons.weight, 'Lavado por kilo' ),
            _crearBotonRedondeado( Colors.purpleAccent, FontAwesomeIcons.parachuteBox, 'Lavado por cesto' ),
          ]
        ),
        TableRow(
          children: [
            _crearBotonRedondeado( Colors.pinkAccent, FontAwesomeIcons.userTie, 'Ternos' ),
            _crearBotonRedondeado( Colors.orange, FontAwesomeIcons.bed, 'Sábanas' ),
          ]
        ),
        TableRow(
          children: [
            _crearBotonRedondeado( Colors.blueAccent, FontAwesomeIcons.personBooth, 'Cortinas' ),
            _crearBotonRedondeado( Colors.green, FontAwesomeIcons.shoePrints, 'Zapatillas' ),
          ]
        ),
      ],
    );
  }

  Widget _botonesRedondeados2() {

    return Table(
      children: [
        TableRow(
          children: [
            _crearBotonRedondeado( Colors.blue, FontAwesomeIcons.streetView, 'Dirección: Jr. Jorge Chavez 1154 - Breña' ),

          ]
        ),
        TableRow(
          children: [
            //_crearBotonRedondeado( Colors.pinkAccent, Icons.business_center, 'Teléfono: 966167314' ),
            _crearBotonRedondeado( Colors.pinkAccent, FontAwesomeIcons.phone, 'Teléfono: 966167314' ),
          ]
        ),
        TableRow(
          children: [
            _crearBotonRedondeado( Colors.green, FontAwesomeIcons.whatsapp, 'WhatsApp: 966167314' ),
          ]
        ),
      ],
    );

    

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Color(0xFF3594DD),
                Color(0xFF4563DB),
                Color(0xFF5036D5),
                Color(0xFF5B16D0),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () => print('Skip'),
                    
                  ),
                ),
                Container(
                  height: 600.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/lavadora.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Center(
                              child: Text(
                              'Lavandería Rápida',
                              textAlign: TextAlign.center,
                              style: kTitleStyle,
                            ),
                            ),
                            
                            SizedBox(height: 15.0),
                            Text(
                              'Nos encargamos de su ropa para que usted descance.',
                              style: kSubtitleStyle,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Text(
                              'Servicios especiales',
                              textAlign: TextAlign.center,
                              style: kTitleStyle,
                            ),
                            ),
                            _botonesRedondeados()
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Text(
                              'Información',
                              textAlign: TextAlign.center,
                              style: kTitleStyle,
                            ),
                            ),
                            _botonesRedondeados2()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1
                    ? Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomRight,
                          child: FlatButton(
                            onPressed: () {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'Next',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22.0,
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: 100.0,
              width: double.infinity,
              color: Colors.white,
              child: GestureDetector(
                onTap: () => print('Lavandería Rápida'),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: Text(
                      'Lavandería Rápida',
                      style: TextStyle(
                        color: Color(0xFF5B16D0),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )
          : Text(''),
    );
  }
}
