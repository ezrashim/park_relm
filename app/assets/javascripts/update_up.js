// $(document).ready(function() {
//   $(document).on('click', '#update-up', function(event){
//
//     event.preventDefault();
//
//     var vote_count = $('#update-vote-count');
//     var vote_count_arr = vote_count.text().split(": ");
//     var count_string = vote_count_arr[vote_count_arr.length - 1];
//     var current_count = parseInt(count_string, 10);
//     var content = {
//       vote : {
//         review_id : $(this).data("reviewId"),
//         park_id : $(this).data("parkId"),
//         user_id : $(this).data("userId"),
//         vote: "up"
//       }
//     };
//
//     var request = $.ajax({
//       method: "PATCH",
//       url: "/api/v1/votes/" + $(this).data('voteId'),
//       data: content,
//       dataType: "json"
//     });
//
//     var flash_message = $('#flash-div');
//
//     request.success(function(response) {
//       var count = current_count + 1;
//       var string = "vote count: " + count;
//       vote_count.text(string);
//       flash_string = response["flash"];
//       flash_message.text(flash_string);
//     });
//
//     request.fail(function(response) {
//       debugger;
//       flash_string = response["responseJSON"]["flash"];
//       flash_message.text(flash_string);
//       debugger;
//       var string = "vote count: " + current_count;
//       vote_count.text(string);
//       flash_string = "Now what..."
//       flash_message.text(flash_string);
//     });
//   });
//
//
//
//
//   $(document).on('click', '#update-down', function(event){
//     event.preventDefault();
//     var vote_count = $('#update-vote-count');
//     vote_count_arr = vote_count.text().split(": ");
//     var count_string = vote_count_arr[vote_count_arr.length - 1];
//     var current_count = parseInt(count_string, 10)
//     var content = {
//       vote : {
//         review_id : $(this).data("reviewId"),
//         park_id : $(this).data("parkId"),
//         user_id : $(this).data("userId"),
//         vote: "down"
//       }
//     };
//     var request = $.ajax({
//       method: "PATCH",
//       url: "/api/v1/votes/" + $(this).data('voteId'),
//       data: content,
//       dataType: "json"
//     });
//
//     var flash_message = $('#flash-div');
//
//     request.success(function(response) {
//       var count = current_count - 1;
//       var string = "vote count: " + count;
//       vote_count.text(string);
//       flash_string = response["flash"];
//       flash_message.text(flash_string);
//
//     });
//
//     request.fail(function(response) {
//       debugger;
//       flash_string = response["responseJSON"]["flash"];
//       flash_string = "what..."
//       flash_message.text(flash_string);
//     });
//   });
//
//
//   $(document).on('click', '#create-up', function(event){
//     event.preventDefault();
//     // debugger;
//     var vote_count = $('#create-vote-count');
//     vote_count_arr = vote_count.text().split(": ");
//     var count_string = vote_count_arr[vote_count_arr.length - 1];
//     var current_count = parseInt(count_string, 10)
//     var content = {
//       vote : {
//         review_id : $(this).data("reviewId"),
//         park_id : $(this).data("parkId"),
//         user_id : $(this).data("userId"),
//         vote: "up"
//       }
//     };
//     var request = $.ajax({
//       method: "POST",
//       url: "/api/v1/votes",
//       data: content,
//       dataType: "json"
//     });
//
//
//     var flash_message = $('#flash-div');
//     // var button_string = '.create-button-' + $(this).data("reviewId");
//     // var buttons = $(button_string);
//     var buttup = $('#create-up');
//     var buttdown = $('#create-down');
//
//     request.success(function(response) {
//       debugger;
//       var count = current_count + 1;
//       string = "vote count: " + count;
//       vote_count.text(string);
//       flash_string = response["flash"];
//       flash_message.text(flash_string);
//       // buttons.remove();
//       buttup.attr("id", "update-up");
//       buttdown.attr("id", "update-down");
//       // debugger;
//     });
//
//     request.fail(function(response) {
//       flash_string = response["responseJSON"]["flash"]
//       flash_message.text(flash_string);
//     });
//   });
//
//
//
//   $(document).on('click', '#create-down', function(event){
//     event.preventDefault();
//     var vote_count = $('#create-vote-count');
//     vote_count_arr = vote_count.text().split(": ");
//     var count_string = vote_count_arr[vote_count_arr.length - 1];
//     var current_count = parseInt(count_string, 10);
//     var content = {
//       vote : {
//         review_id : $(this).data("reviewId"),
//         park_id : $(this).data("parkId"),
//         user_id : $(this).data("userId"),
//         vote: "down"
//       }
//     };
//     var request = $.ajax({
//       method: "POST",
//       url: "/api/v1/votes",
//       data: content,
//       dataType: "json"
//     });
//
//     var flash_message = $('#flash-div');
//     var buttup = $('#create-up')
//     var buttdown = $('#create-down')
//
//
//     request.success(function(response) {
//       var count = current_count - 1;
//       string = "vote count: " + count;
//       vote_count.text(string);
//       flash_string = response["flash"];
//       flash_message.text(flash_string);
//       buttup.attr("id", "update-up");
//       buttdown.attr("id", "update-down");
//     });
//
//     request.fail(function(response) {
//       flash_string = response["responseJSON"]["flash"];
//       flash_message.text(flash_string);
//     });
//   });
// });
