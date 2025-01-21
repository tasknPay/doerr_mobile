import 'package:doerr/shared/presentation/theme/extra_colors.dart';
import 'package:doerr/shared/presentation/widgets/constants/app_spacer.dart';
import 'package:doerr/shared/presentation/widgets/constants/app_text.dart';
import 'package:doerr/shared/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:smooth_corner/smooth_corner.dart';

import '../../../../../shared/presentation/widgets/constants/decorations.dart';
import 'popular_task_list_screen.dart';
import 'task_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const AppText.large('Doerr'),
      ),
      body: ListView(
        padding: EdgeInsets.zero.copyWith(bottom: 16),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0).copyWith(top: 0),
            child: Column(
              children: [
                SearchBar(
                  textStyle: const WidgetStatePropertyAll(
                    TextStyle(color: ExtraColors.grey, fontSize: 13),
                  ),
                  onTapOutside: (event) =>
                      FocusManager.instance.primaryFocus?.unfocus(),
                  backgroundColor: WidgetStateProperty.all(Colors.transparent),
                  elevation: WidgetStateProperty.all(0),
                  hintText: "What do you need help with?",
                  hintStyle: const WidgetStatePropertyAll(
                    TextStyle(color: ExtraColors.darkGrey, fontSize: 13),
                  ),
                  padding: const WidgetStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  ),
                  leading: const Icon(IconlyLight.search,
                      color: ExtraColors.grey, size: 22),
                  trailing: const <Widget>[
                    Icon(IconlyLight.filter, color: ExtraColors.grey, size: 22),
                  ],
                  side: WidgetStatePropertyAll(
                    BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                const AppSpacer.vLarger(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText.small(
                      'Popular Tasks',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    // AppText.smaller(
                    //   'See all',
                    //   style: TextStyle(color: ExtraColors.darkGrey),
                    // )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 150,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(width: 16),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    NavigationHelper.navigateTo(
                        context, const PopularTaskListScreen());
                  },
                  child: SmoothContainer(
                    height: 150,
                    color: ExtraColors.white,
                    smoothness: 1,
                    width: 120,
                    borderRadius: AppDecorations.tinyRadius,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: AppDecorations.tinyRadius.topLeft,
                            topRight: AppDecorations.tinyRadius.topRight,
                          ),
                          child: const SizedBox(
                            height: 150 * 0.75,
                            width: 120,
                            child: Image(
                              image: NetworkImage(
                                  'https://cdn.slidesharecdn.com/ss_thumbnails/031110choresanderrandsliesl-101102035311-phpapp02-thumbnail.jpg?width=640&height=640&fit=bounds'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const AppText.smaller(
                          padding: EdgeInsets.all(5),
                          'Graphics & Design',
                          maxLines: 1,
                          align: TextAlign.start,
                          size: 12,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.small(
                'Active Jobs',
                padding: EdgeInsets.fromLTRB(16, 25, 0, 10),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount:
                  2, // Only 1 item in this case (you can change this for more items)
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 16), // Add space between items
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    NavigationHelper.navigateTo(
                      context,
                      const TaskDetailsScreen(),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    width: double.infinity,
                    // height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(color: ExtraColors.darkGrey, width: 0.3),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://images.pexels.com/photos/1222271/pexels-photo-1222271.jpeg?cs=srgb&dl=pexels-justin-shaifer-501272-1222271.jpg&fm=jpg'),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AppText.smaller('Bernard Awusi',
                                  color: Colors.black87),
                              AppText.smaller('⭐ 5.0',
                                  size: 12, color: Colors.black87),
                            ],
                          ),
                        ),
                        AppText.smaller(
                          padding: EdgeInsets.fromLTRB(16, 0, 0, 08),
                          'Errands to Bomso Gate',
                          maxLines: 1,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        AppText.smaller(
                            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            style: TextStyle(
                                fontSize: 12, color: ExtraColors.darkGrey),
                            'This task involves delivering a package from Ayeds, "The Octopus", to Bomso Gate, KNUST. The delivery required ensuring the pachage reaches its destunation securely because it is a bit fragile.'),
                        AppSpacer.vShort(),
                        Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 16),
                                Icon(IconlyLight.calendar, size: 20),
                                SizedBox(width: 3),
                                Text(
                                  'Today 27th Dec 2025, 5PM GMT',
                                  style: TextStyle(
                                      fontSize: 12, color: ExtraColors.grey),
                                ),
                              ],
                            ),
                            AppSpacer.vShorter(),
                            Row(
                              children: [
                                SizedBox(width: 16),
                                Icon(IconlyLight.wallet, size: 20),
                                SizedBox(width: 3),
                                Text(
                                  'GHS 50.00',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: ExtraColors.customGreen,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            AppSpacer.vShort(),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
