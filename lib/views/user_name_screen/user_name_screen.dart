import 'package:flutter/material.dart';
import 'package:tic_tac_toe_p2p/core/local_db/local_db.dart';
import 'package:tic_tac_toe_p2p/core/widgets/background_widget.dart';
import 'package:tic_tac_toe_p2p/core/widgets/custom_button.dart';
import 'package:tic_tac_toe_p2p/core/widgets/custom_chip.dart';
import 'package:tic_tac_toe_p2p/core/widgets/custom_textfield.dart';
import 'package:tic_tac_toe_p2p/views/home_screen/home_screen.dart';

class UserNameScreen extends StatefulWidget {
  const UserNameScreen({super.key});

  @override
  State<UserNameScreen> createState() => _UserNameScreenState();
}

class _UserNameScreenState extends State<UserNameScreen> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: BackgroundWidget(
        child: Column(
          children: [
            const CustomChip(title: "Enter Player Name"),
            Expanded(
              flex: 2,
              child: Center(
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Player Name",
                          style: textTheme.headlineSmall?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          placeholder: "Enter you name.",
                          controller: nameController,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: CustomButton(
                  onTap: () async {
                    if (nameController.text.trim().isNotEmpty) {
                      await LocalDB.setUserName(nameController.text).then((_) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                        );
                      });
                    }
                  },
                  title: 'Continue',
                  startColor: const Color(0xffb85fff),
                  endColor: const Color(0xffab50f4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
