import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:project_login/ViewModels/ContentStoryAudioViewModel.dart';

class ChooseChapterAudioBottomSheet extends StatefulWidget {
  final ContentStoryAudioViewModel _contentStoryAudioViewModel;
  final Function(int, int) onChooseChapter;

  const ChooseChapterAudioBottomSheet(this._contentStoryAudioViewModel,
      this.onChooseChapter,
      {super.key});

  @override
  _ChooseChapterAudioBottomSheetState createState() {
    return _ChooseChapterAudioBottomSheetState();
  }
}

class _ChooseChapterAudioBottomSheetState extends State<ChooseChapterAudioBottomSheet> {
  ContentStoryAudioViewModel get contentStoryAudioViewModel =>
      widget._contentStoryAudioViewModel;
  List<String> chapterPaginationList = [];
  String dropdownValue = '';
  int currentPageNumber = 0;

  @override
  void initState() {
    super.initState();

    for (int i = 1; i <= contentStoryAudioViewModel.chapterPagination.maxPage; i++) {
      chapterPaginationList.add(i.toString());
    }
    Logger logger = Logger();
    logger.i(chapterPaginationList);

    dropdownValue =
        contentStoryAudioViewModel.chapterPagination.currentPage.toString();
    currentPageNumber = contentStoryAudioViewModel.chapterPagination.currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    ScrollController scrollController = ScrollController();

    return Container(
      width: double.infinity,
      height: screenHeight / 2,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 10, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      // switch to previous page
                      if (currentPageNumber > 1) {
                        setState(() {
                          currentPageNumber--;
                          dropdownValue = currentPageNumber.toString();
                        });

                        // fetch new chapter pagination
                        contentStoryAudioViewModel.fetchChapterPagination(
                            widget._contentStoryAudioViewModel.contentStory!.title,
                            currentPageNumber,
                            widget._contentStoryAudioViewModel.currentSource,
                            false).then((_) {
                          setState(() {
                            // Update UI after data has been fetched
                          });
                        });
                      }
                    },
                    child: const ImageIcon(
                        AssetImage('assets/images/back_button.png')),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              // choose new page
                              dropdownValue = newValue!;
                              currentPageNumber = int.parse(newValue);

                              // fetch new chapter pagination
                              contentStoryAudioViewModel.fetchChapterPagination(
                                  widget._contentStoryAudioViewModel.contentStory!.title,
                                  currentPageNumber,
                                  widget._contentStoryAudioViewModel.currentSource,
                                  false).then((_) {
                                setState(() {
                                  // Update UI after data has been fetched
                                });
                              });
                            });
                          },
                          items: chapterPaginationList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(value),
                              ),
                            );
                          }).toList(),
                          menuMaxHeight: screenHeight / 3,
                          icon: const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Icon(Icons.arrow_drop_down),
                          ),
                        ),
                      ),
                    ),

                  ),
                  InkWell(
                    onTap: () {
                      // switch to next page
                      if (currentPageNumber < contentStoryAudioViewModel.chapterPagination.maxPage) {
                        setState(() {
                          currentPageNumber++;
                          dropdownValue = currentPageNumber.toString();
                        });

                        // fetch new chapter pagination
                        contentStoryAudioViewModel.fetchChapterPagination(
                            widget._contentStoryAudioViewModel.contentStory!.title,
                            currentPageNumber,
                            widget._contentStoryAudioViewModel.currentSource,
                            false).then((_) {
                          setState(() {
                            // Update UI after data has been fetched
                          });
                        });
                      }
                    },
                    child: const ImageIcon(
                        AssetImage('assets/images/next_button.png')),
                  ),
                ],
              ),
            ),
          ),
          // list chapters
          Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: contentStoryAudioViewModel.chapterPagination.listChapter
                    ?.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      "${contentStoryAudioViewModel.chapterPagination
                          .listChapter?[index].content}",
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      widget.onChooseChapter(index, currentPageNumber);
                      Navigator.of(context).pop();
                    },
                  );
                },
              )),
        ],
      ),
    );
  }
}
