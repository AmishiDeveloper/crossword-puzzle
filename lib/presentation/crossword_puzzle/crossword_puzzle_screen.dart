import 'package:crossword_puzzle/core/const/colors/app_colors.dart';
import 'package:crossword_puzzle/core/const/helper/helper.dart';
import 'package:crossword_puzzle/presentation/grid_dimensions/grid_dimensions_screen.dart';
import 'package:crossword_puzzle/shared_custom_widgets/elevated_button/custom_elevated_button.dart';
import 'package:crossword_puzzle/shared_custom_widgets/text_form_field/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CrosswordPuzzleScreen extends StatefulWidget {
  final int rows;
  final int cols;
  final String alphabetString;

  const CrosswordPuzzleScreen({
    super.key,
    required this.rows,
    required this.cols,
    required this.alphabetString,
  });

  @override
  State<CrosswordPuzzleScreen> createState() => _CrosswordPuzzleScreenState();
}

class _CrosswordPuzzleScreenState extends State<CrosswordPuzzleScreen> {
  late final List<List<String>> alphabetsGrid;
  late TextEditingController _wordSearchController;
  late List<String> alphabetsList;
  Set<int> _highlightedIndices = {};

  @override
  void initState() {
    super.initState();
    _wordSearchController = TextEditingController();

    // initializing the 2d grid of size m*n with empty strings ""
    // alphabetsGrid = List.generate(
    //   widget.rows,
    //       (r) => List.generate(widget.cols, (c) => ''),
    // );

    // initializing the sD array from alphabetsList
    alphabetsGrid = List.generate(
      widget.rows,
      (int rowIndex) => List.generate(
        widget.cols,
        (int colIndex) =>
            widget.alphabetString[(rowIndex * widget.cols) + colIndex],
      ),
    );
  }

  @override
  void dispose() {
    _wordSearchController.dispose();
    super.dispose();
  }

  void searchWord(String word) {
    final String cleanWord = word.trim().toUpperCase();
    if (cleanWord.isEmpty) {
      setState(() => _highlightedIndices = {});
      return;
    }

    final Set<int> matches = {};
    int searchWordLength = cleanWord.length;

    for (int r = 0; r < widget.rows; r++) {
      for (int c = 0; c < widget.cols; c++) {

        // checking word from west to east
        if ((c + searchWordLength) <= widget.cols) {
          bool match = true;

          for (int k = 0; k < word.length; k++) {
            if (alphabetsGrid[r][c + k] != cleanWord[k]) {
              match = false;
              break;
            }
          }
          if (match) {
            print("Found towards EAST starting at: ($r /, $c)");
            for (int k = 0; k < searchWordLength; k++) {
              matches.add((r * widget.cols) + (c + k));
            }
          }
        }

        // checking word from north to south
        if ((r + searchWordLength) <= widget.rows) {
          bool match = true;

          for (int k = 0; k < word.length; k++) {
            if (alphabetsGrid[r + k][c] != cleanWord[k]) {
              match = false;
              break;
            }
          }
          if (match) {
            print("Found towards SOUTH starting at: ($r , $c)");
            for (int k = 0; k < searchWordLength; k++) {
              matches.add(((r + k) * widget.cols) + c);
            }
          }
        }

        // checking word from South-East (Diagonal)
        if (r + searchWordLength <= widget.rows &&
            c + searchWordLength <= widget.cols) {
          bool match = true;
          for (int k = 0; k < searchWordLength; k++) {
            if (alphabetsGrid[r + k][c + k] != cleanWord[k]) {
              match = false;
              break;
            }
          }
          if (match) {
            print("Found towards SOUTH-EAST (Diagonal) starting at: ($r , $c)");
            for (int k = 0; k < searchWordLength; k++) {
              matches.add(((r + k) * widget.cols) + (c + k));
            }
          }
        }
      }
    }
    setState(() {
      _highlightedIndices = matches;
    });

    if (matches.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Word "$cleanWord" not found in puzzle!'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;

    return PopScope(
      canPop: false, // System default back press intercept
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop)
          return;
        else {
          await Helper.showExitDialog(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Crossword Puzzle')),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: widget.cols > 10
                      ? (widget.cols * 36.w)
                      : MediaQuery.of(context).size.width - 32.w,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    //scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: widget.cols,
                      crossAxisSpacing: 3.w,
                      mainAxisSpacing: 3.h,
                      childAspectRatio: 1.0,
                    ),
                    itemCount: widget.rows * widget.cols,
                    itemBuilder: (BuildContext context, int index) {
                      // // using 1d array to fill/replace the empty string initialized 2D grid
                      // for (int i = 0; i < alphabetsList.length; i++) {
                      //   int rowNum = index ~/ widget.cols;
                      //   int colNum = index % widget.cols;
                      //   alphabetsGrid[rowNum][colNum] = alphabetsList[i];
                      // }

                      final bool isHighlighted = _highlightedIndices.contains(
                        index,
                      );

                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        decoration: BoxDecoration(
                          color: isHighlighted
                              ? AppColors.amberShade400
                              : colorScheme.primaryContainer,
                          border: Border.all(
                            color: isHighlighted
                                ? AppColors.orangeShade800
                                : colorScheme.onPrimaryContainer.withAlpha(120),
                            // Grid line color
                            width: isHighlighted ? 2.5.r : 1.5.r,
                          ),
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        alignment: Alignment.center,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            widget.alphabetString[index],
                            style: themeData.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: isHighlighted
                                  ? AppColors.black
                                  : colorScheme.onPrimaryContainer,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              SizedBox(height: 15.h),

              ValueListenableBuilder<TextEditingValue>(
                valueListenable: _wordSearchController,
                builder: (context, value, child) {
                  return CustomTextFormField(
                    controller: _wordSearchController,
                    hintText: 'Search Word in Crossword Puzzle',
                    textInputAction: TextInputAction.search,
                    onFieldSubmitted: (text) => searchWord(text),
                    suffixIcon: (value.text.trim().isNotEmpty)
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.done, size: 20.sp),
                                onPressed: () =>
                                    searchWord(_wordSearchController.text),
                              ),

                              SizedBox(width: 8.w),

                              IconButton(
                                icon: Icon(Icons.clear, size: 20.sp),
                                onPressed: () {
                                  _wordSearchController.clear();
                                  setState(() => _highlightedIndices = {});
                                },
                              ),
                            ],
                          )
                        : Icon(Icons.search, size: 20.sp),
                  );
                },
              ),

              SizedBox(height: 15.h),

              CustomElevatedButton(
                text: 'Reset',
                onPressed: () {
                  _wordSearchController.clear();
                  setState(() => _highlightedIndices = {});
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GridDimensionsScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
