import 'package:flutter/material.dart';



class CalculaterScreen extends StatefulWidget {

  const CalculaterScreen({super.key});



  @override

  State<CalculaterScreen> createState() => _CalculaterScreenState();

}



class _CalculaterScreenState extends State<CalculaterScreen> {

String _display = '0';

  double? _firstOperand;

  String? _operator;

  bool _shouldResetDisplay = false;
  final List<String> _history = [];



  // Handle number input

  void _onDigitPress(String digit) {

    setState(() {

      if (_display == '0' || _shouldResetDisplay) {

        _display = digit;

        _shouldResetDisplay = false;

      } else {

        if (_display.length < 10) {

          _display += digit;

        }

      }

    });

  }



  // Handle decimal dot

  void _onDecimalPress() {

    setState(() {

      if (_shouldResetDisplay) {

        _display = '0.';

        _shouldResetDisplay = false;

        return;

      }

      if (!_display.contains('.')) {

        _display += '.';

      }

    });

  }



  // Handle operation (+, -, ×, ÷)

  void _onOperatorPress(String op) {

    final currentValue = double.tryParse(_display) ?? 0;

    setState(() {

      if (_firstOperand == null) {

        _firstOperand = currentValue;

      } else if (_operator != null && !_shouldResetDisplay) {

        _firstOperand = _calculate(_firstOperand!, currentValue, _operator!);

        _display = _formatResult(_firstOperand!);

      }

      _operator = op;

      _shouldResetDisplay = true;

    });

  }



  // Handle equals (=)
  void _onEqualsPress() {
    if (_firstOperand == null || _operator == null) return;

    final secondOperand = double.tryParse(_display) ?? 0;
    final firstOperand = _firstOperand!;
    final operator = _operator!;

    setState(() {
      final result = _calculate(firstOperand, secondOperand, operator);
      final expression =
          '${_formatResult(firstOperand)} $operator ${_formatResult(secondOperand)} = ${_formatResult(result)}';

      _history.insert(0, expression);
      _display = _formatResult(result);
      _firstOperand = null;
      _operator = null;
      _shouldResetDisplay = true;
    });
  }

  // Show calculation history
  void _showHistory() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Calculation History'),
          content: SizedBox(
            width: double.maxFinite,
            child: _history.isEmpty
                ? const Padding(
                    padding: EdgeInsets.all(20),
                    child: Center(child: Text('No history available')),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: _history.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const Icon(Icons.calculate),
                        title: Text(_history[index]),
                      );
                    },
                  ),
          ),
          actions: [
            if (_history.isNotEmpty)
              TextButton(
                onPressed: () {
                  setState(() {
                    _history.clear();
                  });
                  Navigator.pop(context);
                },
                child: const Text('Clear History'),
              ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  // Handle percentage (%)

  void _onPercentPress() {

    final currentValue = double.tryParse(_display) ?? 0;

    setState(() {

      _display = _formatResult(currentValue / 100);

      _shouldResetDisplay = true;

    });

  }



  // Handle All Clear (AC)

  void _onClearPress() {

    setState(() {

      _display = '0';

      _firstOperand = null;

      _operator = null;

      _shouldResetDisplay = false;

    });

  }



  // Handle Backspace (⌫)

  void _onBackspacePress() {

    setState(() {

      if (_shouldResetDisplay) return;

      if (_display.length > 1) {

        _display = _display.substring(0, _display.length - 1);

      } else {

        _display = '0';

      }

    });

  }



  double _calculate(double a, double b, String op) {

    switch (op) {

      case '+':

        return a + b;

      case '-':

        return a - b;

      case '×':

        return a * b;

      case '÷':

        return b == 0 ? 0 : a / b;

      default:

        return b;

    }

  }



  String _formatResult(double val) {

    if (val.isInfinite || val.isNaN) return 'Error';

    // Remove unnecessary trailing zeroes or decimals

    if (val == val.roundToDouble()) {

      return val.toInt().toString();

    }

    String str = val.toStringAsFixed(6);

    str = str.replaceAll(RegExp(r'0+$'), '');

    str = str.replaceAll(RegExp(r'\.$'), '');

    return str;

  }



  @override

  Widget build(BuildContext context) {

    const bgColor = Color(0xFF212121);

    const lightGray = Color(0xFFA5A5A5);

    const darkGray = Color(0xFF333333);

    const orangeColor = Color(0xFFFF9500);



    return Scaffold(

      backgroundColor: bgColor,

      body: SafeArea(

        child: Padding(

          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),

          child: Column(

            children: [

              // Top Bar with back button and history icon

              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [

                  IconButton(

                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),

                    onPressed: () => Navigator.of(context).maybePop(),

                  ),

                  IconButton(

                    icon: const Icon(Icons.history, color: Colors.white, size: 24),
                    tooltip: 'History',
                    onPressed: _showHistory,

                  ),

                ],

              ),



              // Display Area

              Expanded(

                child: Container(

                  alignment: Alignment.bottomRight,

                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 24.0),

                  child: FittedBox(

                    fit: BoxFit.scaleDown,

                    alignment: Alignment.centerRight,

                    child: Text(

                      _display,

                      style: const TextStyle(

                        color: Colors.white,

                        fontSize: 72,

                        fontWeight: FontWeight.w300,

                      ),

                      maxLines: 1,

                    ),

                  ),

                ),

              ),



              // Keypad Rows

              _buildRow([

                _ButtonConfig(text: 'AC', bgColor: lightGray, textColor: Colors.black, onTap: _onClearPress),

                _ButtonConfig(text: '%', bgColor: lightGray, textColor: Colors.black, onTap: _onPercentPress),

                _ButtonConfig(icon: Icons.backspace_outlined, bgColor: lightGray, textColor: Colors.black, onTap: _onBackspacePress),

                _ButtonConfig(text: '÷', bgColor: orangeColor, textColor: Colors.white, onTap: () => _onOperatorPress('÷')),

              ]),

              const SizedBox(height: 14),



              _buildRow([

                _ButtonConfig(text: '7', bgColor: darkGray, textColor: Colors.white, onTap: () => _onDigitPress('7')),

                _ButtonConfig(text: '8', bgColor: darkGray, textColor: Colors.white, onTap: () => _onDigitPress('8')),

                _ButtonConfig(text: '9', bgColor: darkGray, textColor: Colors.white, onTap: () => _onDigitPress('9')),

                _ButtonConfig(text: '×', bgColor: orangeColor, textColor: Colors.white, onTap: () => _onOperatorPress('×')),

              ]),

              const SizedBox(height: 14),



              _buildRow([

                _ButtonConfig(text: '4', bgColor: darkGray, textColor: Colors.white, onTap: () => _onDigitPress('4')),

                _ButtonConfig(text: '5', bgColor: darkGray, textColor: Colors.white, onTap: () => _onDigitPress('5')),

                _ButtonConfig(text: '6', bgColor: darkGray, textColor: Colors.white, onTap: () => _onDigitPress('6')),

                _ButtonConfig(text: '-', bgColor: orangeColor, textColor: Colors.white, onTap: () => _onOperatorPress('-')),

              ]),

              const SizedBox(height: 14),



              _buildRow([

                _ButtonConfig(text: '1', bgColor: darkGray, textColor: Colors.white, onTap: () => _onDigitPress('1')),

                _ButtonConfig(text: '2', bgColor: darkGray, textColor: Colors.white, onTap: () => _onDigitPress('2')),

                _ButtonConfig(text: '3', bgColor: darkGray, textColor: Colors.white, onTap: () => _onDigitPress('3')),

                _ButtonConfig(text: '+', bgColor: orangeColor, textColor: Colors.white, onTap: () => _onOperatorPress('+')),

              ]),

              const SizedBox(height: 14),



              // Bottom Row with extended "0" button

              Row(

                children: [

                  Expanded(

                    flex: 2,

                    child: Padding(

                      padding: const EdgeInsets.symmetric(horizontal: 6.0),

                      child: SizedBox(

                        height: 72,

                        child: Material(

                          color: darkGray,

                          borderRadius: BorderRadius.circular(36),

                          child: InkWell(

                            borderRadius: BorderRadius.circular(36),

                            onTap: () => _onDigitPress('0'),

                            child: const Padding(

                              padding: EdgeInsets.only(left: 28.0),

                              child: Align(

                                alignment: Alignment.centerLeft,

                                child: Text(

                                  '0',

                                  style: TextStyle(

                                    color: Colors.white,

                                    fontSize: 32,

                                    fontWeight: FontWeight.w400,

                                  ),

                                ),

                              ),

                            ),

                          ),

                        ),

                      ),

                    ),

                  ),

                  Expanded(

                    child: Padding(

                      padding: const EdgeInsets.symmetric(horizontal: 6.0),

                      child: _buildCircleButton(

                        _ButtonConfig(text: '.', bgColor: darkGray, textColor: Colors.white, onTap: _onDecimalPress),

                      ),

                    ),

                  ),

                  Expanded(

                    child: Padding(

                      padding: const EdgeInsets.symmetric(horizontal: 6.0),

                      child: _buildCircleButton(

                        _ButtonConfig(text: '=', bgColor: orangeColor, textColor: Colors.white, onTap: _onEqualsPress),

                      ),

                    ),

                  ),

                ],

              ),

              const SizedBox(height: 16),

            ],

          ),

        ),

      ),

    );

  }



  Widget _buildRow(List<_ButtonConfig> buttons) {

    return Row(

      children: buttons

          .map(

            (b) => Expanded(

              child: Padding(

                padding: const EdgeInsets.symmetric(horizontal: 6.0),

                child: _buildCircleButton(b),

              ),

            ),

          )

          .toList(),

    );

  }



  Widget _buildCircleButton(_ButtonConfig config) {

    return AspectRatio(

      aspectRatio: 1.0,

      child: Material(

        color: config.bgColor,

        shape: const CircleBorder(),

        child: InkWell(

          customBorder: const CircleBorder(),

          onTap: config.onTap,

          child: Center(

            child: config.icon != null

                ? Icon(config.icon, color: config.textColor, size: 28)

                : Text(

                    config.text ?? '',

                    style: TextStyle(

                      color: config.textColor,

                      fontSize: 30,

                      fontWeight: FontWeight.w400,

                    ),

                  ),

          ),

        ),

      ),

    );

  }

}



class _ButtonConfig {

  final String? text;

  final IconData? icon;

  final Color bgColor;

  final Color textColor;

  final VoidCallback onTap;



  _ButtonConfig({

    this.text,

    this.icon,

    required this.bgColor,

    required this.textColor,

    required this.onTap,

  });

}