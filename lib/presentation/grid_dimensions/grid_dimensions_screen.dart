import 'package:crossword_puzzle/core/const/helper/helper.dart';
import 'package:crossword_puzzle/presentation/crossword_puzzle/crossword_puzzle_screen.dart';
import 'package:crossword_puzzle/shared_custom_widgets/elevated_button/custom_elevated_button.dart';
import 'package:crossword_puzzle/shared_custom_widgets/text_form_field/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridDimensionsScreen extends StatefulWidget {
  const GridDimensionsScreen({super.key});

  @override
  State<GridDimensionsScreen> createState() => _GridDimensionsScreenState();
}

class _GridDimensionsScreenState extends State<GridDimensionsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _rowsTextEditingController;
  late final TextEditingController _colsTextEditingController;
  late final TextEditingController _crosswordAlphabetsTextEditingController;

  @override
  void initState() {
    super.initState();
    _rowsTextEditingController = TextEditingController();
    _colsTextEditingController = TextEditingController();
    _crosswordAlphabetsTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _rowsTextEditingController.dispose();
    _colsTextEditingController.dispose();
    _crosswordAlphabetsTextEditingController.dispose();
    super.dispose();
  }

  int get _requiredCharacters {
    final int rows = int.tryParse(_rowsTextEditingController.text.trim()) ?? 0;
    final int cols = int.tryParse(_colsTextEditingController.text.trim()) ?? 0;
    return rows * cols;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // System default back press ko intercept karein
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop)
          return;
        else {
          await Helper.showExitDialog(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Crossword Dimensions')),
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextFormField(
                    controller: _rowsTextEditingController,
                    labelText: 'Rows in Crossword',
                    hintText: 'Eg- 6',
                    textInputAction: TextInputAction.next,
                    prefixIcon: Icon(Icons.numbers_rounded, size: 20.r),
                    keyBoardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    validator: (String? rows) {
                      if (rows == null || rows.trim().isEmpty) {
                        return 'Enter Number of Rows in Crossword Puzzle';
                      }
                      int noOfRows =
                          int.tryParse(
                            _rowsTextEditingController.text.trim(),
                          ) ??
                          0;
                      if (noOfRows <= 0) {
                        return "Rows in crossword puzzle cannot be 0 or less.";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 18.h),

                  CustomTextFormField(
                    controller: _colsTextEditingController,
                    labelText: 'Columns in Crossword',
                    hintText: 'Eg- 3',
                    textInputAction: TextInputAction.next,
                    prefixIcon: Icon(Icons.numbers_rounded, size: 20.r),
                    keyBoardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    validator: (String? cols) {
                      if (cols == null || cols.trim().isEmpty) {
                        return 'Enter Number of Columns in Crossword Puzzle';
                      }

                      int noOfCols =
                          int.tryParse(
                            _colsTextEditingController.text.trim(),
                          ) ??
                          0;
                      if (noOfCols <= 0) {
                        return "Columns in crossword puzzle cannot be 0 or less.";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 18.h),

                  ListenableBuilder(
                    listenable: Listenable.merge([
                      _rowsTextEditingController,
                      _colsTextEditingController,
                    ]),
                    builder: (context, child) {
                      int totalAlphabetsRequired = _requiredCharacters;
                      return CustomTextFormField(
                        controller: _crosswordAlphabetsTextEditingController,
                        labelText: totalAlphabetsRequired > 0
                            ? 'Enter $totalAlphabetsRequired Alphabets in Crossword'
                            : 'Enter Alphabets in Crossword',
                        hintText: totalAlphabetsRequired > 0
                            ? 'Total $totalAlphabetsRequired characters'
                            : 'Enter letters. Eg- ABCDE',
                        textInputAction: TextInputAction.done,
                        prefixIcon: Icon(
                          Icons.sort_by_alpha_rounded,
                          size: 20.r,
                        ),
                        keyBoardType: TextInputType.text,
                        maxLength: totalAlphabetsRequired > 0
                            ? totalAlphabetsRequired
                            : null,
                        maxLines: 3,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Z]'),
                          ),
                          //FilteringTextInputFormatter.deny(RegExp(r'[^a-zA-Z]')),
                        ],
                        validator: (String? alphabetsString) {
                          if (alphabetsString == null ||
                              alphabetsString.trim().isEmpty) {
                            return 'Enter $totalAlphabetsRequired characters for puzzle.';
                          }
                          final int currentLength = alphabetsString
                              .trim()
                              .length;
                          if (totalAlphabetsRequired > 0 &&
                              currentLength != totalAlphabetsRequired) {
                            return 'Must be exactly $totalAlphabetsRequired characters long (currently $currentLength).';
                          }
                          return null;
                        },
                      );
                    },
                  ),

                  SizedBox(height: 24.h),

                  CustomElevatedButton(
                    text: 'Generate Crossword Puzzle',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CrosswordPuzzleScreen(
                              rows: int.parse(
                                _rowsTextEditingController.text.trim(),
                              ),
                              cols: int.parse(
                                _colsTextEditingController.text.trim(),
                              ),
                              alphabetString:
                                  _crosswordAlphabetsTextEditingController.text
                                      .trim()
                                      .toUpperCase(),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
