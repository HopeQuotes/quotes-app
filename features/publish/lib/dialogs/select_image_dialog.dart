import 'package:common/core/baseBottomDialog.dart';
import 'package:common/core/widgets/chip_item_widget.dart';
import 'package:common/core/widgets/input_widget.dart';
import 'package:common/navigation/exp.dart';
import 'package:domain/models/ui/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:publish/bloc/create_quote_bloc.dart';

void showImagesDialog(BuildContext context, CreateQuoteBloc bloc,
    {required Function(QuoteImage) onSelect}) async {
  baseBottomDialog(
      content: BlocProvider.value(
        value: bloc,
        child: BlocConsumer<CreateQuoteBloc, CreateQuoteState>(
          builder: (context, state) {
            return SafeArea(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(24),
                  topLeft: Radius.circular(24),
                ),
                child: Scaffold(
                  body: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 62,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Spacer(),
                            IconButton(
                              padding: const EdgeInsets.all(4),
                              onPressed: () {
                                context.goBack();
                              },
                              icon: const Icon(Icons.close),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(6),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: GridView.count(
                          physics: const BouncingScrollPhysics(),
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          children: (state.images ?? [])
                              .map(
                                (e) => GestureDetector(
                                  child: Container(
                                    margin: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: BlurHash(
                                        duration:
                                            const Duration(milliseconds: 2000),
                                        imageFit: BoxFit.cover,
                                        hash: e.blurHash,
                                        image: e.url,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    onSelect.call(e);
                                    context.goBack();
                                  },
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          listener: (context, state) {
            //
          },
        ),
      ),
      context: context);
}
