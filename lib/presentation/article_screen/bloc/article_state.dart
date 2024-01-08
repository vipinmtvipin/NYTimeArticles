import 'package:equatable/equatable.dart';
import 'package:ny_articles_app/data/model/article_responds.dart';

class ArticleState extends Equatable {
  final bool isFailure;
  final bool noNetwork;
  final bool isLoading;
  final String errorMessage;
  final List<Result> cartList;

  const ArticleState({
    required this.cartList,
    required this.isFailure,
    required this.noNetwork,
    required this.errorMessage,
    required this.isLoading,
  });

  factory ArticleState.initial() {
    return const ArticleState(
      noNetwork: false,
      cartList: [],
      isFailure: false,
      isLoading: false,
      errorMessage: '',
    );
  }

  ArticleState dataWith({
    bool? isFailure,
    bool? noNetwork,
    String? errorMessage,
    List<Result>? cartList,
    bool? isLoading,
  }) {
    return ArticleState(
      cartList: cartList ?? this.cartList,
      isLoading: isLoading ?? this.isLoading,
      isFailure: isFailure ?? this.isFailure,
      noNetwork: noNetwork ?? this.noNetwork,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
        cartList,
        isFailure,
        noNetwork,
        errorMessage,
        isLoading,
      ];

  @override
  String toString() {
    return ''' MyFormState {
      message : $errorMessage,
      data    : ${cartList.length}
    }''';
  }
}
