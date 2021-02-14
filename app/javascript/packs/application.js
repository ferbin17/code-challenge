// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");

import "css/site";

import "bootstrap";

require("trix");
require("@rails/actiontext");

import { Application } from "stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers";

require("jquery")
import $ from 'jquery';
global.$ = $
global.jQuery = $

const application = Application.start();
const context = require.context("../controllers", true, /\.js$/);
application.load(definitionsFromContext(context));

window.show_previews = function(input) {
  $('#preview-grid-container').find('.unsaved-preview').remove();
  if (input.files) {
    $(input.files).each(function(i, file){
      var reader = new FileReader();

      // Create container
      var img_div = $("<div>", {
        class: "grid-item preview-grid unsaved-preview"
      }).appendTo('#preview-grid-container');
      
      // Create image tag
      var img_div = $("<img>", {
        class: "img_prev",
        src: "#",
        alt: "your image"
      }).appendTo(img_div);
      
      // Show image in img tag
      reader.onload = function (e) {
        $(img_div)
          .attr('src', e.target.result)
          .width(80)
          .height(100);
      };
      reader.readAsDataURL(file);
    })
  }
}


window.delete_image = function(div) {
  var response = confirm("Are you sure you want to delete?");
  if(response){
    var new_value = $('#product_images_to_be_deleted').val() + "," + $(div).attr("data-id");
    $('#product_images_to_be_deleted').val(new_value);
    $(div).remove();
    return true;
  }else{
    return false;
  }
}

$( document ).ready(function() {
  $('body').delegate(".number-field", "keypress", function(e){
    var keynum;
    if(window.event) { // IE                  
      keynum = e.keyCode;
    } else if(e.which){ // Netscape/Firefox/Opera                 
      keynum = e.which;
    }

    var reg = /[0-9, \.]/;
    if (!(reg.test(String.fromCharCode(keynum)))){
      return false;
    }else{
      if($(this).val() == ""){
        if ((/\./).test(String.fromCharCode(keynum))){
          return false;
        }
      }
    };
  });
})
