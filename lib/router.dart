import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:no_broker_demo/views/add_post_page.dart';
import 'package:no_broker_demo/views/chats_page.dart';
import 'package:no_broker_demo/views/home_page.dart';
import 'package:no_broker_demo/views/profile_page.dart';
import 'package:no_broker_demo/views/search_page.dart';

import 'custom_widgets/custom_bottom_navigation_bar.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const CustomBottomNavigationBar();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return const HomePage();
          },
        ),
        GoRoute(
          path: 'search',
          builder: (BuildContext context, GoRouterState state) {
            return const SearchPage();
          },
        ),
        GoRoute(
          path: 'add-post',
          builder: (BuildContext context, GoRouterState state) {
            return const AddPostPage();
          },
        ),
        GoRoute(
          path: 'chats',
          builder: (BuildContext context, GoRouterState state) {
            return const ChatsPage();
          },
        ),
        GoRoute(
          path: 'profile',
          builder: (BuildContext context, GoRouterState state) {
            return const ProfilePage();
          },
        ),
      ],
    ),
  ],
);
