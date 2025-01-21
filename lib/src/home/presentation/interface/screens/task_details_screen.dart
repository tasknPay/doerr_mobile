import 'package:doerr/shared/presentation/widgets/constants/app_spacer.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/presentation/theme/extra_colors.dart';
import '../../../../../shared/presentation/widgets/app_button.dart';
import '../../../../../shared/presentation/widgets/constants/app_text.dart';

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({super.key});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                decoration: const BoxDecoration(
                  color: ExtraColors.customGreen, // Fallback color
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://media.licdn.com/dms/image/v2/D5612AQHLRQjtYYOubw/article-cover_image-shrink_720_1280/article-cover_image-shrink_720_1280/0/1698003256174?e=2147483647&v=beta&t=7ihBPZNiv2_hILZdQm9xXUfL5tlV4aR-qMiJLeZQXQQ',
                    ),
                    fit: BoxFit.cover, // Image covers the container
                  ),
                ),
              ),
              Positioned(
                top: 16.0, // Adjust for your preferred position
                left: 16.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pop(); // Go back to the previous screen
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.all(8.0), // Padding inside the circle
                    decoration: const BoxDecoration(
                      color: Colors.black54, // Blackish background
                      shape: BoxShape.circle, // Circular shape
                    ),
                    child: const Icon(
                      Icons.arrow_back, // Back icon
                      color: Colors.white, // Icon color
                      size: 24.0, // Icon size
                    ),
                  ),
                ),
              ),
            ],
          ),
          const AppSpacer.vShort(),
          const ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/1222271/pexels-photo-1222271.jpeg?cs=srgb&dl=pexels-justin-shaifer-501272-1222271.jpg&fm=jpg'),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText.smaller('Bernard Awusi', color: Colors.black87),
                AppText.smaller('⭐ 5.0', size: 12, color: Colors.black87),
              ],
            ),
          ),
          const AppSpacer.vShort(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AppText.small(
                  maxLines: 1,
                  padding: EdgeInsets.only(left: 16),
                  'Political Flyer Design',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
              AppSpacer.hLarge(),
              AppText.small(
                padding: EdgeInsets.only(right: 16),
                'GHS 70.00',
                style: TextStyle(
                    color: ExtraColors.customGreen,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          const AppSpacer.vLarge(),
          const AppText.smaller(
            maxLines: 1,
            padding: EdgeInsets.only(left: 16),
            'Task Description',
            style: TextStyle(
                fontWeight: FontWeight.normal,
                overflow: TextOverflow.ellipsis,
                color: Colors.black87),
          ),
          const AppText.smaller(
            // maxLines: 1,
            padding: EdgeInsets.only(left: 16, bottom: 10),
            "I need a political flyer mockup designed. If you're skilled in graphic design and can create a professional and eye-catching flyer, let’s work together!",
            style: TextStyle(
                fontWeight: FontWeight.normal,
                // overflow: TextOverflow.ellipsis,
                color: ExtraColors.darkGrey,
                fontSize: 12),
          ),
          const Divider(color: ExtraColors.lightGrey),
          const AppText.smaller(
            maxLines: 1,
            padding: EdgeInsets.only(left: 16),
            'Colors & Text',
            style: TextStyle(
                fontWeight: FontWeight.normal,
                overflow: TextOverflow.ellipsis,
                color: Colors.black87),
          ),
          const AppText.smaller(
            // maxLines: 1,
            padding: EdgeInsets.only(left: 16, bottom: 10),
            "Bold, high energy colors (like red, blue, white) with strong, clear fonts and a focus on key points of my campaign agenda.",
            style: TextStyle(
                fontWeight: FontWeight.normal,
                // overflow: TextOverflow.ellipsis,
                color: ExtraColors.darkGrey,
                fontSize: 12),
          ),
          const Divider(color: ExtraColors.lightGrey),
          const AppText.smaller(
            maxLines: 1,
            padding: EdgeInsets.only(left: 16),
            'Dimensions',
            style: TextStyle(
                fontWeight: FontWeight.normal,
                overflow: TextOverflow.ellipsis,
                color: Colors.black87),
          ),
          const AppText.smaller(
            // maxLines: 1,
            padding: EdgeInsets.only(left: 16, bottom: 10),
            "Standard 8.5 x 11 inches, suitable for both print and digital use.",
            style: TextStyle(
                fontWeight: FontWeight.normal,
                // overflow: TextOverflow.ellipsis,
                color: ExtraColors.darkGrey,
                fontSize: 12),
          ),
          const Divider(color: ExtraColors.lightGrey),
          const AppText.smaller(
            maxLines: 1,
            padding: EdgeInsets.only(left: 16),
            '📌 Deadline : March 8th 2025',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
                fontSize: 12,
                color: Colors.black87),
          ),
          const Divider(color: ExtraColors.lightGrey),
          const AppText.smaller(
            maxLines: 1,
            padding: EdgeInsets.only(left: 16),
            '✅ 15 jobs posted by Kwasi were successfully completed',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
                fontSize: 12,
                color: Colors.black87),
          ),
          const Divider(color: ExtraColors.lightGrey),
          const AppSpacer.vShort(),
          const AppText.smaller(
            maxLines: 1,
            padding: EdgeInsets.only(left: 16),
            'Reviews',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
                color: Colors.black87),
          ),
          const AppSpacer.vShort(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: ExtraColors.darkGrey, width: 0.3),
                borderRadius: BorderRadius.circular(8)),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("⭐⭐⭐⭐⭐"),
                AppText.smaller(
                    padding: EdgeInsets.only(top: 5, bottom: 10),
                    size: 12,
                    color: ExtraColors.grey,
                    'Kwasi is a good poster who gives clarity to designers to complete the job. His deadlines are flexible and I love working with him.'),
                AppText.smaller(
                    padding: EdgeInsets.only(bottom: 5),
                    size: 10,
                    color: ExtraColors.grey,
                    '~Kofi Amoako, 05/12/25')
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: AppButton(
        height: 45,
        borderRadius: 10,
        backgroundColor: ExtraColors.customGreen,
        text: 'Apply',
        textColor: ExtraColors.white,
        padding: const EdgeInsets.all(16),
        onTap: () {},
      ),
    );
  }
}
