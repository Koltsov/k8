// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require libs/jquery-3.3.1.min
//= require popper
//= require bootstrap-sprockets
//= require libs/jquery.skedTape
//= require rails-ujs
// = require activestorage
//= require_tree ./classes


//= require_tree .


// helpers
function today(hours, minutes) {
    var date = new Date();
    date.setUTCHours(hours, minutes, 0, 0);
    return date;
}
function yesterday(hours, minutes) {
    var date = today(hours, minutes);
    date.setTime(date.getTime() - 24 * 60 * 60 * 1000);
    return date;
}
function tomorrow(hours, minutes) {
    var date = today(hours, minutes);
    date.setTime(date.getTime() + 24 * 60 * 60 * 1000);
    return date;
}

// // events
// var events = [
//     {
//         name: 'Meeting 1',
//         location: 'london',
//         start: today(4, 15),
//         end: today(7, 30),
//         url: null,
//         class: '', // extra class
//         disabled: false, // is disabled?
//         data: {}, // data to set with $.data() method
//         userData: {} // custom data
//     },
//     {
//         name: 'Meeting 2',
//         location: 'london',
//         start: today(7, 30),
//         end: today(9, 15)
//     },
//     {
//         name: 'Meeting',
//         location: '1',
//         start: today(10, 0),
//         end: today(11, 30)
//     },
//     // more events here
// ];
//
// var locations = {
//     '1': 'San Francisco',
//     '2': 'Sydney',
//     '3': 'New York',
//     'london': 'London',
//     '5': 'Copenhagen',
//     '6': 'Berlin'
// };