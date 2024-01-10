import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_articles_app/core/constants/string_constants.dart';
import 'package:ny_articles_app/core/theme/app_text_style.dart';
import 'package:ny_articles_app/core/theme/values/dimensions.dart';
import 'package:ny_articles_app/core/utils/responsive_ui.dart';
import 'package:ny_articles_app/data/model/article_responds.dart';
import 'package:ny_articles_app/presentation/article_screen/bloc/article_bloc.dart';
import 'package:ny_articles_app/presentation/article_screen/bloc/article_state.dart';
import 'package:ny_articles_app/presentation/article_screen/di/di_container.dart';
import 'package:ny_articles_app/presentation/base_page.dart';
import 'package:ny_articles_app/presentation/common_widgets/article_item.dart';
import 'package:ny_articles_app/presentation/common_widgets/custome_appbar.dart';
import 'package:ny_articles_app/presentation/common_widgets/custome_drawer.dart';
import 'package:ny_articles_app/presentation/common_widgets/no_data_found.dart';

class ArticlePage extends BasePage {
  static const routeName = '/article-screen';

  const ArticlePage({super.key});

  @override
  ArticlePageState createState() => ArticlePageState();
}

class ArticlePageState extends BasePageState<ArticlePage> {

  late ArticleBloc _articleCubit;

  @override
  void initState() {
    super.initState();
    _articleCubit = getIt<ArticleBloc>();
    _articleCubit.fetchArticles();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Responsive(
        /// if the UI is different for web/tab we need to create separate widget
        /// now I using same one for all because UI is similar for web and mobile
        /// if we have different Ui for all platform, no need to pass the 2ed argument -Device type
        mobile: mobileView(context,Device.mobile),
        desktop: mobileView(context,Device.desktop), // webView(context),
        tablet: mobileView(context,Device.tablet),
      ),
    );
  }

  Widget mobileView(BuildContext context, Device device) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          AppStrings.homeToolbarTitle,
          style: (device == Device.desktop)
              ? AppTextStyle.wtxtBold25 : AppTextStyle.txtBold18
        ),
        centerTitle: kIsWeb ? true : false,
        actions: const [
          Icon(Icons.search),
          SizedBox(
            width: Dimensions.appWidgetGap10,
          ),
          Icon(
            Icons.more_vert,
          ),
          SizedBox(
            width: Dimensions.appWidgetGap10,
          ),
        ],
      ),
      drawer: kIsWeb ? null : const CustomDrawer(),
      body: BlocConsumer(
        bloc: _articleCubit,
        listener: (BuildContext context, ArticleState state) {
          if (state is ArticleLoading) {
            showLoadingDialog();
          } else if (state is ArticleNoNetwork) {
            showToast(AppStrings.noNetwork);
          } else if (state is ArticleError) {
            hideLoadingDialog();
            if (state.message.isNotEmpty) {
              showToast(state.message);
            } else {
              showToast(AppStrings.serverError);
            }
          }
          if (state is ArticleLoaded) {
            hideLoadingDialog();
          }
        },
        builder: (BuildContext context, ArticleState state) {
          if (state is ArticleLoaded) {
            return articleLister(state.articles,device);
          } else {
            return const NoDataUI(AppStrings.noDataFound);
          }
        },
      ),
    );
  }

  /// if the ui is different for web,
  /// we can add all web related UI components here
  /// or create a separate class for handling web section
  Widget webView(BuildContext context) {
    return Container();
  }

  Widget articleLister(List<Result> articles, Device device) {
    return (articles.isEmpty)
        ? const NoDataUI(AppStrings.noDataFound)
        : ListView.builder(
            shrinkWrap: false,
            itemCount: articles.length,
            itemBuilder: (BuildContext context, int index) {
              return ArticleItemWidget(
                deviceType : device,
                article: articles[index],
                onTap: () => {
                  // on item click navigate to details screen
                },
              );
            },
          );
  }

  @override
  void dispose() {
    _articleCubit.close(); // Close the cubit to avoid memory leaks
    super.dispose();
  }
}
