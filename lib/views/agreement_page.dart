
import 'package:astrologer_app/views/language_screen.dart';
import 'package:astrologer_app/views/util/colors.dart';
import 'package:flutter/material.dart';

class DisclaimerAgreementScreen extends StatefulWidget {
  const DisclaimerAgreementScreen({super.key});

  @override
  State<DisclaimerAgreementScreen> createState() =>
      _DisclaimerAgreementScreenState();
}

class _DisclaimerAgreementScreenState
    extends State<DisclaimerAgreementScreen> {
  bool isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.lightGrey,
      
        /// APP BAR
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.black,
          title: const Text(
            "Disclaimer Agreement",
            style: TextStyle(color: AppColors.white),
          ),
          centerTitle: true,
        ),
      
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              /// Title
              const Text(
                "Important Legal Disclaimer",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.red,
                ),
              ),
              const SizedBox(height: 12),
      
              /// Disclaimer Text Box
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: const Text(
                      '''
    • Astrology services are provided for guidance and informational purposes only.
    
    • Results and predictions may vary from person to person and are not guaranteed.
    
    • The service does not claim to cure medical, legal, financial, or psychological conditions.
    
    • The client is solely responsible for decisions taken based on the consultation.
    
    • This platform is not liable for any loss, harm, or damages arising from the use of the service.
    
    • By proceeding, you confirm that you are 18 years or above.
    
    • Misuse, recording, or redistribution of consultation content is strictly prohibited.
    
    • Any attempt to misuse the service for illegal or criminal purposes will be reported to authorities.
    
    By clicking "Agree", you acknowledge that you have read, understood, and accepted all the above terms.
                    ''',
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.6,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ),
              ),
      
              const SizedBox(height: 16),
      
              /// Checkbox
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: isAgreed,
                    activeColor: AppColors.red,
                    onChanged: (value) {
                      setState(() {
                        isAgreed = value ?? false;
                      });
                    },
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Text(
                        "I have read and agree to the Disclaimer and Terms of Service",
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      
              const SizedBox(height: 12),
      
              /// Agree Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: isAgreed
                      ? () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const LanguageSelectionScreen(),
                            ),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.red,
                    disabledBackgroundColor: Colors.grey.shade400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    "Agree & Continue",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
      
              const SizedBox(height: 8),
      
              /// Mandatory Note
              const Text(
                "This agreement is mandatory to use the app",
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.orange,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
