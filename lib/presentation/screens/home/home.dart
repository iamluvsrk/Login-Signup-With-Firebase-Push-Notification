import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:login_demo/constants/enum.dart';
import 'package:login_demo/constants/theme.dart';
import 'package:login_demo/di/di.dart';
import 'package:login_demo/main.dart';
import 'package:login_demo/presentation/router/routes.dart';
import 'package:login_demo/presentation/screens/home/bloc/home_bloc.dart';
import 'package:login_demo/presentation/widgets/button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title!),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body!)],
                  ),
                ),
              );
            });
      }
    });
  }

// Show Notification Function
  void showNotification() {
    flutterLocalNotificationsPlugin.show(
        0,
        "Login Demo App",
        "Congratulation! Your product Successfully added.",
        NotificationDetails(
            android: AndroidNotificationDetails(channel.id, channel.name,
                channelDescription: channel.description,
                importance: Importance.high,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher')));
  }

// Function to logout the user
  void _logoutUser() {
    getItInstance<HomeBloc>().add(Logout());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorConstants.background,
      body: WillPopScope(
        onWillPop: () {
          return Future.value(false);
        },
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state.pageStatus == PageStatus.success) {
              Navigator.of(context).pushReplacementNamed(AppRoutes.login);
            }
          },
          builder: (context, state) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Homepage',
                      style: AppTextStyle.h1,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    ButtonWidget(
                        buttonText: 'Add Product',
                        onTap: showNotification,
                        buttonColor: Colors.green[400]),
                    const SizedBox(
                      height: 30,
                    ),
                    ButtonWidget(
                        buttonText: 'Logout',
                        isLoading: state.pageStatus == PageStatus.loading,
                        onTap: _logoutUser,
                        buttonColor: Colors.red[400])
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
