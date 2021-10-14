import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:k_taxi/features/user/data/datasources/user_remote_data_source.dart';
import 'package:k_taxi/features/user/data/repositories/user_repository_impl.dart';

import 'features/navigation/presentation/pages/home_page.dart';
import 'features/user/presentation/bloc/user_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => BlocProvider(
        create: (context) => UserBloc(
          userRepository: UserRepositoryImpl(
            userRemoteDataSource: FirebaseUserRemoteDataSource(),
          ),
        ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomePage(),
        ),
      ),
    );
  }
}
