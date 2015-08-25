var userlang = navigator.language;

var langs = ["cs", "de", "en", "fr", "ru"]

langs.forEach(function(lang) {
  if (userlang.substring(0,2) == lang) {
    self.location="/"+lang;
  }
})
