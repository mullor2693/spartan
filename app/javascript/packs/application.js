// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// include jQuery in global and window scope (so you can access it globally)
// in your web browser, when you type $('.div'), it is actually refering to global.$('.div')
import jQuery from 'jquery';
global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;

global.toastr = require("toastr");
global.UIkit = require('uikit');
global.Icons = require("packs/uikit-icons");
UIkit.use(Icons);

require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('jquery')
require("chartkick")
require("chart.js")

// Import Select2
import 'select2'
import 'select2/dist/css/select2.css'
// Import Rails
import Rails from "@rails/ujs";
if (Rails.fire(document, "rails:attachBindings")) {
  Rails.start();
}
// Import styles from js plugins
import "../stylesheets/application"


