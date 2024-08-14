import 'package:docdoc/core/utils/assets.dart';
import 'package:docdoc/features/home/data/models/static/doctor_review_model.dart';

List<DoctorReviewModel> doctorReviewList = [
  DoctorReviewModel(
    name: 'Jane Cooper',
    image: Assets.imagesReview1,
    rating: 5,
    description:
        "The doctors on this app are truly impressive. They are not only knowledgeable but also incredibly patient and understanding. It feels like you're talking to a trusted friend who happens to be a medical expert.",
    time: 'Today',
  ),
  DoctorReviewModel(
    name: 'Leslie Alexander',
    image: Assets.imagesReview2,
    rating: 5,
    description:
        "Couldn't agree more! I was pleasantly surprised by the quality of care on this app. Doctors are top-notch.",
    time: 'Today',
  ),
  DoctorReviewModel(
    name: 'Robert Fox',
    image: Assets.imagesReview3,
    rating: 4,
    description:
        "I was initially skeptical about using a telemedicine app but this app has exceeded my expectations. The doctors are highly qualified and provide excellent care.",
    time: 'Yesterday',
  ),
  DoctorReviewModel(
    name: 'Jacob Jones',
    image: Assets.imagesReview4,
    rating: 4,
    description:
        "I used to think telemedicine was just for hypochondriacs. Boy, was I wrong! This app has saved me countless trips to the doctor's office (and awkward waiting room conversations).",
    time: '2 days ago',
  ),
];
