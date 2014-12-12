$(document).ready(function () {
  $(".edit-song").on("click", function () {
    var $alb_id = $(this).data("albid"), $id = $(this).data("id"), $name = $(this).data("name"), $link = $(this).data("link");
    
    $(this).siblings(".make-edit").append("<form action='/albums/"+$alb_id+"/songs/edit/"+$id+"' method='post'><input type='text' name='name' value='"+$name+"'><input type='link' value='"+$link+"'><input type='submit'></form>");
    $(this).hide();
  });

  $(".delete-song").on("click", function () {
    var $alb_id = $(this).data("albid"), $id = $(this).data("id");
    $(this).siblings(".make-edit").append("<form action='/albums/"+$alb_id+"/songs/delete/"+$id+"' method='post'>Are you sure?<input type='submit' value='Yes'></form>");
    $(this).siblings(".make-edit").append("<button class='no-delete'>No</button>");
    $(this).hide()
  
    $(".no-delete").on("click", function () {
      var $path = $(this).parent().parent()
      $path.find(".delete-song").show();
      $path.find(".make-edit").find("form").remove();
      $path.find(".make-edit").find("button").remove();
    });
  });

  $(".clear-songs").on("click", function () {
    var $alb_id = $(this).data("id");
    window.location.replace($alb_id + "/songs/delete");
  });

  $(".delete-album").on("click", function () {
    var $alb_id = $(this).data("id");
    window.location.replace($alb_id + "/delete")
  });
});
