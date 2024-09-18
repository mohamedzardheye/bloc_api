import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../verify_email.dart';
import 'terms_and_conditions_checkbox.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                expands: false,
                decoration: const InputDecoration(
                    labelText: TTexts.firstName, prefix: Icon(Iconsax.user)),
              ),
            ),
            const SizedBox(
              width: TSizes.spaceBtwInputFields,
            ),
            Expanded(
              child: TextFormField(
                expands: false,
                decoration: const InputDecoration(
                    labelText: TTexts.lastName, prefix: Icon(Iconsax.user)),
              ),
            ),
          ],
        ),

        const SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),

        // Username
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
              labelText: TTexts.username, prefix: Icon(Iconsax.user_edit)),
        ),

        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        // Email
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
              labelText: TTexts.email,
              suffixIcon: Icon(Iconsax.direct),
              prefix: Icon(Iconsax.direct)),
        ),

        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        // Phone Number
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
              labelText: TTexts.phoneNo, prefix: Icon(Iconsax.call)),
        ),

        const SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),

        // Password
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
              label: Text(TTexts.password),
              prefix: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash)),
        ),

        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        // Terms&Conditions Checkbox
        const TermsAndConditionsCheckbox(),
        const SizedBox(height: TSizes.spaceBtwItems),

        //Sign up Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Get.to(() => const VerifyEmailScreen());
            },
            child: const Text(TTexts.createAccount),
          ),
        ),
      ]),
    );
  }
}
