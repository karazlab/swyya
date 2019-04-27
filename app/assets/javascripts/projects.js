$('#like_btn').on('click', function(){
  var url = '/projets/' + project_id + '/like';
  $.ajax({
    url: url,
    dataType: 'JSON',
    method: 'POST',
    success: function (result) {
      $('#dislike_btn').show();
      $('#like_btn').hide();
      var counter = parseInt($('#likes_counter').text()) + 1;
      $('#likes_counter').text(counter);
    },
    error: function (error) {
    }
  });
});

$('#dislike_btn').on('click', function(){
  var url = '/projets/' + project_id + '/dislike';
  $.ajax({
    url: url,
    dataType: 'JSON',
    method: 'POST',
    success: function (result) {
      $('#like_btn').show();
      $('#dislike_btn').hide();
      var counter = parseInt($('#likes_counter').text()) - 1;
      $('#likes_counter').text(counter);
    },
    error: function (error) {
    }
  });
});