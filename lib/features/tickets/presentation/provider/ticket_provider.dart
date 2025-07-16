import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import 'package:tedx/features/tickets/data/repo/ticket_repo_impl.dart';

import '../../data/model/ticket_model.dart';
import '../../domain/usecase/book_ticket_usecase.dart';

class TicketProvider extends GetxController {
  final BookTicketUsecase _bookTicketUsecase;

  TicketProvider() : _bookTicketUsecase = BookTicketUsecase(TicketRepoImpl());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController studyController = TextEditingController();
  final TextEditingController whyAttendController = TextEditingController();

  void bookTicket() {
    final ticket = TicketModel(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      study: studyController.text,
      whyAttend: whyAttendController.text,
    );
    if (ticket.name.isEmpty ||
        ticket.email.isEmpty ||
        ticket.phone.isEmpty ||
        ticket.study.isEmpty ||
        ticket.whyAttend.isEmpty) {
      Get.snackbar("TEDxMillennium", "Please fill all the fields");
      return;
    }

    _bookTicketUsecase.call(ticket).then((e) {
      Get.snackbar(
        "TEDxMillennium",
        "Your ticket has been booked successfully!",
      );
      nameController.clear();
      emailController.clear();
      phoneController.clear();
      studyController.clear();
      whyAttendController.clear();
    });
  }

  ui.Image? combinedImage;
  bool loading = false;
  Future<void> generateImage() async {
    loading = true;
    update();
    final ticketData = await rootBundle.load('assets/images/ticket.jpg');
    final img = await overlayQrOnTicket(
      ticketData: ticketData,
      qrText: 'Ali Ahmed',
      qrSize: 130,
    );
    combinedImage = img;
    saveImage(img);
    // await composeEmail(
    //   attachmentPath: path,
    //   subject: "ss",
    //   body: "ss",
    //   recipient: "gara.xq@gmail.com",
    // );
    loading = false;
    update();
    loading = false;
    update();
  }

  Future<void> saveImage(ui.Image img) async {
    // final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
    // final bytes = byteData!.buffer.asUint8List();
    // File file = File("");

    // await composeEmail(
    //   attachmentPath: "",
    //   subject: "ss",
    //   body: "ss",
    //   recipient: "ali.ahmed.sayed77@gmail.com",
    // );
    await sendTicketByEmail(
      attachmentPath: "",
      subject: "ss",
      body: "ss",
      smtpUser: "ali.ahmed.sayed77@gmail.com",
      smtpPassword: "jdfpry56",
      recipient: "gara.xq@gmail.com",
    );
  }

  Future<ui.Image> overlayQrOnTicket({
    required ByteData ticketData,
    required String qrText,
    double qrSize = 150,
  }) async {
    final ticketImg = await decodeImageFromList(
      ticketData.buffer.asUint8List(),
    );

    final qrPainter = QrPainter(
      data: qrText,
      version: QrVersions.auto,
      gapless: true,
      color: Colors.black,
      emptyColor: Colors.white,
    );

    final qrData = await qrPainter.toImageData(qrSize);
    final qrImg = await decodeImageFromList(qrData!.buffer.asUint8List());

    final canvasW = ticketImg.width.toDouble();
    final canvasH = ticketImg.height.toDouble();
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder, Rect.fromLTWH(0, 0, canvasW, canvasH));

    canvas.drawImage(ticketImg, Offset.zero, Paint());
    canvas.drawImage(
      qrImg,
      Offset(
        canvasW - qrImg.width - 60, // Padding from right
        canvasH - qrImg.height - 85, // Padding from bottom
      ),
      Paint(),
    );

    return recorder.endRecording().toImage(canvasW.toInt(), canvasH.toInt());
  }

  Future<void> sendTicketByEmail({
    required String recipient,
    required String subject,
    required String body,
    required String attachmentPath, // path to 'ticket_with_qr.png'
    required String smtpUser,
    required String smtpPassword, // Gmail App Password
  }) async {
    final smtp = gmail(smtpUser, smtpPassword);
    final message =
        Message()
          ..from = Address(smtpUser, 'Your App Name')
          ..recipients.add(recipient)
          ..subject = subject
          ..text = body;

    try {
      var connection = PersistentConnection(smtp);
      await connection.send(message);

      // await   send(message, smtp);
      // log(report.toString());
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  // Future<void> composeEmail({
  //   required String recipient,
  //   required String subject,
  //   required String body,
  //   required String attachmentPath, // path to image
  // }) async {
  //   final email = Email(
  //     body: body,
  //     subject: subject,
  //     recipients: ['ali.ahmed.sayed77@gmail.com'],
  //     cc: ['gara.xq@gmail.com'],
  //     attachmentPaths: [attachmentPath],
  //     // isHTML: false,
  //   );

  //   try {
  //     await FlutterEmailSender.send(email);
  //     log(email.toString());
  //   } on Exception catch (e) {
  //     log(e.toString());
  //   }
  //   // Optional: after sending, delete the file or show feedback
  // }
}
