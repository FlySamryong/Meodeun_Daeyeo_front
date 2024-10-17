import 'package:flutter/material.dart';
import 'package:meodeundaeyeo/action/chat_nav_action.dart';
import 'package:meodeundaeyeo/action/favorite_nav_action.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../action/home_nav_action.dart';
import '../../action/mypage_nav_action.dart';
import '../widget/app_title.dart';
import '../widget/bottom_nav_bar.dart';
import '../widget/chat/chat_list.dart';
import '../widget/search_box.dart';

// 채팅 목록 페이지
class ChatListPage extends StatelessWidget {
  final SizingInformation sizingInformation;

  const ChatListPage({required this.sizingInformation, super.key});

  @override
  Widget build(BuildContext context) {
    final double scaleWidth =
        (sizingInformation.screenSize.width / 360).clamp(0.8, 1.2);

    return Scaffold(
      body: Center(
        child: Container(
          width: 360 * scaleWidth,
          child: Column(
            children: [
              const SizedBox(height: 20),
              const AppTitle(title: '채팅 목록'),
              const SizedBox(height: 10),
              const SearchBox(hintText: '채팅 검색'),
              const SizedBox(height: 15),
              Expanded(
                child: ChatList(
                  scrollController: ScrollController(),
                  sizingInformation: sizingInformation,
                ),
              ),
              BottomNavBar(
                homeAction: HomeNavAction(sizingInformation),
                favoritesAction: FavoriteNavAction(sizingInformation),
                chatAction: ChatNavAction(sizingInformation),
                profileAction: MyPageNavAction(sizingInformation),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
