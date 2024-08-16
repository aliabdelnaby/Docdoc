import 'package:docdoc/core/utils/assets.dart';
import 'package:docdoc/features/messages/data/models/message_item_model.dart';

List<MessageItemModel> messagesList = [
  MessageItemModel(
    name: 'Dr. Randy Wigham',
    specialization: "General Doctor",
    degree: "Specialist",
    image: Assets.imagesDoctor1,
    message:
        "Fine, I'll do a check. Does the patient have a history of certain diseases?",
    isUnread: true,
    time: '7:11 PM',
    numberOfUnreadMessages: '2',
  ),
  MessageItemModel(
    name: 'Dr. Jack Sulivan',
    specialization: "Neurologic",
    degree: "Consultant",
    image: Assets.imagesDoctor2,
    message:
        "Sure, I will review the results. Has the patient experienced chest pain recently?",
    isUnread: true,
    time: '9:30 PM',
    numberOfUnreadMessages: '1',
  ),
  MessageItemModel(
    name: 'Dr. Hanna Stanton',
    specialization: "Pediatric",
    degree: "Specialist",
    image: Assets.imagesDoctor5,
    message:
        "Let's proceed with the examination. Has the child had any recent fever or rashes?",
    isUnread: false,
    time: '10:25 PM',
    numberOfUnreadMessages: '2',
  ),
  MessageItemModel(
    name: 'Dr. Emery Lubin',
    specialization: "Radiology",
    degree: "Consultant",
    image: Assets.imagesDoctor9,
    message:
        "I'll provide the prescription. Has the skin condition worsened since the last visit?",
    isUnread: false,
    time: '9:44 PM',
    numberOfUnreadMessages: '1',
  ),
  MessageItemModel(
    name: 'Michael Huang',
    specialization: "General Doctor",
    degree: "Consultant",
    image: Assets.imagesDoctor4,
    message:
        "I will check the lab results. Has the patient had any changes in blood sugar levels recently?",
    isUnread: false,
    time: '12:52 PM',
    numberOfUnreadMessages: '1',
  ),
];
