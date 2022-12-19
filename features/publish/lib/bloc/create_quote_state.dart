part of 'create_quote_bloc.dart';

enum CreateQuoteStatus {
  initial,
  success,
  fail,
  loading,
  fileOpened,
  hashTagRemoved
}

enum HashTagPagingStatus {
  successPaging,
  failPaging,
  pagingLoading,
  initialPaging
}

enum ImageStatus { success, fail, loading, initial }

class Content extends Equatable {
  final String value;

  Content({
    required this.value,
  });

  @override
  List<Object?> get props => [value];
}

class CreateQuoteState extends Equatable {
  final CreateQuoteStatus? createQuoteStatus;
  final ImageStatus? imageStatus;
  final List<IdValue>? hashtags;
  final List<QuoteImage>? images;
  final List<IdValue>? userHashtags;
  final List<Content>? fileContent;
  final String? message;
  final HashTagPagingStatus? hashTagPagingStatus;
  final String? selectedImageId;
  final List<QuoteState>? quoteStates;
  final QuoteState? selectedQuoteState;

  @override
  List<Object?> get props => [
        createQuoteStatus,
        hashtags,
        message,
        hashTagPagingStatus,
        userHashtags,
        imageStatus,
        images,
        selectedImageId,
        fileContent,
        quoteStates,
        selectedQuoteState
      ];

  const CreateQuoteState(
      {this.createQuoteStatus,
      this.hashtags,
      this.message,
      this.hashTagPagingStatus,
      this.images,
      this.selectedImageId,
      this.imageStatus,
      this.fileContent,
      this.selectedQuoteState,
      this.quoteStates,
      this.userHashtags});

  CreateQuoteState copyWith({
    CreateQuoteStatus? createQuoteStatus,
    ImageStatus? imageStatus,
    List<IdValue>? hashtags,
    List<QuoteImage>? images,
    List<IdValue>? userHashtags,
    List<Content>? fileContent,
    String? message,
    HashTagPagingStatus? hashTagPagingStatus,
    String? selectedImageId,
    List<QuoteState>? quoteStates,
    QuoteState? selectedQuoteState,
  }) {
    return CreateQuoteState(
      createQuoteStatus: createQuoteStatus ?? this.createQuoteStatus,
      imageStatus: imageStatus ?? this.imageStatus,
      hashtags: hashtags ?? this.hashtags,
      images: images ?? this.images,
      userHashtags: userHashtags ?? this.userHashtags,
      fileContent: fileContent ?? this.fileContent,
      message: message ?? this.message,
      hashTagPagingStatus: hashTagPagingStatus ?? this.hashTagPagingStatus,
      selectedImageId: selectedImageId ?? this.selectedImageId,
      quoteStates: quoteStates ?? this.quoteStates,
      selectedQuoteState: selectedQuoteState ?? this.selectedQuoteState,
    );
  }
}
