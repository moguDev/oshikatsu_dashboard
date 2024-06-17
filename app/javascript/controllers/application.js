import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

//= require jquery.datetimepicker
// 日本語化対応用
$.datetimepicker.setLocale('ja');

// datetimepickerクラスにdatetimepickerを適用する。
$('.datetimepicker').datetimepicker();

export { application }
