import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poa_internet/main.dart';
import 'package:poa_internet/screens/account.dart';
import 'package:poa_internet/screens/home.dart';
import 'package:poa_internet/screens/packages.dart';
import 'package:poa_internet/utils/defaultValues.dart';

class Dashboard extends StatefulWidget {
  final String? title;
  final int? currentPageToNavigate;
  Dashboard({Key? key, this.title, this.currentPageToNavigate})
      : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class CustomPageRoute extends MaterialPageRoute {
  CustomPageRoute({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}

class _DashboardState extends State<Dashboard> {
  late String testColor;
  bool isVisible = true;

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];
  int _selectedIndex = 0;
  final PageController _controller = PageController();
  final List<Widget> _widgetOptions = [
    Packages(), HomeScreen(), Account()
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int _selectedIndex) {
    _controller.jumpToPage(_selectedIndex);
  }

  @override
  void initState() {
    _selectedIndex = widget.currentPageToNavigate ?? 0;
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    if (isLandscape == true) {
      setState(() {
        isVisible = false;
      });
    } else {
      setState(() {
        isVisible = true;
      });
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    }
    //  SystemChrome.setPreferredOrientations([
    //     DeviceOrientation.portraitDown,
    //     DeviceOrientation.portraitUp
    //   ]);

    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_selectedIndex].currentState!.maybePop();
        SystemChrome.setPreferredOrientations(
            [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
        if (isFirstRouteInCurrentTab == true) {
          exitApp();
          return false;
        }
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        bottomNavigationBar: Visibility(
          visible: isVisible,
          child: ClipRRect(
              // borderRadius: ThemeStyling.navigationBarStyle,
              child: SizedBox(
                height: 70,
                child: Visibility(
                  visible: isVisible,
                  child: BottomNavigationBar(
                    selectedFontSize: 13,
                    unselectedFontSize: 13,
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: Theme.of(context).primaryColor,
                    showUnselectedLabels: true,
                    showSelectedLabels: true,
                    items: List.of(
                        DefaultValues().defaultNavigationList.map((item) {
                      return BottomNavigationBarItem(
                          icon: item["icon"],
                          activeIcon: item["activeIcon"],
                          label: item["label"],
                          backgroundColor: Theme.of(context).primaryColor);
                    }).toList()),
                    currentIndex: _selectedIndex,
                    selectedItemColor: Theme.of(context).backgroundColor,
                    unselectedItemColor: Theme.of(context).accentColor,
                    onTap: (index) {
                      if (index == _selectedIndex) {
                        Navigator.push(
                            context,
                            CustomPageRoute(
                                builder: (context) =>
                                    Dashboard(currentPageToNavigate: index)));
                      }
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                  ),
                ),
              )),
        ),
        body: Stack(
          children: [
            _buildOffstageNavigator(0),
            _buildOffstageNavigator(1),
            _buildOffstageNavigator(2),
          ],
        ),
      ),
    );
  }
 

  void exitApp() {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            actionsAlignment: MainAxisAlignment.spaceAround,
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: const Text(
              'Please Confirm',
              textAlign: TextAlign.center,
            ),
            content: const Text(
              'Do you want to logout?',
              textAlign: TextAlign.center,
            ),
            actions: [
              SizedBox(
                width: 100,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        // primary: DefaultValues.themeColor
                        ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const MyHomePage()));
                    },
                    child: const Text('Yes')),
              ),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        // primary: DefaultValues.buttonTheme
                        ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('No')),
              )
            ],
          );
        });
  }

 

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [Packages(), HomeScreen(), Account()]
            .elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);

    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name]!(context),
          );
        },
      ),
    );
  }
}
