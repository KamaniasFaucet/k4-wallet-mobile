// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a tr locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final MessageLookup messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'tr';

  static dynamic m0(dynamic name) => "${name} başarıyla etkinleştirildi!";

  static dynamic m1(dynamic index) => "${index}. kelimeyi girin.";

  static dynamic m2(dynamic index) =>
      "Gizli kelimelerinizin ${index}. kelimesi nedir?";

  static dynamic m3(dynamic coinName) =>
      "Uygun bir ${coinName} emri bulunmuyor - bir emir girmeyi deneyin veya daha sonra yeniden kontrol edin.";

  static dynamic m4(dynamic assets) => "${assets} Varlıklar";

  static dynamic m5(dynamic amount) =>
      "${amount} adet emri görmek için tıklayın";

  static dynamic m6(dynamic coinName, dynamic address) =>
      "${coinName} adresim: \n${address}";

  static dynamic m7(dynamic amount, dynamic coinName) =>
      "${amount} adet ${coinName} ÇEK";

  static dynamic m8(dynamic amount, dynamic coin) =>
      "${amount} adet ${coin} alacaksınız";

  final Map<String, dynamic> messages =
      _notInlinedMessages(_notInlinedMessages);
  static dynamic _notInlinedMessages(dynamic _) => <String, Function>{
        "accepteula": MessageLookupByLibrary.simpleMessage("EULA\'yı Kabul Et"),
        "accepttac": MessageLookupByLibrary.simpleMessage(
            "ŞARTLARI ve KOŞULLARI Kabul Et"),
        "activateAccessBiometric": MessageLookupByLibrary.simpleMessage(
            "Biyometrik korumayı etkinleştir"),
        "activateAccessPin":
            MessageLookupByLibrary.simpleMessage("PIN korumasını etkinleştir"),
        "addCoin":
            MessageLookupByLibrary.simpleMessage("Kriptopara etkinleştir"),
        "addingCoinSuccess": m0,
        "addressSend": MessageLookupByLibrary.simpleMessage("Alıcı adres"),
        "allowCustomSeed":
            MessageLookupByLibrary.simpleMessage("Kişisel kelimeleri kullan"),
        "amount": MessageLookupByLibrary.simpleMessage("Tutar"),
        "amountToSell": MessageLookupByLibrary.simpleMessage("Satılacak Tutar"),
        "appName": MessageLookupByLibrary.simpleMessage("atomicDeFi"),
        "areYouSure": MessageLookupByLibrary.simpleMessage("EMİN MİSİNİZ?"),
        "articleFrom":
            MessageLookupByLibrary.simpleMessage("atomicDeFi HABERLERİ"),
        "availableVolume": MessageLookupByLibrary.simpleMessage("maks hacim"),
        "back": MessageLookupByLibrary.simpleMessage("geri"),
        "backupTitle": MessageLookupByLibrary.simpleMessage("Yedekle"),
        "bestAvailableRate":
            MessageLookupByLibrary.simpleMessage("Mevcut en iyi fiyat"),
        "buy": MessageLookupByLibrary.simpleMessage("Al"),
        "buySuccessWaiting": MessageLookupByLibrary.simpleMessage(
            "Takas işlendi, lütfen bekleyin!"),
        "cancel": MessageLookupByLibrary.simpleMessage("iptal"),
        "changePin":
            MessageLookupByLibrary.simpleMessage("PIN kodunu değiştir"),
        "checkOut": MessageLookupByLibrary.simpleMessage("Ödeme"),
        "checkSeedPhrase": MessageLookupByLibrary.simpleMessage(
            "Gizli kelimeleri kontrol edin"),
        "checkSeedPhraseButton1": MessageLookupByLibrary.simpleMessage("DEVAM"),
        "checkSeedPhraseButton2":
            MessageLookupByLibrary.simpleMessage("GERİ DÖN VE KONTROL ET"),
        "checkSeedPhraseHint": m1,
        "checkSeedPhraseInfo": MessageLookupByLibrary.simpleMessage(
            "Gizli kelimeleriniz önemlidir - bu yüzden doğruluğundan emin olmak istiyoruz. Cüzdanınızı istediğiniz zaman kolayca geri yükleyebileceğinizden emin olmak için, gizli kelimeleriniz hakkında üç farklı soru soracağız."),
        "checkSeedPhraseSubtile": m2,
        "checkSeedPhraseTitle": MessageLookupByLibrary.simpleMessage(
            "GİZLİ KELİMELERİNİZİ DAHA DİKKATLİ KONTROL EDİN"),
        "claim": MessageLookupByLibrary.simpleMessage("talep"),
        "claimTitle":
            MessageLookupByLibrary.simpleMessage("KMD ödülünüzü alın"),
        "clickToSee":
            MessageLookupByLibrary.simpleMessage("Görmek için tıklayın "),
        "clipboard": MessageLookupByLibrary.simpleMessage("Panoya kopyalandı"),
        "clipboardCopy": MessageLookupByLibrary.simpleMessage("Panoya kopyala"),
        "close": MessageLookupByLibrary.simpleMessage("Kapat"),
        "code": MessageLookupByLibrary.simpleMessage("Kod: "),
        "comingSoon": MessageLookupByLibrary.simpleMessage("Yakında..."),
        "commingsoon":
            MessageLookupByLibrary.simpleMessage("TX detayları yakında!"),
        "commingsoonGeneral":
            MessageLookupByLibrary.simpleMessage("Detaylar yakında!"),
        "commissionFee":
            MessageLookupByLibrary.simpleMessage("komisyon ücreti"),
        "confirm": MessageLookupByLibrary.simpleMessage("onayla"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Parolayı onayla"),
        "confirmPin":
            MessageLookupByLibrary.simpleMessage("PIN kodunuzu onaylayın"),
        "confirmSeed":
            MessageLookupByLibrary.simpleMessage("Gizli Kelimeleri Onayla"),
        "confirmeula": MessageLookupByLibrary.simpleMessage(
            "Aşağıdaki düğmeye tıklayarak \'EULA\' ve \'Kullanım Şartları\'nı okumuş ve kabul etmiş sayılırsınız."),
        "connecting": MessageLookupByLibrary.simpleMessage("Bağlanıyor..."),
        "createAWallet": MessageLookupByLibrary.simpleMessage("CÜZDAN OLUŞTUR"),
        "createPin": MessageLookupByLibrary.simpleMessage("PIN Kodu Oluştur"),
        "decryptingWallet":
            MessageLookupByLibrary.simpleMessage("Cüzdan deşifre ediliyor"),
        "delete": MessageLookupByLibrary.simpleMessage("Sil"),
        "deleteWallet": MessageLookupByLibrary.simpleMessage("Cüzdanı Sil"),
        "dex": MessageLookupByLibrary.simpleMessage("DEX"),
        "disclaimerAndTos": MessageLookupByLibrary.simpleMessage(
            "Yasal Uyarı ve Kullanım Şartları"),
        "done": MessageLookupByLibrary.simpleMessage("Bitti"),
        "dontWantPassword":
            MessageLookupByLibrary.simpleMessage("Parola istemiyorum"),
        "encryptingWallet":
            MessageLookupByLibrary.simpleMessage("Cüzdan şifreleniyor"),
        "enterPinCode":
            MessageLookupByLibrary.simpleMessage("PIN Kodunuzu Girin"),
        "enterSeedPhrase":
            MessageLookupByLibrary.simpleMessage("Gizli Kelimelerinizi Girin"),
        "enterpassword": MessageLookupByLibrary.simpleMessage(
            "Lütfen devam etmek için parolanızı girin."),
        "errorAmountBalance":
            MessageLookupByLibrary.simpleMessage("Yeterli bakiye yok"),
        "errorNotAValidAddress":
            MessageLookupByLibrary.simpleMessage("Geçerli bir adres değil"),
        "errorTryAgain":
            MessageLookupByLibrary.simpleMessage("Hata, lütfen tekrar deneyin"),
        "errorTryLater": MessageLookupByLibrary.simpleMessage(
            "Hata, lütfen daha sonra deneyin"),
        "errorValueEmpty": MessageLookupByLibrary.simpleMessage(
            "Değer çok yüksek ya da düşük"),
        "errorValueNotEmpty":
            MessageLookupByLibrary.simpleMessage("Lütfen veri girin"),
        "estimateValue":
            MessageLookupByLibrary.simpleMessage("Tahmini Toplam Değer"),
        "ethFee": MessageLookupByLibrary.simpleMessage("ETH ücreti"),
        "ethNotActive": MessageLookupByLibrary.simpleMessage(
            "Lütfen ETH\'yi etkinleştirin"),
        "eulaParagraphe1": MessageLookupByLibrary.simpleMessage(
            "This End-User License Agreement (\'EULA\') is a legal agreement between you and Komodo Platform.\n\nThis EULA agreement governs your acquisition and use of our atomicDeFi mobile software (\'Software\', \'Mobile Application\', \'Application\' or \'App\') directly from Komodo Platform or indirectly through a Komodo Platform authorized entity, reseller or distributor (a \'Distributor\').\nPlease read this EULA agreement carefully before completing the installation process and using the atomicDeFi mobile software. It provides a license to use the atomicDeFi mobile software and contains warranty information and liability disclaimers.\nIf you register for the beta program of the atomicDeFi mobile software, this EULA agreement will also govern that trial. By clicking \'accept\' or installing and/or using the atomicDeFi mobile software, you are confirming your acceptance of the Software and agreeing to become bound by the terms of this EULA agreement.\nIf you are entering into this EULA agreement on behalf of a company or other legal entity, you represent that you have the authority to bind such entity and its affiliates to these terms and conditions. If you do not have such authority or if you do not agree with the terms and conditions of this EULA agreement, do not install or use the Software, and you must not accept this EULA agreement.\nThis EULA agreement shall apply only to the Software supplied by Komodo Platform herewith regardless of whether other software is referred to or described herein. The terms also apply to any Komodo Platform updates, supplements, Internet-based services, and support services for the Software, unless other terms accompany those items on delivery. If so, those terms apply.\nLicense Grant\nKomodo Platform hereby grants you a personal, non-transferable, non-exclusive licence to use the atomicDeFi mobile software on your devices in accordance with the terms of this EULA agreement.\n\nYou are permitted to load the atomicDeFi mobile software (for example a PC, laptop, mobile or tablet) under your control. You are responsible for ensuring your device meets the minimum security and resource requirements of the atomicDeFi mobile software.\nYou are not permitted to:\nEdit, alter, modify, adapt, translate or otherwise change the whole or any part of the Software nor permit the whole or any part of the Software to be combined with or become incorporated in any other software, nor decompile, disassemble or reverse engineer the Software or attempt to do any such things\nReproduce, copy, distribute, resell or otherwise use the Software for any commercial purpose\nUse the Software in any way which breaches any applicable local, national or international law\nuse the Software for any purpose that Komodo Platform considers is a breach of this EULA agreement\nIntellectual Property and Ownership\nKomodo Platform shall at all times retain ownership of the Software as originally downloaded by you and all subsequent downloads of the Software by you. The Software (and the copyright, and other intellectual property rights of whatever nature in the Software, including any modifications made thereto) are and shall remain the property of Komodo Platform.\n\nKomodo Platform reserves the right to grant licences to use the Software to third parties.\nTermination\nThis EULA agreement is effective from the date you first use the Software and shall continue until terminated. You may terminate it at any time upon written notice to Komodo Platform.\nIt will also terminate immediately if you fail to comply with any term of this EULA agreement. Upon such termination, the licenses granted by this EULA agreement will immediately terminate and you agree to stop all access and use of the Software. The provisions that by their nature continue and survive will survive any termination of this EULA agreement.\nGoverning Law\nThis EULA agreement, and any dispute arising out of or in connection with this EULA agreement, shall be governed by and construed in accordance with the laws of Vietnam.\n\nThis document was last updated on January 31st, 2020\n\n"),
        "eulaParagraphe10": MessageLookupByLibrary.simpleMessage(
            "Komodo Platform is the owner and/or authorised user of all trademarks, service marks, design marks, patents, copyrights, database rights and all other intellectual property appearing on or contained within the application, unless otherwise indicated. All information, text, material, graphics, software and advertisements on the application interface are copyright of Komodo Platform, its suppliers and licensors, unless otherwise expressly indicated by Komodo Platform. \nExcept as provided in the Terms, use of the application does not grant You any right, title, interest or license to any such intellectual property You may have access to on the application. \nWe own the rights, or have permission to use, the trademarks listed in our application. You are not authorised to use any of those trademarks without our written authorization – doing so would constitute a breach of our or another party’s intellectual property rights. \nAlternatively, we might authorise You to use the content in our application if You previously contact us and we agree in writing.\n\n"),
        "eulaParagraphe11": MessageLookupByLibrary.simpleMessage(
            "Komodo Platform cannot guarantee the safety or security of your computer systems. We do not accept liability for any loss or corruption of electronically stored data or any damage to any computer system occurred in connection with the use of the application or of the user content.\nKomodo Platform makes no representation or warranty of any kind, express or implied, as to the operation of the application or the user content. You expressly agree that your use of the application is entirely at your sole risk.\nYou agree that the content provided in the application and the user content do not constitute financial product, legal or taxation advice, and You agree on not representing the user content or the application as such.\nTo the extent permitted by current legislation, the application is provided on an “as is, as available” basis.\n\nKomodo Platform expressly disclaims all responsibility for any loss, injury, claim, liability, or damage, or any indirect, incidental, special or consequential damages or loss of profits whatsoever resulting from, arising out of or in any way related to: \n(a) any errors in or omissions of the application and/or the user content, including but not limited to technical inaccuracies and typographical errors; \n(b) any third party website, application or content directly or indirectly accessed through links in the application, including but not limited to any errors or omissions; \n(c) the unavailability of the application or any portion of it; \n(d) your use of the application;\n(e) your use of any equipment or software in connection with the application. \nAny Services offered in connection with the Platform are provided on an \'as is\' basis, without any representation or warranty, whether express, implied or statutory. To the maximum extent permitted by applicable law, we specifically disclaim any implied warranties of title, merchantability, suitability for a particular purpose and/or non-infringement. We do not make any representations or warranties that use of the Platform will be continuous, uninterrupted, timely, or error-free.\nWe make no warranty that any Platform will be free from viruses, malware, or other related harmful material and that your ability to access any Platform will be uninterrupted. Any defects or malfunction in the product should be directed to the third party offering the Platform, not to Komodo. \nWe will not be responsible or liable to You for any loss of any kind, from action taken, or taken in reliance on the material or information contained in or through the Platform.\nThis is experimental and unfinished software. Use at your own risk. No warranty for any kind of damage. By using this application you agree to this terms and conditions.\n\n"),
        "eulaParagraphe12": MessageLookupByLibrary.simpleMessage(
            "When accessing or using the Services, You agree that You are solely responsible for your conduct while accessing and using our Services. Without limiting the generality of the foregoing, You agree that You will not:\n(a) Use the Services in any manner that could interfere with, disrupt, negatively affect or inhibit other users from fully enjoying the Services, or that could damage, disable, overburden or impair the functioning of our Services in any manner;\n(b) Use the Services to pay for, support or otherwise engage in any illegal activities, including, but not limited to illegal gambling, fraud, money laundering, or terrorist activities;\n(c) Use any robot, spider, crawler, scraper or other automated means or interface not provided by us to access our Services or to extract data;\n(d) Use or attempt to use another user’s Wallet or credentials without authorization;\n(e) Attempt to circumvent any content filtering techniques we employ, or attempt to access any service or area of our Services that You are not authorized to access;\n(f) Introduce to the Services any virus, Trojan, worms, logic bombs or other harmful material;\n(g) Develop any third-party applications that interact with our Services without our prior written consent;\n(h) Provide false, inaccurate, or misleading information; \n(i) Encourage or induce any other person to engage in any of the activities prohibited under this Section.\n\n\n"),
        "eulaParagraphe13": MessageLookupByLibrary.simpleMessage(
            "You agree and understand that there are risks associated with utilizing Services involving Virtual Currencies including, but not limited to, the risk of failure of hardware, software and internet connections, the risk of malicious software introduction, and the risk that third parties may obtain unauthorized access to information stored within your Wallet, including but not limited to your public and private keys. You agree and understand that Komodo Platform will not be responsible for any communication failures, disruptions, errors, distortions or delays You may experience when using the Services, however caused.\nYou accept and acknowledge that there are risks associated with utilizing any virtual currency network, including, but not limited to, the risk of unknown vulnerabilities in or unanticipated changes to the network protocol. You acknowledge and accept that Komodo Platform has no control over any cryptocurrency network and will not be responsible for any harm occurring as a result of such risks, including, but not limited to, the inability to reverse a transaction, and any losses in connection therewith due to erroneous or fraudulent actions.\nThe risk of loss in using Services involving Virtual Currencies may be substantial and losses may occur over a short period of time. In addition, price and liquidity are subject to significant fluctuations that may be unpredictable.\nVirtual Currencies are not legal tender and are not backed by any sovereign government. In addition, the legislative and regulatory landscape around Virtual Currencies is constantly changing and may affect your ability to use, transfer, or exchange Virtual Currencies.\nCFDs are complex instruments and come with a high risk of losing money rapidly due to leverage. 80.6% of retail investor accounts lose money when trading CFDs with this provider. You should consider whether You understand how CFDs work and whether You can afford to take the high risk of losing your money.\n\n"),
        "eulaParagraphe14": MessageLookupByLibrary.simpleMessage(
            "You agree to indemnify, defend and hold harmless Komodo Platform, its officers, directors, employees, agents, licensors, suppliers and any third party information providers to the application from and against all losses, expenses, damages and costs, including reasonable lawyer fees, resulting from any violation of the Terms by You.\nYou also agree to indemnify Komodo Platform against any claims that information or material which You have submitted to Komodo Platform is in violation of any law or in breach of any third party rights (including, but not limited to, claims in respect of defamation, invasion of privacy, breach of confidence, infringement of copyright or infringement of any other intellectual property right).\n\n"),
        "eulaParagraphe15": MessageLookupByLibrary.simpleMessage(
            "In order to be completed, any Virtual Currency transaction created with the Komodo Platform must be confirmed and recorded in the Virtual Currency ledger associated with the relevant Virtual Currency network. Such networks are decentralized, peer-to-peer networks supported by independent third parties, which are not owned, controlled or operated by Komodo Platform.\nKomodo Platform has no control over any Virtual Currency network and therefore cannot and does not ensure that any transaction details You submit via our Services will be confirmed on the relevant Virtual Currency network. You agree and understand that the transaction details You submit via our Services may not be completed, or may be substantially delayed, by the Virtual Currency network used to process the transaction. We do not guarantee that the Wallet can transfer title or right in any Virtual Currency or make any warranties whatsoever with regard to title.\nOnce transaction details have been submitted to a Virtual Currency network, we cannot assist You to cancel or otherwise modify your transaction or transaction details. Komodo Platform has no control over any Virtual Currency network and does not have the ability to facilitate any cancellation or modification requests.\nIn the event of a Fork, Komodo Platform may not be able to support activity related to your Virtual Currency. You agree and understand that, in the event of a Fork, the transactions may not be completed, completed partially, incorrectly completed, or substantially delayed. Komodo Platform is not responsible for any loss incurred by You caused in whole or in part, directly or indirectly, by a Fork.\nIn no event shall Komodo Platform, its affiliates and service providers, or any of their respective officers, directors, agents, employees or representatives, be liable for any lost profits or any special, incidental, indirect, intangible, or consequential damages, whether based on contract, tort, negligence, strict liability, or otherwise, arising out of or in connection with authorized or unauthorized use of the services, or this agreement, even if an authorized representative of Komodo Platform has been advised of, has known of, or should have known of the possibility of such damages. \nFor example (and without limiting the scope of the preceding sentence), You may not recover for lost profits, lost business opportunities, or other types of special, incidental, indirect, intangible, or consequential damages. Some jurisdictions do not allow the exclusion or limitation of incidental or consequential damages, so the above limitation may not apply to You. \nWe will not be responsible or liable to You for any loss and take no responsibility for damages or claims arising in whole or in part, directly or indirectly from: (a) user error such as forgotten passwords, incorrectly constructed transactions, or mistyped Virtual Currency addresses; (b) server failure or data loss; (c) corrupted or otherwise non-performing Wallets or Wallet files; (d) unauthorized access to applications; (e) any unauthorized activities, including without limitation the use of hacking, viruses, phishing, brute forcing or other means of attack against the Services.\n\n"),
        "eulaParagraphe16": MessageLookupByLibrary.simpleMessage(
            "For the avoidance of doubt, Komodo Platform does not provide investment, tax or legal advice, nor does Komodo Platform broker trades on your behalf. All Komodo Platform trades are executed automatically, based on the parameters of your order instructions and in accordance with posted Trade execution procedures, and You are solely responsible for determining whether any investment, investment strategy or related transaction is appropriate for You based on your personal investment objectives, financial circumstances and risk tolerance. You should consult your legal or tax professional regarding your specific situation.Neither Komodo nor its owners, members, officers, directors, partners, consultants, nor anyone involved in the publication of this application, is a registered investment adviser or broker-dealer or associated person with a registered investment adviser or broker-dealer and none of the foregoing make any recommendation that the purchase or sale of crypto-assets or securities of any company profiled in the mobile Application is suitable or advisable for any person or that an investment or transaction in such crypto-assets or securities will be profitable. The information contained in the mobile Application is not intended to be, and shall not constitute, an offer to sell or the solicitation of any offer to buy any crypto-asset or security. The information presented in the mobile Application is provided for informational purposes only and is not to be treated as advice or a recommendation to make any specific investment or transaction. Please, consult with a qualified professional before making any decisions.The opinions and analysis included in this applications are based on information from sources deemed to be reliable and are provided “as is” in good faith. Komodo makes no representation or warranty, expressed, implied, or statutory, as to the accuracy or completeness of such information, which may be subject to change without notice. Komodo shall not be liable for any errors or any actions taken in relation to the above. Statements of opinion and belief are those of the authors and/or editors who contribute to this application, and are based solely upon the information possessed by such authors and/or editors. No inference should be drawn that Komodo or such authors or editors have any special or greater knowledge about the crypto-assets or companies profiled or any particular expertise in the industries or markets in which the profiled crypto-assets and companies operate and compete.Information on this application is obtained from sources deemed to be reliable; however, Komodo takes no responsibility for verifying the accuracy of such information and makes no representation that such information is accurate or complete. Certain statements included in this application may be forward-looking statements based on current expectations. Komodo makes no representation and provides no assurance or guarantee that such forward-looking statements will prove to be accurate.Persons using the Komodo application are urged to consult with a qualified professional with respect to an investment or transaction in any crypto-asset or company profiled herein. Additionally, persons using this application expressly represent that the content in this application is not and will not be a consideration in such persons’ investment or transaction decisions. Traders should verify independently information provided in the Komodo application by completing their own due diligence on any crypto-asset or company in which they are contemplating an investment or transaction of any kind and review a complete information package on that crypto-asset or company, which should include, but not be limited to, related blog updates and press releases.Past performance of profiled crypto-assets and securities is not indicative of future results. Crypto-assets and companies profiled on this site may lack an active trading market and invest in a crypto-asset or security that lacks an active trading market or trade on certain media, platforms and markets are deemed highly speculative and carry a high degree of risk. Anyone holding such crypto-assets and securities should be financially able and prepared to bear the risk of loss and the actual loss of his or her entire trade. The information in this application is not designed to be used as a basis for an investment decision. Persons using the Komodo application should confirm to their own satisfaction the veracity of any information prior to entering into any investment or making any transaction. The decision to buy or sell any crypto-asset or security that may be featured by Komodo is done purely and entirely at the reader’s own risk. As a reader and user of this application, You agree that under no circumstances will You seek to hold liable owners, members, officers, directors, partners, consultants or other persons involved in the publication of this application for any losses incurred by the use of information contained in this applicationKomodo and its contractors and affiliates may profit in the event the crypto-assets and securities increase or decrease in value. Such crypto-assets and securities may be bought or sold from time to time, even after Komodo has distributed positive information regarding the crypto-assets and companies. Komodo has no obligation to inform readers of its trading activities or the trading activities of any of its owners, members, officers, directors, contractors and affiliates and/or any companies affiliated with BC Relations’ owners, members, officers, directors, contractors and affiliates.Komodo and its affiliates may from time to time enter into agreements to purchase crypto-assets or securities to provide a method to reach their goals.\n\n"),
        "eulaParagraphe17": MessageLookupByLibrary.simpleMessage(
            "The Terms are effective until terminated by Komodo Platform. \nIn the event of termination, You are no longer authorized to access the Application, but all restrictions imposed on You and the disclaimers and limitations of liability set out in the Terms will survive termination. \nSuch termination shall not affect any legal right that may have accrued to Komodo Platform against You up to the date of termination. \nKomodo Platform may also remove the Application as a whole or any sections or features of the Application at any time. \n\n"),
        "eulaParagraphe18": MessageLookupByLibrary.simpleMessage(
            "The provisions of previous paragraphs are for the benefit of Komodo Platform and its officers, directors, employees, agents, licensors, suppliers, and any third party information providers to the Application. Each of these individuals or entities shall have the right to assert and enforce those provisions directly against You on its own behalf.\n\n"),
        "eulaParagraphe19": MessageLookupByLibrary.simpleMessage(
            "atomicDeFi mobile is a non-custodial, decentralized and blockchain based application and as such does Komodo Platform never store any user-data (accounts and authentication data). \nWe also collect and process non-personal, anonymized data for statistical purposes and analysis and to help us provide a better service.\n\nThis document was last updated on January 31st, 2020\n\n"),
        "eulaParagraphe2": MessageLookupByLibrary.simpleMessage(
            "This disclaimer applies to the contents and services of the app atomicDeFi and is valid for all users of the “Application” (\'Software\', “Mobile Application”, “Application” or “App”).\n\nThe Application is owned by Komodo Platform.\n\nWe reserve the right to amend the following Terms and Conditions (governing the use of the application “atomicDeFi mobile”) at any time without prior notice and at our sole discretion. It is your responsibility to periodically check this Terms and Conditions for any updates to these Terms, which shall come into force once published.\nYour continued use of the application shall be deemed as acceptance of the following Terms. \nWe are a company incorporated in Vietnam and these Terms and Conditions are governed by and subject to the laws of Vietnam. \nIf You do not agree with these Terms and Conditions, You must not use or access this software.\n\n"),
        "eulaParagraphe3": MessageLookupByLibrary.simpleMessage(
            "By entering into this User (each subject accessing or using the site) Agreement (this writing) You declare that You are an individual over the age of majority (at least 18 or older) and have the capacity to enter into this User Agreement and accept to be legally bound by the terms and conditions of this User Agreement, as incorporated herein and amended from time to time. \n\n"),
        "eulaParagraphe4": MessageLookupByLibrary.simpleMessage(
            "We may change the terms of this User Agreement at any time. Any such changes will take effect when published in the application, or when You use the Services.\n\n\nRead the User Agreement carefully every time You use our Services. Your continued use of the Services shall signify your acceptance to be bound by the current User Agreement. Our failure or delay in enforcing or partially enforcing any provision of this User Agreement shall not be construed as a waiver of any.\n\n"),
        "eulaParagraphe5": MessageLookupByLibrary.simpleMessage(
            "You are not allowed to decompile, decode, disassemble, rent, lease, loan, sell, sublicense, or create derivative works from the atomicDeFi mobile application or the user content. Nor are You allowed to use any network monitoring or detection software to determine the software architecture, or extract information about usage or individuals’ or users’ identities. \nYou are not allowed to copy, modify, reproduce, republish, distribute, display, or transmit for commercial, non-profit or public purposes all or any portion of the application or the user content without our prior written authorization.\n\n"),
        "eulaParagraphe6": MessageLookupByLibrary.simpleMessage(
            "If you create an account in the Mobile Application, you are responsible for maintaining the security of your account and you are fully responsible for all activities that occur under the account and any other actions taken in connection with it. You must immediately notify us of any unauthorized uses of your account or any other breaches of security. We will not be liable for any acts or omissions by you, including any damages of any kind incurred as a result of such acts or omissions. \n\n atomicDeFi mobile is a non-custodial wallet implementation and thus Komodo Platform can not access nor restore your account in case of (data) loss.\n\n"),
        "eulaParagraphe7": MessageLookupByLibrary.simpleMessage(
            "We are not responsible for seed-phrases residing in the Mobile Application. In no event shall we be held liable for any loss of any kind. It is your sole responsibility to maintain appropriate backups of your accounts and their seedprases.\n\n"),
        "eulaParagraphe8": MessageLookupByLibrary.simpleMessage(
            "You should not act, or refrain from acting solely on the basis of the content of this application. \nYour access to this application does not itself create an adviser-client relationship between You and us. \nThe content of this application does not constitute a solicitation or inducement to invest in any financial products or services offered by us. \nAny advice included in this application has been prepared without taking into account your objectives, financial situation or needs. You should consider our Risk Disclosure Notice before making any decision on whether to acquire the product described in that document.\n\n"),
        "eulaParagraphe9": MessageLookupByLibrary.simpleMessage(
            "We do not guarantee your continuous access to the application or that your access or use will be error-free. \nWe will not be liable in the event that the application is unavailable to You for any reason (for example, due to computer downtime ascribable to malfunctions, upgrades, server problems, precautionary or corrective maintenance activities or interruption in telecommunication supplies). \n\n"),
        "eulaTitle1": MessageLookupByLibrary.simpleMessage(
            "Son Kullanıcı Lisans Anlaşması (EULA), atomicDeFi mobil:\n\n"),
        "eulaTitle10":
            MessageLookupByLibrary.simpleMessage("ERİŞİM VE GÜVENLİK\n\n"),
        "eulaTitle11":
            MessageLookupByLibrary.simpleMessage("FİKRİ MÜLKİYET HAKLARI\n\n"),
        "eulaTitle12": MessageLookupByLibrary.simpleMessage("YASAL UYARI\n\n"),
        "eulaTitle13": MessageLookupByLibrary.simpleMessage(
            "TEMSİL VE GARANTİLER, TEMİNAT VE SORUMLULUK SINIRLAMALARI\n\n"),
        "eulaTitle14":
            MessageLookupByLibrary.simpleMessage("GENEL RİSK FAKTÖRLERİ\n\n"),
        "eulaTitle15": MessageLookupByLibrary.simpleMessage("TEMİNAT\n\n"),
        "eulaTitle16": MessageLookupByLibrary.simpleMessage(
            "CÜZDANA AİT RİSK AÇIKLAMALARI\n\n"),
        "eulaTitle17": MessageLookupByLibrary.simpleMessage(
            "YATIRIM TAVSİYESİ VEYA SİMSARLIK İÇERMEZ\n\n"),
        "eulaTitle18": MessageLookupByLibrary.simpleMessage("SON VERME\n\n"),
        "eulaTitle19":
            MessageLookupByLibrary.simpleMessage("ÜÇÜNCÜ TARAF HAKLARI\n\n"),
        "eulaTitle2": MessageLookupByLibrary.simpleMessage(
            "ŞARTLAR ve KOŞULLAR: (UYGULAMA KULLANICI SÖZLEŞMESİ)\n\n"),
        "eulaTitle20":
            MessageLookupByLibrary.simpleMessage("YASAL YÜKÜMLÜLÜKLERİMİZ\n\n"),
        "eulaTitle3": MessageLookupByLibrary.simpleMessage(
            "KULLANIM ŞARTLARI VE KOŞULLARI\n\n"),
        "eulaTitle4":
            MessageLookupByLibrary.simpleMessage("GENEL KULLANIM\n\n"),
        "eulaTitle5": MessageLookupByLibrary.simpleMessage("DEĞİŞİKLİKLER\n\n"),
        "eulaTitle6":
            MessageLookupByLibrary.simpleMessage("KULLANIM SINIRLAMALARI\n\n"),
        "eulaTitle7":
            MessageLookupByLibrary.simpleMessage("Hesaplar ve üyelik\n\n"),
        "eulaTitle8": MessageLookupByLibrary.simpleMessage("Yedekler\n\n"),
        "eulaTitle9": MessageLookupByLibrary.simpleMessage("GENEL UYARI\n\n"),
        "exampleHintSeed":
            MessageLookupByLibrary.simpleMessage("Örnek: build case level ..."),
        "exchangeTitle": MessageLookupByLibrary.simpleMessage("TAKAS"),
        "feedback":
            MessageLookupByLibrary.simpleMessage("Geri Bildirim Gönder"),
        "from": MessageLookupByLibrary.simpleMessage("Gönderici"),
        "getBackupPhrase": MessageLookupByLibrary.simpleMessage(
            "Önemli: Devam etmeden önce gizli kelimelerinizi güvenli bir şekilde yedekleyin!"),
        "goToPorfolio": MessageLookupByLibrary.simpleMessage("Portföye git"),
        "hintConfirmPassword":
            MessageLookupByLibrary.simpleMessage("Parolayı Onayla"),
        "hintCurrentPassword":
            MessageLookupByLibrary.simpleMessage("Mevcut parola"),
        "hintEnterPassword":
            MessageLookupByLibrary.simpleMessage("Parolanızı girin"),
        "hintEnterSeedPhrase":
            MessageLookupByLibrary.simpleMessage("Gizli kelimelerinizi girin"),
        "hintNameYourWallet":
            MessageLookupByLibrary.simpleMessage("Cüzdanınızı adlandırın"),
        "hintPassword": MessageLookupByLibrary.simpleMessage("Parola"),
        "history": MessageLookupByLibrary.simpleMessage("geçmiş"),
        "infoPasswordDialog": MessageLookupByLibrary.simpleMessage(
            "Eğer bir parola kullanmazsanız, cüzdanınıza erişebilmek için her defasında gizli kelimelerinizi girmeniz gerekir."),
        "infoTrade1": MessageLookupByLibrary.simpleMessage(
            "Takas talebi geri alınamaz ve nihai bir işlemdir!"),
        "infoTrade2": MessageLookupByLibrary.simpleMessage(
            "Bu işlem 10 dakikaya kadar sürebilir - Uygulamayı KAPATMAYIN!"),
        "infoWalletPassword": MessageLookupByLibrary.simpleMessage(
            "Cüzdanınızın güvenliğini parola ile sağlayabilirsiniz. Eğer parola kullanmazsanız, cüzdanınıza erişebilmek için her defasında gizli kelimelerinizi girmeniz gerekir."),
        "legalTitle": MessageLookupByLibrary.simpleMessage("Yasal"),
        "loading": MessageLookupByLibrary.simpleMessage("Yükleniyor..."),
        "loadingOrderbook":
            MessageLookupByLibrary.simpleMessage("Emir defteri yükleniyor..."),
        "lockScreen": MessageLookupByLibrary.simpleMessage("Ekran Kilitlendi"),
        "lockScreenAuth":
            MessageLookupByLibrary.simpleMessage("Lütfen doğrulayın!"),
        "login": MessageLookupByLibrary.simpleMessage("Giriş"),
        "logout": MessageLookupByLibrary.simpleMessage("Çıkış"),
        "logoutOnExit":
            MessageLookupByLibrary.simpleMessage("Kapanışta Çıkış Yap"),
        "logoutsettings":
            MessageLookupByLibrary.simpleMessage("Çıkış Ayarları"),
        "makeAorder": MessageLookupByLibrary.simpleMessage("bir emir girin"),
        "makerpaymentID":
            MessageLookupByLibrary.simpleMessage("Yapıcı Ödeme ID"),
        "marketplace": MessageLookupByLibrary.simpleMessage("Pazar"),
        "max": MessageLookupByLibrary.simpleMessage("MAKS"),
        "media": MessageLookupByLibrary.simpleMessage("Haberler"),
        "mediaBrowse": MessageLookupByLibrary.simpleMessage("GÖZAT"),
        "mediaBy": MessageLookupByLibrary.simpleMessage("Yazar:"),
        "mediaNotSavedDescription": MessageLookupByLibrary.simpleMessage(
            "KAYDEDİLMİŞ BİR MAKALENİZ YOK"),
        "networkFee": MessageLookupByLibrary.simpleMessage("Ağ ücreti"),
        "newAccount": MessageLookupByLibrary.simpleMessage("yeni hesap"),
        "newAccountUpper": MessageLookupByLibrary.simpleMessage("Yeni Hesap"),
        "newsFeed": MessageLookupByLibrary.simpleMessage("Haber akışı"),
        "next": MessageLookupByLibrary.simpleMessage("sonraki"),
        "noArticles": MessageLookupByLibrary.simpleMessage(
            "Haber yok - lütfen daha sonra kontrol edin!"),
        "noFunds": MessageLookupByLibrary.simpleMessage("Fon yok"),
        "noFundsDetected": MessageLookupByLibrary.simpleMessage(
            "Fon mevcut değil - lütfen para yatırın."),
        "noInternet":
            MessageLookupByLibrary.simpleMessage("İnternet Bağlantısı Yok"),
        "noOrder": m3,
        "noOrderAvailable": MessageLookupByLibrary.simpleMessage(
            "Emir oluşturmak için tıklayın"),
        "noRewardYet": MessageLookupByLibrary.simpleMessage(
            "Talep edebileceğiniz bir ödül mevcut değil - 1 saat içinde yeniden deneyin."),
        "noSwaps": MessageLookupByLibrary.simpleMessage("Geçmiş yok."),
        "noTxs": MessageLookupByLibrary.simpleMessage("İşlem Yok"),
        "notEnoughEth": MessageLookupByLibrary.simpleMessage(
            "İşlem için yeterli ETH bulunmuyor!"),
        "notEnoughtBalanceForFee": MessageLookupByLibrary.simpleMessage(
            "Takas masrafını karşılayacak bakiye bulunmuyor - daha küçük tutar deneyin"),
        "numberAssets": m4,
        "orderCreated":
            MessageLookupByLibrary.simpleMessage("Emir oluşturuldu"),
        "orderCreatedInfo":
            MessageLookupByLibrary.simpleMessage("Emir başarıyla oluşturuldu"),
        "orderMatched": MessageLookupByLibrary.simpleMessage("Emir eşleşti"),
        "orderMatching": MessageLookupByLibrary.simpleMessage("Emir eşleşiyor"),
        "orders": MessageLookupByLibrary.simpleMessage("emirler"),
        "paidWith": MessageLookupByLibrary.simpleMessage("Ödendi "),
        "placeOrder": MessageLookupByLibrary.simpleMessage("Emirleriniz"),
        "portfolio": MessageLookupByLibrary.simpleMessage("Portföy"),
        "price": MessageLookupByLibrary.simpleMessage("fiyat"),
        "receive": MessageLookupByLibrary.simpleMessage("AL"),
        "receiveLower": MessageLookupByLibrary.simpleMessage("Al"),
        "recommendSeedMessage": MessageLookupByLibrary.simpleMessage(
            "Çevrimdışı bir şekilde saklamanızı öneririz."),
        "requestedTrade":
            MessageLookupByLibrary.simpleMessage("Talep Edilen Alım Satım"),
        "restoreWallet": MessageLookupByLibrary.simpleMessage("RESTORE ET"),
        "security": MessageLookupByLibrary.simpleMessage("Güvenlik"),
        "seeOrders": m5,
        "seedPhraseTitle":
            MessageLookupByLibrary.simpleMessage("Yeni Gizli Kelimeleriniz"),
        "selectCoin": MessageLookupByLibrary.simpleMessage("Kriptopara seçin"),
        "selectCoinInfo": MessageLookupByLibrary.simpleMessage(
            "Portföyünüze eklemek istediğiniz kriptoparaları seçin."),
        "selectCoinTitle":
            MessageLookupByLibrary.simpleMessage("Kriptopara etkinleştir:"),
        "selectCoinToBuy": MessageLookupByLibrary.simpleMessage(
            "ALMAK istediğiniz kriptoparayı seçin"),
        "selectCoinToSell": MessageLookupByLibrary.simpleMessage(
            "SATMAK istediğiniz kriptoparayı seçin"),
        "selectPaymentMethod":
            MessageLookupByLibrary.simpleMessage("Ödeme Yönteminizi Seçin"),
        "sell": MessageLookupByLibrary.simpleMessage("Sat"),
        "send": MessageLookupByLibrary.simpleMessage("GÖNDER"),
        "setUpPassword": MessageLookupByLibrary.simpleMessage("PAROLA BELİRLE"),
        "settingDialogSpan1": MessageLookupByLibrary.simpleMessage(""),
        "settingDialogSpan2": MessageLookupByLibrary.simpleMessage(
            " cüzdanını silmek istediğinizden emin misiniz?"),
        "settingDialogSpan3":
            MessageLookupByLibrary.simpleMessage("Eğer eminseniz "),
        "settingDialogSpan4": MessageLookupByLibrary.simpleMessage(
            " daha sonra cüzdanınızı kurtarabilmeniz için"),
        "settingDialogSpan5": MessageLookupByLibrary.simpleMessage(
            " gizli kelimelerinizi kaydedin."),
        "settings": MessageLookupByLibrary.simpleMessage("Ayarlar"),
        "shareAddress": m6,
        "showMyOrders":
            MessageLookupByLibrary.simpleMessage("EMİRLERİMİ GÖSTER"),
        "signInWithPassword":
            MessageLookupByLibrary.simpleMessage("Parola ile giriş yap"),
        "signInWithSeedPhrase":
            MessageLookupByLibrary.simpleMessage("Gizli kelimelerle giriş yap"),
        "step": MessageLookupByLibrary.simpleMessage("Adım"),
        "success": MessageLookupByLibrary.simpleMessage("Başarılı!"),
        "swap": MessageLookupByLibrary.simpleMessage("takas"),
        "swapDetailTitle":
            MessageLookupByLibrary.simpleMessage("TAKAS DETAYLARINI ONAYLA"),
        "swapFailed": MessageLookupByLibrary.simpleMessage("Takas Başarısız"),
        "swapID": MessageLookupByLibrary.simpleMessage("Takas ID"),
        "swapOngoing":
            MessageLookupByLibrary.simpleMessage("Takas devam ediyor"),
        "swapSucceful": MessageLookupByLibrary.simpleMessage("Başarılı Takas"),
        "takerpaymentsID":
            MessageLookupByLibrary.simpleMessage("Alıcı Ödeme ID"),
        "timeOut": MessageLookupByLibrary.simpleMessage("Zaman Aşımı"),
        "titleCreatePassword":
            MessageLookupByLibrary.simpleMessage("PAROLA OLUŞTUR"),
        "to": MessageLookupByLibrary.simpleMessage("Alıcı"),
        "toAddress": MessageLookupByLibrary.simpleMessage("Adrese:"),
        "trade": MessageLookupByLibrary.simpleMessage("ALIM SATIM"),
        "tradeCompleted":
            MessageLookupByLibrary.simpleMessage("TAKAS TAMAMLANDI!"),
        "tradeDetail":
            MessageLookupByLibrary.simpleMessage("ALIM SATIM DETAYLARI"),
        "txBlock": MessageLookupByLibrary.simpleMessage("Blok"),
        "txConfirmations": MessageLookupByLibrary.simpleMessage("Onaylar"),
        "txConfirmed": MessageLookupByLibrary.simpleMessage("ONAYLANDI"),
        "txFee": MessageLookupByLibrary.simpleMessage("Ücret"),
        "unlock": MessageLookupByLibrary.simpleMessage("kilidi aç"),
        "value": MessageLookupByLibrary.simpleMessage("Değer: "),
        "viewSeed":
            MessageLookupByLibrary.simpleMessage("Kelimeleri Görüntüle"),
        "volumes": MessageLookupByLibrary.simpleMessage("Hacim"),
        "welcomeInfo": MessageLookupByLibrary.simpleMessage(
            "atomicDeFi mobil yerleşik üçüncü nesil DEX işlevselliği ve daha fazla özellikleri ile yeni nesil bir çoklu-kriptopara cüzdanıdır."),
        "welcomeLetSetUp":
            MessageLookupByLibrary.simpleMessage("HADİ AYARLAYALIM!"),
        "welcomeName": MessageLookupByLibrary.simpleMessage("atomicDeFi"),
        "welcomeTitle": MessageLookupByLibrary.simpleMessage("HOŞ GELDİN"),
        "welcomeWallet": MessageLookupByLibrary.simpleMessage("cüzdan"),
        "withdraw": MessageLookupByLibrary.simpleMessage("Çek"),
        "withdrawConfirm":
            MessageLookupByLibrary.simpleMessage("Çekimi Onayla"),
        "withdrawValue": m7,
        "wrongPassword": MessageLookupByLibrary.simpleMessage(
            "Parola eşleşmiyor. Lütfen tekrar deneyin."),
        "youAreSending":
            MessageLookupByLibrary.simpleMessage("Gönderiyorsunuz:"),
        "youWillReceiveClaim": m8,
        "youWillReceived": MessageLookupByLibrary.simpleMessage("Alacağınız: ")
      };
}