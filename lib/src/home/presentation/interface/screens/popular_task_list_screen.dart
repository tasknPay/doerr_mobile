import 'package:doerr/shared/presentation/widgets/constants/app_text.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../../shared/presentation/theme/extra_colors.dart';
import '../../../../../shared/presentation/widgets/constants/app_spacer.dart';

class PopularTaskListScreen extends StatefulWidget {
  const PopularTaskListScreen({super.key});

  @override
  State<PopularTaskListScreen> createState() => _PopularTaskListScreenState();
}

class _PopularTaskListScreenState extends State<PopularTaskListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText.medium('Graphics & Design',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ListView.separated(
        itemCount: 5,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          return Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                // height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment
                            .stretch, // This makes children stretch vertically
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.25,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8)),
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8)),
                              child: Image.network(
                                'https://img.freepik.com/premium-vector/planning-man-marks-completed-tasks-list_491047-705.jpg',
                                fit: BoxFit
                                    .cover, // Ensures the image covers the container properly
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppSpacer.vShort(),
                                AppText.smaller(
                                  padding: EdgeInsets.fromLTRB(16, 10, 0, 08),
                                  'Errands to Bomso Gate',
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                                AppText.smaller(
                                  maxLines: 2,
                                  padding: EdgeInsets.fromLTRB(16, 0, 16, 10),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: ExtraColors.darkGrey,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  'This task involves delivering a package from Ayeds, "The Octopus", to Bomso Gate, KNUST. The delivery required ensuring the pachage reaches its destunation securely because it is a bit fragile.',
                                ),
                                AppSpacer.vShort(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const AppSpacer.vShort(),
                    const Column(
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
                            Material(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: ExtraColors.customGreen,
                              child: AppText(
                                padding: EdgeInsets.all(4),
                                'GHS 50.00',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: ExtraColors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        AppSpacer.vShorter(),
                        ListTile(
                          dense: true,
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
                        AppSpacer.vShorter(),
                      ],
                    ),
                  ],
                ),
              ),
              Transform.translate(
                  offset: const Offset(-20, 2),
                  child: const Icon(IconlyLight.heart,
                      color: ExtraColors.customGreen))
            ],
          );
        },
      ),
    );
  }
}
