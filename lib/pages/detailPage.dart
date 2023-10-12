import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/msic/AppColors.dart';
import 'package:travel_app/widgets/appButton.dart';
import 'package:travel_app/widgets/appLargeText.dart';
import 'package:travel_app/widgets/appText.dart';
import 'package:travel_app/widgets/responsiveButton.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int startCount = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, CubitStates>(builder: (context, states) {
      DetailState detail = states as DetailState;
      return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 370,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "http://mark.bslmeiyu.com/uploads/" +
                                detail.places.img),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Positioned(
                  top: 300,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    width: MediaQuery.of(context).size.width,
                    height: 600,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppLargeText(
                                text: detail.places.name,
                                color: Colors.black.withOpacity(0.8),
                              ),
                              AppLargeText(
                                text: "\$" + detail.places.price.toString(),
                                color: AppColors.mainColor,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: AppColors.mainColor,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            AppText(
                              text: detail.places.location,
                              color: AppColors.mainColor,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(5, (index) {
                                return Icon(
                                  Icons.star,
                                  color: detail.places.starts > index
                                      ? AppColors.starColor
                                      : AppColors.mainTextColor,
                                );
                              }),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            AppText(
                              text: "(4.0)",
                              color: AppColors.textColor1,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        AppLargeText(
                          text: "People",
                          size: 20,
                          color: Colors.black.withOpacity(.8),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        AppText(
                          text: "Number of people in your group",
                          color: AppColors.mainTextColor,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Wrap(
                          children: List.generate(5, (index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: AppButton(
                                  size: 50,
                                  color: selectedIndex == index
                                      ? Color.fromARGB(255, 137, 208, 216)
                                      : Colors.black,
                                  bgColor: selectedIndex == index
                                      ? Colors.black
                                      : AppColors.buttonBackground,
                                  borderClr: selectedIndex == index
                                      ? Colors.black
                                      : AppColors.buttonBackground,
                                  isIcon: false,
                                  text: (index + 1).toString(),
                                ),
                              ),
                            );
                          }),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AppLargeText(
                          text: "Discription",
                          size: 20,
                          color: Colors.black.withOpacity(0.8),
                        ),
                        AppText(
                          text: detail.places.discription,
                          color: AppColors.mainTextColor,
                        ),
                      ],
                    ),
                  )),
              Positioned(
                  bottom: 30,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      AppButton(
                        size: 60,
                        color: AppColors.textColor1,
                        bgColor: Color.fromARGB(255, 149, 221, 222),
                        borderClr: AppColors.textColor2,
                        isIcon: true,
                        icon: Icons.favorite_border_outlined,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const ResponsiveButton(
                        isreponsive: true,
                      )
                    ],
                  )),
              Positioned(
                top: 30,
                left: 15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () =>
                            {BlocProvider.of<AppCubit>(context).goBack()},
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 30,
                          color: Color.fromARGB(255, 5, 17, 19),
                        )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 120,
                    ),
                    IconButton(
                      onPressed: () => {},
                      icon:
                          const Icon(Icons.short_text, size: 30, color: Color.fromARGB(255, 127, 189, 206)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
