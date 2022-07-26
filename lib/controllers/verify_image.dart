class VerifyImage {
  String verifyImage(String imageName) {
    if (imageName == "null") {
      return "https://media.istockphoto.com/vectors/error-404-vector-id538038858";
    } else {
      return "https://image.tmdb.org/t/p/original/${imageName}";
    }
  }
}