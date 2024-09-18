import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:light_modal_bottom_sheet/light_modal_bottom_sheet.dart';

import '../../../../common/widgets/bottom_modal.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../posts/ui/posts_page.dart';
import '../../signup/signup.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email), labelText: TTexts.email),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline_rounded),
                  suffix: Icon(Iconsax.eye_slash),
                  labelText: TTexts.password),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),

            // Remember and Forget Password

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Remember me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(TTexts.rememberMe),
                  ],
                ),

                // Forget Password
                TextButton(
                    onPressed: () {}, child: const Text(TTexts.forgetPassword)),
              ],
            ),

            const SizedBox(height: TSizes.spaceBtwSections),

            // Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    const snackBar = SnackBar(
                      /// need to set following properties for best effect of awesome_snackbar_content
                      elevation: 0,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      content: AwesomeSnackbarContent(
                        title: 'Congtrz!',
                        message:
                            'This is an example error message that will be shown in the body of snackbar!',

                        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                        contentType: ContentType.success,
                      ),
                    );

                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(snackBar);

                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => const PostsPage()));
                    Get.to(() => const SignupScreen());

                    showMaterialModalBottomSheet(
                        expand: false,
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) => const ModalFit());
                  },
                  child: const Text(TTexts.signIn)),
            ),

            const SizedBox(height: TSizes.spaceBtwInputFields),

            // create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () {}, child: const Text(TTexts.createAccount)),
            ),
          ],
        ),
      ),
    );
  }
}
