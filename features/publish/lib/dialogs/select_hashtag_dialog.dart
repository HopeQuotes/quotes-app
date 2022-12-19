import 'package:common/core/baseBottomDialog.dart';
import 'package:common/core/widgets/chip_item_widget.dart';
import 'package:common/core/widgets/input_widget.dart';
import 'package:common/navigation/exp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:publish/bloc/create_quote_bloc.dart';

void showHashtagsDialog(BuildContext context, CreateQuoteBloc bloc) async {
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
                      height: 100,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Padding(padding: EdgeInsets.all(12)),
                          Flexible(
                            flex: 10,
                            child: Container(
                              margin:
                                  const EdgeInsets.only(top: 12, bottom: 12),
                              child: Input(
                                hint: 'Search',
                                margin:
                                    const EdgeInsets.only(top: 12, bottom: 12),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: IconButton(
                              padding: const EdgeInsets.all(4),
                              onPressed: () {
                                context.goBack();
                              },
                              icon: const Icon(Icons.close),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: GridView.count(
                        physics: const BouncingScrollPhysics(),
                        controller: bloc.hashtagScrollController,
                        crossAxisCount: 2,
                        childAspectRatio: 2.5,
                        children: (state.hashtags ?? [])
                            .map((e) => ChipItem(
                          elevationEffect: false,
                                  canDismiss: false,
                                  text: e.value ?? "",
                                  onDelete: (index) {
                                    //
                                  },
                                  index: 0,
                                ))
                            .toList(),
                      ),
                    )
                  ],
                )),
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
