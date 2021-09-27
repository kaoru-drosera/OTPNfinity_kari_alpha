require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")


import "bootstrap"

// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// import Rails from "@rails/ujs"
// import Turbolinks from "turbolinks"
// import * as ActiveStorage from "@rails/activestorage"
// import "channels"
//
// Rails.start()
// Turbolinks.start()
// ActiveStorage.start()

//= require audiojs


//= require jquery
//= require jquery


//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require jquery.jscroll.min.js
//= require swiper-bundle

$(window).on('scroll', function() {
  scrollHeight = $(document).height();
  scrollPosition = $(window).height() + $(window).scrollTop();
  if ( (scrollHeight - scrollPosition) / scrollHeight <= 0.15) {
    $('.jscroll').jscroll({
      contentSelector: '.scroll-list',
      nextSelector: 'span.next:last a'
    });
  }
});

// ヘルプ
var swiper = new Swiper('.swiper-container',{
  navigation:{
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev'
  },
  pagination: {
	    el: '.swiper-pagination',
	    type: 'bullets',
			clickable: true
  }
});




// クリックで値を変更


// config.assets.precompile << "index_script.js.erb"







//= require_tree .
