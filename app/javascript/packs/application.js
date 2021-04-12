// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('jquery')

$(function() {
    var Accordion = function(el, multiple) {
    this.el = el || {};
    this.multiple = multiple || false;
    var links = this.el.find('.link');
    links.on('click', {el: this.el, multiple: this.multiple}, this.dropdown)
    }
    Accordion.prototype.dropdown = function(e) {
    var $el = e.data.el;
        $this = $(this),
        $next = $this.next();
        $next.slideToggle();
        $this.parent().toggleClass('open');
    
        if (!e.data.multiple) {
        $el.find('.submenu').not($next).slideUp().parent().removeClass('open');
    };
    } 
    var accordion = new Accordion($('#accordion'), false);
});