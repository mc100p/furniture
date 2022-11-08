import 'package:flutter/material.dart';
import 'package:furniture/pages/bookmark.dart';
import 'package:furniture/pages/details/details.dart';
import 'package:furniture/pages/homepage/homepage_header.dart';
import 'package:furniture/pages/notification.dart';
import 'package:furniture/pages/profile.dart';
import 'package:furniture/utils/furniture_icons.dart';
import 'package:furniture/utils/furniture_list.dart';
import 'package:furniture/utils/icons.dart';
import 'package:furniture/utils/magic_string.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final PageController _pageController = PageController();

  void _onTap(int value) {
    setState(() {
      _currentIndex = value;
    });
    _pageController.jumpToPage(value);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        elevation: 17.0,
        onTap: _onTap,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Furniture.home_page), label: ""),
          BottomNavigationBarItem(icon: Icon(Furniture.bookmark), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Furniture.notification), label: ""),
          BottomNavigationBarItem(icon: Icon(Furniture.user__1_), label: ""),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: [
          HomeContent(size: size),
          Bookmark(),
          NotificationPage(),
          Profile(size: size),
        ],
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List<Map> items = [];
  String currentTag = 'All';

  int _selectedIndex = 0;

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  void setTag(String tag) {
    setState(() {
      currentTag = tag;
    });
  }

  List get itemList {
    if (currentTag == "All") return products;
    return products.where((e) => e.tag == currentTag).toList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      top: true,
      child: Scaffold(
        body: LayoutBuilder(builder: (context, constaint) {
          if (constaint.maxWidth > PageConstaints.tablet) {
            return tabletView();
          } else {
            return mobileView();
          }
        }),
      ),
    );
  }

  CustomScrollView mobileView() {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Header(),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.only(top: 30),
            height: 200,
            child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: iconItems.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setTag(iconItems[index].tag);
                    _onSelected(index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: _selectedIndex == index
                                ? Theme.of(context).primaryColor
                                : Colors.grey[300],
                          ),
                          height: widget.size.height * 0.09,
                          width: widget.size.width * 0.15,
                          child: Icon(
                            iconItems[index].icon,
                            color:
                                _selectedIndex == index ? Colors.white : null,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          iconItems[index].name,
                          style: TextStyle(
                            fontWeight: _selectedIndex == index
                                ? FontWeight.bold
                                : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 4,
            mainAxisSpacing: 30,
            crossAxisSpacing: 10,
            mainAxisExtent: 310.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.detailPage,
                        arguments: Details(
                          itemList: itemList[index],
                        ));
                  },
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            child: Hero(
                              tag: itemList[index].imgUrl,
                              child: Image.asset(
                                itemList[index].imgUrl,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Wrap(
                            children: [
                              Text(
                                itemList[index].name,
                                style:
                                    TextStyle(fontFamily: 'KaiseiOpti-Regular'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Wrap(
                            children: [
                              Text(
                                "\$" + itemList[index].price.toString(),
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontFamily: 'KaiseiOpti-Regular',
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            childCount: itemList.length,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(bottom: 60),
        ),
      ],
    );
  }

  CustomScrollView tabletView() {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Header(),
        ),
        SliverToBoxAdapter(
          child: Center(
            child: Container(
              padding: const EdgeInsets.only(top: 30),
              height: 200,
              child: ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: iconItems.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setTag(iconItems[index].tag);
                      _onSelected(index);
                    },
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: _selectedIndex == index
                                        ? Theme.of(context).primaryColor
                                        : Colors.grey[300],
                                  ),
                                  height: widget.size.height * 0.08,
                                  width: widget.size.width * 0.10,
                                  child: Icon(
                                    iconItems[index].icon,
                                    color: _selectedIndex == index
                                        ? Colors.white
                                        : null,
                                  ),
                                ),
                                SizedBox(height: 2.0),
                                Text(
                                  iconItems[index].name,
                                  style: TextStyle(
                                    fontWeight: _selectedIndex == index
                                        ? FontWeight.bold
                                        : null,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 2 / 4,
            mainAxisSpacing: 30,
            crossAxisSpacing: 10,
            mainAxisExtent: 310.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.detailPage,
                        arguments: Details(
                          itemList: itemList[index],
                        ));
                  },
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            child: Hero(
                              tag: itemList[index].imgUrl,
                              child: Image.asset(
                                itemList[index].imgUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Wrap(
                            children: [
                              Text(
                                itemList[index].name,
                                style:
                                    TextStyle(fontFamily: 'KaiseiOpti-Regular'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Wrap(
                            children: [
                              Text(
                                "\$" + itemList[index].price.toString(),
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontFamily: 'KaiseiOpti-Regular',
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            childCount: itemList.length,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(bottom: 60),
        ),
      ],
    );
  }
}
