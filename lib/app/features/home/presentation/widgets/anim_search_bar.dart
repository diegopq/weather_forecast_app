part of 'widgets.dart';

class AnimSearchBar extends StatefulWidget {
  const AnimSearchBar({super.key});

  @override
  _AnimSearchBarState createState() => _AnimSearchBarState();
}

class _AnimSearchBarState extends State<AnimSearchBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animController;
  late final _textController = TextEditingController();
  final focusNode = FocusNode();

  bool toggle = false;
  final autoFocus = true;
  final animationDurationInMilli = 250;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _textController.addListener(() => _listenTextChanges(context));
    });
    _animController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: animationDurationInMilli,
      ),
    );
  }

  @override
  void dispose() {
    _animController.dispose();
    focusNode.dispose();
    _textController
      ..removeListener(() => _listenTextChanges(context))
      ..dispose();
    super.dispose();
  }

  void unfocusKeyboard() {
    final currentScope = FocusScope.of(context);
    if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  void _listenTextChanges(BuildContext context) {
    if (_textController.text.isNotEmpty) {
      context.read<HomeBloc>().add(SearchLocation(_textController.text.trim()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocListener<SearchBarCubit, bool>(
      listener: (_, state) {
        if (!state) {
          unfocusKeyboard();
          _textController.clear();
          _animController.reverse();
          setState(() {
            toggle = false;
          });
        }
      },
      child: Container(
        height: 58.h,
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        child: AnimatedContainer(
          duration: Duration(milliseconds: animationDurationInMilli),
          height: 48.0.h,
          width: !toggle ? 48.0.h : 1.0.sw,
          curve: Curves.easeOut,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.r),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                spreadRadius: -10,
                blurRadius: 10,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: Duration(milliseconds: animationDurationInMilli),
                top: 6.0.h,
                right: 7.0.w,
                curve: Curves.easeOut,
                child: AnimatedOpacity(
                  opacity: !toggle ? 0.0 : 1.0,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    padding: EdgeInsets.all(8.0.r),
                    decoration: BoxDecoration(
                      /// can add custom color or the color will be white
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: AnimatedBuilder(
                      builder: (context, widget) {
                        return Transform.rotate(
                          angle: _animController.value * 2.0 * math.pi,
                          child: widget,
                        );
                      },
                      animation: _animController,
                      child: GestureDetector(
                        onTap: () {
                          if (_textController.text.isEmpty) {
                            unfocusKeyboard();
                            setState(() {
                              toggle = false;
                            });
                            _animController.reverse();
                          }
                          _textController.clear();
                        },
                        child: Icon(
                          Icons.close,
                          size: 20.0.spMin,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: animationDurationInMilli),
                left: !toggle ? 20.0 : 40.0,
                curve: Curves.easeOut,
                top: 11.0.h,
                child: AnimatedOpacity(
                  opacity: !toggle ? 0.0 : 1.0,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    alignment: Alignment.topCenter,
                    width: 1.0.sw / 1.7,
                    child: TextField(
                      controller: _textController,
                      focusNode: focusNode,
                      cursorRadius: Radius.circular(10.0.r),
                      cursorWidth: 2.0.w,
                      // onChanged: (value) {
                      //   // textFieldValue = value;
                      // },
                      onSubmitted: (value) {
                        // widget.onSubmitted(value),
                        // print('submitted');
                        // unfocusKeyboard();
                        // setState(() {
                        //   toggle = false;
                        // });
                        // _textController.clear();
                      },
                      onEditingComplete: () {
                        // print('complete');
                        // unfocusKeyboard();
                        // setState(() {
                        //   toggle = false;
                        // });
                      },
                      style: theme.textTheme.bodyLarge!.copyWith(
                        color: Colors.black,
                      ),
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(bottom: 5),
                        isDense: true,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: '',
                        labelStyle: theme.textTheme.titleLarge!.copyWith(
                          color: const Color(0xff5B5B5B),
                        ),
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                splashRadius: 19.r,
                icon: Icon(
                  toggle ? Icons.arrow_back_ios : Icons.search,
                  // search icon color when closed
                  color: Colors.black,
                  size: 20.0.spMin,
                ),
                onPressed: () {
                  setState(
                    () {
                      if (!toggle) {
                        toggle = true;
                        setState(() {
                          if (autoFocus) {
                            FocusScope.of(context).requestFocus(focusNode);
                          }
                        });
                        _animController.forward();
                        context.read<SearchBarCubit>().focus();
                      } else {
                        toggle = false;
                        setState(() {
                          if (autoFocus) unfocusKeyboard();
                        });
                        _animController.reverse();
                      }
                    },
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
