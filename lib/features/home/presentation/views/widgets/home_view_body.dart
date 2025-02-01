import 'package:chatty/core/utils/database_utils.dart';
import 'package:chatty/features/home/add_room/presentation/views/widgets/room_widget.dart';
import 'package:chatty/features/home/presentation/manager/home_navigator.dart';
import 'package:chatty/features/home/presentation/manager/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> implements HomeNavigator {
  HomeViewModel viewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: StreamBuilder(
        stream: DatabaseUtils.getRoom(),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xFF3598DB),
              ),
            );
          } else if (asyncSnapshot.hasError) {
            return Text(asyncSnapshot.error.toString());
          }else if (asyncSnapshot.connectionState==ConnectionState.none){
            return Center(
              child: Text("No rooms joined yet",style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),),
            );
          }
          else {
            var roomList =
                asyncSnapshot.data?.docs.map((doc) => doc.data()).toList();
            return Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: GridView.builder(
                itemCount: roomList?.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8
                ),
                itemBuilder: (context, index) {
                  return RoomWidget(room: roomList![index]);
                },
              ),
            );
          }
        },
      ),
    );
  }
}
