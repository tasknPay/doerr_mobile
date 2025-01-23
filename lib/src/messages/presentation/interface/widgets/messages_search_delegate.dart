import 'package:flutter/material.dart';

import '../../../../../shared/presentation/theme/extra_colors.dart';
import '../../../../../shared/presentation/widgets/constants/app_spacer.dart';
import '../../../../../shared/presentation/widgets/constants/app_text.dart';
import '../../../domain/entity/message.dart';

class MessageSearchDelegate extends SearchDelegate<MessageModel?> {
  final List<MessageModel> messageList;

  MessageSearchDelegate(this.messageList);

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: Colors.grey[500],
          fontSize: 16,
          fontWeight: FontWeight.w300,
        ),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
      textTheme: theme.textTheme.copyWith(
        titleLarge: const TextStyle(
          color: Colors.black54,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  @override
  String get searchFieldLabel => 'Search messages';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          color: Colors.grey[600],
        ),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black87,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults();
  }

  Widget _buildSearchResults() {
    final results = messageList
        .where((message) =>
            message.name.toLowerCase().contains(query.toLowerCase()) ||
            message.lastMessage.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.separated(
      padding: const EdgeInsets.only(top: 0, bottom: 5),
      itemCount: results.length,
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.grey[300],
          height: 1.0,
        );
      },
      itemBuilder: (context, index) {
        final message = results[index];
        return ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(message.avatarUrl),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppText.smaller(
                message.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 13,
                ),
              ),
              AppText.smaller(
                message.lastMessage,
                maxLines: 1,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 12,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          trailing: Column(
            children: [
              AppText.smaller(message.time, size: 10),
              const AppSpacer.vShort(),
              if (message.unreadCount > 0)
                Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ExtraColors.customGreen,
                  ),
                  child: Center(
                    child: AppText.smaller(
                      '${message.unreadCount}',
                      size: 9,
                      color: ExtraColors.white,
                    ),
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}
