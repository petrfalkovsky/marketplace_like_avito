import '../../../index.dart';

class RatingUserModel {
  final List<ReviewUserModel> reviewsUserList;
  List<int> countsStars = [0, 0, 0, 0, 0];
  int reviewsSum = 0;
  double overallRating = 0.0;

  RatingUserModel({required this.reviewsUserList}) {
    this.reviewsUserList.forEach((reviews) {
      if (reviews.value >= 1 && reviews.value <= 5) {
        this.countsStars[reviews.value - 1]++;
        this.reviewsSum++;
      }
    });
    if (reviewsSum != 0)
      this.overallRating = (this.countsStars[0] +
              this.countsStars[1] * 2 +
              this.countsStars[2] * 3 +
              this.countsStars[3] * 4 +
              this.countsStars[4] * 5) /
          this.reviewsSum;
  }
}
