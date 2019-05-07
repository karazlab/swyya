$(function(){
  if(project_liked){
    $('#dislike_btn').show();
    $('#like_btn').hide();
  } else {
    $('#dislike_btn').hide();
    $('#like_btn').show();
  }
});

$(function(){
  if(project_active){
    $('#hide').show();
    $('#active').hide();
  } else {
    $('#hide').hide();
    $('#active').show();
  }
});

function likeProject(){
  var url = '/projects/' + project_id + '/like';
  $.ajax({
    url: url,
    dataType: 'JSON',
    method: 'POST',
    success: function(data){
      $('#dislike_btn').show();
      $('#like_btn').hide();
      $('#likes_counter').text(data.data.counts);
    }
  });
}

function dislikeProject(){
  var url = '/projects/' + project_id + '/dislike';
  $.ajax({
    url: url,
    dataType: 'JSON',
    method: 'POST',
    success: function(data){
      $('#dislike_btn').hide();
      $('#like_btn').show();
      $('#likes_counter').text(data.data.counts);
    }
  });
}

function activateProject(){
  var url = '/projects/' + project_id + '/active';
  $.ajax({
    url: url,
    dataType: 'JSON',
    method: 'POST',
    success: function(data){
      $('#hide').show();
      $('#active').hide();
      project_active = data.data.active;
    }
  });
}

function hideProject(){
  var url = '/projects/' + project_id + '/hide';
  $.ajax({
    url: url,
    dataType: 'JSON',
    method: 'POST',
    success: function(data){
      $('#hide').hide();
      $('#active').show();
      project_active = data.data.active;
    }
  });
}

$(function(){
  $('#source-from-github').change(function() {
    if($(this).is(":checked")) {
      $('#swyya-source-project').hide();
      $('#resourceable').removeClass('badge-primary');
      $('#resourceable').addClass('badge-success');
    } else {
      $('#resourceable').addClass('badge-primary');
      $('#resourceable').removeClass('badge-success');
      $('#swyya-source-project').show();
    }  
  });
});
