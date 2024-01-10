
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ny_articles_app/core/theme/app_text_style.dart';
import 'package:ny_articles_app/core/theme/color_constant.dart';
import 'package:ny_articles_app/core/theme/values/dimensions.dart';
import 'package:ny_articles_app/core/utils/common_util.dart';
import 'package:ny_articles_app/core/utils/responsive_ui.dart';
import 'package:ny_articles_app/core/utils/size_utils.dart';
import 'package:ny_articles_app/data/model/article_responds.dart';

class ArticleItemWidget extends StatelessWidget {
  final Result article;
  final Device? deviceType;
  final VoidCallback? onTap;

  const ArticleItemWidget({
    super.key,
    required this.article,
    this.onTap,
    this.deviceType,
  });

  @override
  Widget build(BuildContext context) {
    var imageUrl = "";
    if (article.media!.isNotEmpty) {
      if (article.media![0].mediaMetadata!.isNotEmpty) {
        if (article.media![0].mediaMetadata![0].url!.isNotEmpty) {
          imageUrl = article.media![0].mediaMetadata![0].url.toString();
        }
      }
    }
    return Card(
        margin: const EdgeInsets.all(10.0),
        child: ListTile(
          onTap: onTap,
          leading: Padding(
            padding: const EdgeInsets.all(3.0),
            child: ClipOval(
              child: Image.network(
                imageUrl,
                width: (deviceType == Device.desktop)
                    ? Dimensions.appWidgetSize50
                    : getSize(55),
                height: (deviceType == Device.desktop)
                    ? Dimensions.appWidgetSize50
                    : getSize(55),
                fit: BoxFit.cover,
                alignment: Alignment.center,
                errorBuilder: (BuildContext context, Object error,
                    StackTrace? stackTrace) {
                  return Icon(
                    Icons.error,
                    size: (deviceType == Device.desktop)
                        ? Dimensions.appWidgetSize50
                        : getSize(55),
                  );
                },
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return CircularProgressIndicator(
                      color: AppColors.green,
                      strokeWidth: 1.5,
                      backgroundColor: AppColors.lightGray,
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    );
                  }
                },
              ),
            ),
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(article.title.toString(),
                  style: (deviceType == Device.desktop)
                      ? AppTextStyle.wTxtBlack20 : AppTextStyle.txtBlack16,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis),
              const SizedBox(height: 5),
              Text(article.byline.toString(),
                  style: (deviceType == Device.desktop)
                      ? AppTextStyle.wTxtGray20 : AppTextStyle.txtGray16,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.date_range,
                    size: (deviceType == Device.desktop) ? 18 : 16,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    GetIt.instance
                        .get<CommonUtil>()
                        .dateFormater(article.publishedDate.toString()),
                    style: (deviceType == Device.desktop)
                        ? AppTextStyle.wTxtGray20 : AppTextStyle.txtGray16,
                  ),
                ],
              )
            ],
          ),
          trailing: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Icon(
              Icons.arrow_forward_ios,
              size: (deviceType == Device.desktop)
                  ? 25
                  : getSize(20),
              color: AppColors.gray,
            ),
          ),
        ));
  }
}
