import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/models/Article.dart';
import 'package:news_app/utils/colors.dart';
import '../../utils/constant.dart';

class NewsTile extends StatelessWidget {
  final Article article;
  const NewsTile({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: verticalPadding,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(
            color: borderColor,
            width: 0.5,
          ),
        ),
        color: bgColor,
        margin: const EdgeInsets.symmetric(horizontal: horizontalPadding),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: 24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              row1(),
            ],
          ),
        ),
      ),
    );
  }

  Row row1() {
    return Row(
      children: [
        article.urlToImage != null
            ? Image.network(
                article.urlToImage!,
                width: 28,
                height: 28,
              )
            : SvgPicture.asset(
                'assets/icons/news.svg',
                width: 20,
                height: 20,
              ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: horizontalPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.source.name,
                  style: const TextStyle(
                    fontSize: smallFontSize,
                    color: secondaryText,
                  ),
                ),
                Text(
                  article.title,
                  style: const TextStyle(
                    color: primaryText,
                    fontSize: mediumFontSize,
                  ),
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
