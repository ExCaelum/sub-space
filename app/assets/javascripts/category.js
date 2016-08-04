$(document).ready(function(){

  $("#create-category").on('click', function(){
    var categoryName = $("#category-name").val()
    $.ajax({
      url: "/api/v1/categories",
      method: "POST",
      dataType: "JSON",
      data: {name: categoryName},
      success: function(newCategory){
        $("#categories").append(
          "<div class='category' data-post-id='" + newCategory.id + "'>" + newCategory.name + "<div id='cat-badge-" + newCategory.id + "'>" + 0 + "</div><br><br></div>"
        );
        $(".dropdown-menu").append(
          "<a class='dropdown-item category-option' data-category-id='" + newCategory.id + "' href='#'>" + newCategory.name + "</a><br>"
        );
      }
    })

  })

  $(".dropdown-menu").on('click', ".category-option", function(){
    var categoryId = $(this).data("category-id")
    var subscriptionId = $(this).parent().data("subscription-id")
    $.ajax({
      url: "/api/v1/subscriptions/" + subscriptionId,
      method: "PATCH",
      dataType: "JSON",
      data: {category_id: categoryId},
      success: function(newSubscription){
        console.log(newSubscription);
        var val = $("#cat-badge-" + newSubscription.category_id).text()
        val = parseInt(val)+1
        $("#cat-badge-" + newSubscription.category_id).html(val)
        $("#sub-" + newSubscription.id).hide();

      }
    })
  })

});
