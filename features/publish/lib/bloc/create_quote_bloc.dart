import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:common/utils/print.dart';
import 'package:common/utils/scroll.dart';
import 'package:domain/models/state/domain_result.dart';
import 'package:domain/models/ui/id_value.dart';
import 'package:domain/models/ui/image.dart';
import 'package:domain/models/ui/quote.dart';
import 'package:domain/repositories/abstraction/publish_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'create_quote_event.dart';

part 'create_quote_state.dart';

class CreateQuoteBloc extends Bloc<CreateQuoteEvent, CreateQuoteState> {
  final PublishRepository _repository;
  final TextEditingController authorController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  final ScrollController hashtagScrollController = ScrollController();
  int page = 1;
  var endOfPaginationReached = false;

  CreateQuoteBloc(this._repository) : super(const CreateQuoteState()) {
    on<CreateQuote>(_createQuote);
    on<RemoveHashTag>(_deleteHashtag);
    on<AddHashTag>(_addHashtag);
    on<LoadHashTags>(_loadHashtags);
    on<LoadImages>(_loadImages);
    on<SetSelectedImage>(_setSelectedImage);

    hashtagScrollController.onBottomReached(() {
      if (!endOfPaginationReached) {
        page++;
        add(LoadHashTags());
      }
    });
  }

  Future<void> _setSelectedImage(
      SetSelectedImage event, Emitter emitter) async {
    return emitter(state.copyWith(selectedImageId: event.image));
  }

  Future<void> _deleteHashtag(RemoveHashTag event, Emitter emitter) async {
    state.userHashtags
        ?.removeWhere((element) => element.value == event.hashtag.value);

    return emitter(state.copyWith(userHashtags: state.userHashtags));
  }

  Future<void> _addHashtag(AddHashTag event, Emitter emitter) async {
    var exist = (state.userHashtags ?? [])
        .where((element) => element.value == event.hashtag.value)
        .toList()
        .isNotEmpty;
    if (!exist) {
      return emitter(state.copyWith(
          userHashtags: (state.userHashtags ?? []) + [event.hashtag]));
    }
  }

  Future<void> _createQuote(CreateQuote event, Emitter emitter) async {
    return emitter.forEach<DomainResult>(
        _repository.createQuote(
            authorController.text,
            bodyController.text,
            (state.userHashtags ?? []).map((e) => e.id).toList(),
            state.selectedImage?.id ?? ""), onData: (data) {
      if (data is DomainSuccess) {
        return state.copyWith(
            createQuoteStatus: CreateQuoteStatus.success,
            message: data.message);
      }
      if (data is DomainError) {
        return state.copyWith(
            createQuoteStatus: CreateQuoteStatus.fail, message: data.message);
      }
      if (data is DomainLoading) {
        return state.copyWith(
            createQuoteStatus: CreateQuoteStatus.loading,
            message: "Creating quote...");
      }
      return state;
    });
  }

  Future<void> _loadHashtags(LoadHashTags event, Emitter emitter) async {
    return emitter.forEach<DomainResult>(_repository.getHashtags(page),
        onData: (data) {
      if (data is DomainLoading) {
        return state.copyWith(
            hashTagPagingStatus: (state.hashtags ?? []).isEmpty == true
                ? HashTagPagingStatus.initialPaging
                : HashTagPagingStatus.pagingLoading);
      }
      if (data is DomainSuccess<List<IdValue>>) {
        endOfPaginationReached = (data.data ?? []).length < 20;
        return state.copyWith(
            hashTagPagingStatus: HashTagPagingStatus.successPaging,
            hashtags: (state.hashtags ?? []) + (data.data ?? []));
      }
      if (data is DomainError) {
        return state.copyWith(
            hashTagPagingStatus: HashTagPagingStatus.failPaging);
      }
      return state;
    });
  }

  Future<void> _loadImages(LoadImages event, Emitter emitter) async {
    return emitter.forEach<DomainResult>(_repository.getImages(),
        onData: (data) {
      if (data is DomainLoading) {
        return state.copyWith(imageStatus: ImageStatus.loading);
      }
      if (data is DomainSuccess<List<QuoteImage>>) {
        return state.copyWith(
            imageStatus: ImageStatus.success,
            images: (state.images ?? []) + (data.data ?? []));
      }
      if (data is DomainError) {
        return state.copyWith(
            imageStatus: ImageStatus.fail, message: data.message);
      }
      return state;
    });
  }
}
