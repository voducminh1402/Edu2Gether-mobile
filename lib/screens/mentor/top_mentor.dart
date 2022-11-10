import 'package:edu2gether_mobile/models/mentor.dart';
import 'package:edu2gether_mobile/screens/main_page/main_page.dart';
import 'package:edu2gether_mobile/screens/mentor/mentor_profile.dart';
import 'package:edu2gether_mobile/services/mentor_service.dart';
import 'package:edu2gether_mobile/utilities/dimensions.dart';
import 'package:edu2gether_mobile/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/big_text.dart';

class TopMentorPage extends StatefulWidget {
  const TopMentorPage({Key? key}) : super(key: key);

  @override
  State<TopMentorPage> createState() => _TopMentorPageState();
}

class _TopMentorPageState extends State<TopMentorPage> {
  String? _search;
  bool isSearching = false;
  List<Mentor>? mentors = [];
  List<Mentor>? searchMentors = [];
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    mentors = (await MentorService().getMentor())!;
    searchMentors = mentors;
    setState(() {
      if (mentors != null) {
        isLoaded = true;
      }
    });
  }

  void _searchByName(value) {
    setState(() {
      searchMentors = mentors!
          .where((mentor) =>
              mentor.fullName.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return !isLoaded
        ? Scaffold(
            body: const Center(
            child: CircularProgressIndicator(),
          ))
        : Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.white,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Get.to(() => MainPage());
                  },
                ),
                title: !isSearching
                    ? Text(
                        'Top Mentor',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimension.font8),
                      )
                    : TextField(
                        onChanged: (value) {
                          _searchByName(value);
                        },
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            // icon: Icon(
                            //   Icons.search,
                            //   color: Colors.black,
                            // ),
                            hintText: "Search by name",
                            hintStyle: TextStyle(color: Colors.black)),
                      ),
                actions: <Widget>[
                  isSearching
                      ? IconButton(
                          icon: Icon(
                            Icons.cancel,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              isSearching = false;
                              searchMentors = mentors;
                            });
                          },
                        )
                      : IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              isSearching = true;
                            });
                          },
                        )
                ],
                elevation: 0),
            body: ListView.builder(
              itemCount: searchMentors?.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () =>
                      Get.to(() => MentorProfile(id: searchMentors![index].id)),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: Dimension.height3,
                        right: Dimension.width5,
                        left: Dimension.width5),
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: BigText(
                          text: searchMentors![index].fullName,
                          fontweight: FontWeight.bold,
                          size: Dimension.font8,
                        ),
                      ),
                      subtitle: SmallText(
                        text: searchMentors![index].job,
                        size: Dimension.font6,
                        color: Colors.black38,
                      ),
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(searchMentors![index].image),
                        radius: Dimension.width13,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
  }
}
