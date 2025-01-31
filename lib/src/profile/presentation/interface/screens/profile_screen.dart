import 'package:doerr/shared/presentation/theme/extra_colors.dart';
import 'package:doerr/shared/presentation/widgets/constants/app_spacer.dart';
import 'package:doerr/shared/presentation/widgets/constants/app_text.dart';
import 'package:doerr/src/profile/presentation/interface/widgets/interest_chip.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isAboutMeExpanded = false;

  @override
  Widget build(BuildContext context) {
    const aboutMeText =
        "I'm Benedict Nana Asare, a passionate mobile developer with expertise in Flutter. I enjoy building intuitive and high-performing applications, constantly pushing my limits to learn and grow. With a background in Computer Science, I specialize in crafting seamless user experiences and optimizing app performance.";

    return Scaffold(
      body: ListView(
        children: [
          Image.network(
            'https://marketplace.canva.com/EAECJXaRRew/3/0/1600w/canva-do-what-is-right-starry-sky-facebook-cover-4SpKW5MtQl4.jpg',
            height: MediaQuery.of(context).size.height * 0.2,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Transform.translate(
            offset: const Offset(0, -30),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 50,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const AppSpacer.vShorter(),
                  const AppText.small(
                    'Clara Sarpong',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Row(
                    children: [
                      AppText.smaller('4.9⭐  ', maxLines: 1),
                      AppText.smaller(
                        '(58 Reviews)',
                        color: ExtraColors.darkGrey,
                        size: 12,
                        maxLines: 1,
                      ),
                      Spacer(),
                      FittedBox(
                        child: AppText.smaller(
                          '• Response time - 5 mins',
                          maxLines: 1,
                          style: TextStyle(
                              color: ExtraColors.darkGrey,
                              fontSize: 11,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 80,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                color: ExtraColors.customGreen.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppText.medium('GHS 540'),
                    AppText.smaller(
                      'Total Earning',
                      color: ExtraColors.darkGrey,
                      size: 10,
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppText.medium('3'),
                    AppText.smaller(
                      'Pending Jobs',
                      color: ExtraColors.darkGrey,
                      size: 10,
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppText.medium('5'),
                    AppText.smaller(
                      'Jobs Posted',
                      color: ExtraColors.darkGrey,
                      size: 10,
                    )
                  ],
                )
              ],
            ),
          ),
          const AppSpacer.vLarge(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppText.smaller(
                  'About me',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isAboutMeExpanded = !_isAboutMeExpanded;
                    });
                  },
                  child: Icon(
                    _isAboutMeExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: ExtraColors.darkGrey,
                  ),
                ),
              ],
            ),
          ),
          AppText.smaller(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            _isAboutMeExpanded ? aboutMeText : _truncateText(aboutMeText, 3),
            style: const TextStyle(
              color: ExtraColors.grey,
              fontSize: 12,
            ),
            maxLines: _isAboutMeExpanded ? null : 3,
          ),
          const AppSpacer.vLarge(),
          const AppText.smaller(
            padding: EdgeInsets.symmetric(horizontal: 16),
            'Interests',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Wrap(
              runSpacing: 2,
              spacing: 8,
              children: [
                for (var interest in [
                  'Mobile Dev',
                  'Flutter',
                  'UI/UX Design',
                  'Open Source'
                ])
                  InterestChip(label: interest),
              ],
            ),
          ),
          const AppSpacer.vShorter(),
          const AppText.smaller(
            maxLines: 1,
            padding: EdgeInsets.only(left: 16),
            '✅ 120 jobs successfully completed by you',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
                fontSize: 12,
                color: Colors.black87),
          ),
          const AppSpacer.vLarge(),
          const AppText.smaller(
            padding: EdgeInsets.only(left: 16),
            'Reviews received',
            style: TextStyle(fontWeight: FontWeight.bold),
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
          const AppSpacer.vShort(),
        ],
      ),
    );
  }

  // Helper method to truncate text to a specified number of lines
  String _truncateText(String text, int maxLines) {
    List<String> words = text.split(' ');
    int estimatedWordsPerLine = 6; // Adjust this based on typical line length
    int wordsToTake = maxLines * estimatedWordsPerLine;

    if (words.length <= wordsToTake) return text;

    return '${words.take(wordsToTake).join(' ')}...';
  }
}
