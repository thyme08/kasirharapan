class FeedbackForm {
  String _name;
  String _npm;
  String _nilai1;
  String _nilai2;

  FeedbackForm(this._name, this._npm, this._nilai1, this._nilai2);

  // Method to make GET parameters.
  String toParams() => "?name=$_name&npm=$_npm&nilai1=$_nilai1&nilai2=$_nilai2";
}
