int CalculateReadingTime(String  content){
final wordsCount =content.split(RegExp(r'\s')).length;
print(wordsCount);
final readingTime=wordsCount/225;
return readingTime.ceil();
}